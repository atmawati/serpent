


// SERPENT-256 in C
// Odzhan

#include <stdint.h>
#include <string.h>

#include "serpent.h"

// xor dst blk by src
void blkxor (serpent_blk *dst, serpent_blk *src) {
  uint8_t i;

  for (i=0; i<SERPENT_BLK_LEN/4; i++) {
    dst->v32[i] ^= src->v32[i];
  }
}

uint8_t sbox[8][8] = 
{ { 0x38, 0xF1, 0xA6, 0x5B, 0xED, 0x42, 0x70, 0x9C },
  { 0xFC, 0x27, 0x90, 0x5A, 0x1B, 0xE8, 0x6D, 0x34 }, 
  { 0x86, 0x79, 0x3C, 0xAF, 0xD1, 0xE4, 0x0B, 0x52 },
  { 0x0F, 0xB8, 0xC9, 0x63, 0xD1, 0x24, 0xA7, 0x5E },
  { 0x1F, 0x83, 0xC0, 0xB6, 0x25, 0x4A, 0x9E, 0x7D },
  { 0xF5, 0x2B, 0x4A, 0x9C, 0x03, 0xE8, 0xD6, 0x71 },
  { 0x72, 0xC5, 0x84, 0x6B, 0xE9, 0x1F, 0xD3, 0xA0 },
  { 0x1D, 0xF0, 0xE8, 0x2B, 0x74, 0xCA, 0x93, 0x56 }
};

uint8_t sbox_inv[8][8] =
{ { 0xD3, 0xB0, 0xA6, 0x5C, 0x1E, 0x47, 0xF9, 0x82 },
  { 0x58, 0x2E, 0xF6, 0xC3, 0xB4, 0x79, 0x1D, 0xA0 },
  { 0xC9, 0xF4, 0xBE, 0x12, 0x03, 0x6D, 0x58, 0xA7 },
  { 0x09, 0xA7, 0xBE, 0x6D, 0x35, 0xC2, 0x48, 0xF1 },
  { 0x50, 0x83, 0xA9, 0x7E, 0x2C, 0xB6, 0x4F, 0xD1 },
  { 0x8F, 0x29, 0x41, 0xDE, 0xB6, 0x53, 0x7C, 0xA0 },
  { 0xFA, 0x1D, 0x53, 0x60, 0x49, 0xE7, 0x2C, 0x8B },
  { 0x30, 0x6D, 0x9E, 0xF8, 0x5C, 0xB7, 0xA1, 0x42 }
};

// initial/final permutation
void serpent_perm (serpent_blk *out, 
  serpent_blk *in, int type) 
{
  uint8_t cy;   // carry 
  uint8_t n, m;
  
  for (n=0; n<SERPENT_BLK_LEN/4; n++) {
    out->v32[n]=0;
  }
  
  // initial
  if (type==SERPENT_IP)
  {
    for (n=0; n<16; n++) {
      for (m=0; m<8; m++) {
        cy = in->v32[m%4] & 1;
        in->v32[m%4] >>= 1;
        out->v8[n] = (cy << 7) | (out->v8[n] >> 1);
      }
    }
  } else {
    // final
    for (n=0; n<4; n++) {
      for (m=0; m<32; m++) {
        cy = in->v32[n] & 1;
        in->v32[n] >>= 1;
        out->v32[m%4] = (cy << 31) | (out->v32[m%4] >> 1);
      }
    }
  }
}

#define HI_NIBBLE(b) (((b) >> 4) & 0x0F)
#define LO_NIBBLE(b) ((b) & 0x0F)

uint32_t serpent_gen_w (uint32_t *b, uint32_t i) {
  uint32_t ret;
  ret = b[0] ^ b[3] ^ b[5] ^ b[7] ^ GOLDEN_RATIO ^ i;
  return ROL32(ret, 11);
} 

// substitution box
void sbox128 (serpent_blk *blk, uint32_t box_idx, int type) 
{
  serpent_blk tmp_blk, sb;
  uint8_t *sbp;
  uint8_t i, t;
  
  box_idx &= 7;
  
  if (type==SERPENT_ENCRYPT) {
    sbp=(uint8_t*)&sbox[box_idx][0];
  } else {
    sbp=(uint8_t*)&sbox_inv[box_idx][0];
  }
  
  for (i=0; i<16; i+=2) {
    t = sbp[i/2];
    sb.v8[i+0] = HI_NIBBLE(t);
    sb.v8[i+1] = LO_NIBBLE(t);
  }
  
  serpent_perm (&tmp_blk, blk, SERPENT_IP);
  
  for (i=0; i<SERPENT_BLK_LEN; i++) {
    t = tmp_blk.v8[i];
    tmp_blk.v8[i] = (sb.v8[HI_NIBBLE(t)] << 4) | sb.v8[LO_NIBBLE(t)];
  }
  serpent_perm (blk, &tmp_blk, SERPENT_FP);
}

// linear transformation
void serpent_lt (serpent_blk* x, int enc) 
{
  uint32_t x0, x1, x2, x3;
  
  // load
  x0=x->v32[0];
  x1=x->v32[1];
  x2=x->v32[2];
  x3=x->v32[3];
  
  if (enc==SERPENT_DECRYPT) {
    x2 = ROL32(x2, 10);
    x0 = ROR32(x0, 5);
    x2 ^= x3 ^ (x1 << 7);
    x0 ^= x1 ^ x3;
    x3 = ROR32(x3, 7);
    x1 = ROR32(x1, 1);
    x3 ^= x2 ^ (x0 << 3);
    x1 ^= x0 ^ x2;
    x2 = ROR32(x2,  3);
    x0 = ROR32(x0, 13);
  } else {
    x0 = ROL32(x0, 13);
    x2 = ROL32(x2,  3);
    x1 ^= x0 ^ x2;
    x3 ^= x2 ^ (x0 << 3);
    x1 = ROL32(x1, 1);
    x3 = ROL32(x3, 7);
    x0 ^= x1 ^ x3;
    x2 ^= x3 ^ (x1 << 7);
    x0 = ROL32(x0, 5);
    x2 = ROR32(x2, 10);
  }
  // save
  x->v32[0]=x0;
  x->v32[1]=x1;
  x->v32[2]=x2;
  x->v32[3]=x3;
}

// create serpent keys. only 256-bit is supported
void serpent_setkey (serpent_key *key, void *input) 
{
  union {
    uint8_t v8[32];
    uint32_t v32[8];
  } s_ws;
  
  uint32_t i, j;
  
  // copy key input to local buffer
  for (i=0; i<SERPENT_KEY256; i++) {
    s_ws.v8[i] = ((uint8_t*)input)[i];
  }

  // expand the key
  for (i=0; i<=SERPENT_ROUNDS; i++) {
    for (j=0; j<4; j++) {
      key->x[i].v32[j] = serpent_gen_w (s_ws.v32, i*4+j);
      memmove (&s_ws.v8, &s_ws.v8[4], 7*4);
      s_ws.v32[7] = key->x[i].v32[j];
    }
    sbox128 (&key->x[i], 3 - i, SERPENT_ENCRYPT);
  }
}

void serpent_encrypt (void *in, serpent_key *key, int enc)
{
  int8_t i;
  serpent_blk *out=in;
  
  if (enc==SERPENT_DECRYPT)
  {
    for (i=SERPENT_ROUNDS; i>0; --i) {
      if (i==SERPENT_ROUNDS) {
        // xor with sub key
        blkxor (out, &key->x[i]);
      } else {
        // linear transformation
        serpent_lt (out, SERPENT_DECRYPT);
      }
      // apply sbox
      sbox128 (out, i-1, SERPENT_DECRYPT);
      // xor with subkey
      blkxor (out, &key->x[i-1]);
    }
  } else {
    for (i=0; i<SERPENT_ROUNDS; i++) {
      // xor with subkey
      blkxor (out, &key->x[i]);
      // apply sbox
      sbox128 (out, i, SERPENT_ENCRYPT);
      // if last round, xor
      if (i==SERPENT_ROUNDS-1) {
        blkxor (out, &key->x[SERPENT_ROUNDS]);
      } else { 
        // linear transformation
        serpent_lt (out, SERPENT_ENCRYPT);
      }
    }
  }
}
