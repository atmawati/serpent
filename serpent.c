

// SERPENT in C
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

// copy src blk to dst
void blkcpy (serpent_blk *dst, serpent_blk *src) {
  uint8_t i;

  for (i=0; i<SERPENT_BLK_LEN/4; i++) {
    dst->v32[i] = src->v32[i];
  }
}

// clear block
void blkclr (serpent_blk *blk) {
  uint8_t i;

  for (i=0; i<SERPENT_BLK_LEN/4; i++) {
    blk->v32[i] = 0;
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

#define SHR_O(a) cy=(a) & 1; ((a) = (a) >> 1)
#define SHR_I(a) ((a) = (cy ? 0x80 : 0x00) | ((a) >> 1))

void serpent_ip (serpent_blk *in, serpent_blk *out) 
{
  uint8_t cy;   // carry 
  uint8_t n, m;
  
  blkclr (out);
  
  for (n=0; n<16; n++) {
    for (m=0; m<8; m++) {
      SHR_O(in->v32[m % 4]);
      SHR_I(out->v8[n]);
    }
  }
}

#undef SHR_I
#define SHR_I(a) ((a) = (cy ? 0x80000000L : 0x00L)| ((a) >> 1))

void serpent_fp (serpent_blk *in, serpent_blk *out) 
{
  uint8_t cy;   // carry 
  uint8_t n, m;
  
  blkclr (out);
  
  for (n=0; n<4; n++) {
    for (m=0; m<32; m++) {
      SHR_O(in->v32[n]);
      SHR_I(out->v32[m % 4]);
    }
  }
}

/******************************************************************************/

void serpent_lt (serpent_blk* x, int type) 
{
  uint32_t x0, x1, x2, x3;
  
  // load
  x0=x->v32[0];
  x1=x->v32[1];
  x2=x->v32[2];
  x3=x->v32[3];
  
  if (type==SERPENT_ENCRYPT) {
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
  } else {
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
  }
  // save
  x->v32[0]=x0;
  x->v32[1]=x1;
  x->v32[2]=x2;
  x->v32[3]=x3;
}

uint32_t serpent_gen_w (uint32_t *b, uint32_t i) {
  uint32_t ret;
  ret = b[0] ^ b[3] ^ b[5] ^ b[7] ^ GOLDEN_RATIO ^ i;
  return ROL32(ret, 11);
} 

void sbox128 (serpent_blk *blk, uint8_t box_idx, int type) 
{
  serpent_blk tmp_blk, sb;
  uint8_t *sbp;
  uint8_t i, x, t;
  
  box_idx &= 7;
  
  if (type==SERPENT_ENCRYPT) {
    sbp=(uint8_t*)&sbox[box_idx][0];
  } else {
    sbp=(uint8_t*)&sbox_inv[box_idx][0];
  }
  
  for (i=0; i<8; i++) {
    t = sbp[i];
    sb.v8[2*i+0] = t >> 4;
    sb.v8[2*i+1] = t & 0xf;
  }
  
  serpent_ip (blk, &tmp_blk);
  
  for (i=0; i<SERPENT_BLK_LEN; i++) {
    t = tmp_blk.v8[i];
    x = sb.v8[t >> 4];
    x <<= 4;
    x |= sb.v8[t & 0xf];
    tmp_blk.v8[i] = x;
  }
  serpent_fp (&tmp_blk, blk);
}

void serpent_setkey (SERPENT_KEY *key, void *input, uint32_t inlen) 
{
  union {
    uint8_t v8[32];
    uint32_t v32[8];
  } x;
  
  uint8_t i, j;
  
  memset (&x, 0, sizeof (x));
  memcpy (x.v8, input, inlen);
  
  // pad if less than 256-bits
  if (inlen < SERPENT_KEY256) {
    x.v8[inlen] |= 1 << ((inlen*8) % 8);
  }

  for (i=0; i<=SERPENT_ROUNDS; i++) {
    for (j=0; j<4; j++) {
      key->x[i].v32[j] = serpent_gen_w (x.v32, i*4+j);
      
      // shift buffer one to the "left"
      memmove (x.v32, &x.v32[1], 7*4);
      x.v32[7] = key->x[i].v32[j];
    }
  }
  for (i=0; i<=SERPENT_ROUNDS; i++) {
    sbox128 (&key->x[i], 3 - i, SERPENT_ENCRYPT);
  }
}

void serpent_enc (SERPENT_KEY *key, void *pt, void *ct)
{
  uint8_t i;
  serpent_blk *in=pt;
  serpent_blk *out=ct;
  
  // copy plaintext to ciphertext buffer
  blkcpy (out, in);
  
  for (i=0; i<SERPENT_ROUNDS; i++) {
    // xor with subkey
    blkxor (out, &key->x[i]);
    // apply sbox
    sbox128 (out, i, SERPENT_ENCRYPT);
    // if last round, xor
    if (i==SERPENT_ROUNDS-1) {
      blkxor (out, &key->x[i+1]);
    } else {
      // else 
      serpent_lt (out, SERPENT_ENCRYPT);
    }
  }
}

void serpent_dec (SERPENT_KEY *key, void *ct, void *pt) 
{
  int8_t i;
  serpent_blk *in=ct;
  serpent_blk *out=pt;
  
  // copy ciphertext to plaintext buffer
  blkcpy (out, in);
  
  for (i=SERPENT_ROUNDS-1; i>=0; --i) {
    if (i==SERPENT_ROUNDS-1) {
      // xor with sub key
      blkxor (out, &key->x[i+1]);
    } else {
      serpent_lt (out, SERPENT_DECRYPT);
    }
    // apply sbox
    sbox128 (out, i, SERPENT_DECRYPT);
    // xor with subkey
    blkxor (out, &key->x[i]);
  }
}
