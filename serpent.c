

// SERPENT in C
// Odzhan

#include <stdint.h>
#include <string.h>

#include "serpent.h"

// xor dst blk by src
void blkxor (serpent_blk *dst, serpent_blk *src)
{
  uint8_t i;

  for (i=0; i<SERPENT_BLK_LEN/4; i++) {
    dst->v32[i] ^= src->v32[i];
  }
}

// copy src blk to dst
void blkcpy (serpent_blk *dst, serpent_blk *src)
{
  uint8_t i;

  for (i=0; i<SERPENT_BLK_LEN/4; i++) {
    dst->v32[i] = src->v32[i];
  }
}

// clear block
void blkclr (serpent_blk *blk)
{
  uint8_t i;

  for (i=0; i<SERPENT_BLK_LEN; i++) {
    blk->v32[i] = 0;
  }
}

uint8_t sbox[]= 
{ 0x38, 0xF1, 0xA6, 0x5B, 0xED, 0x42, 0x70, 0x9C,
  0xFC, 0x27, 0x90, 0x5A, 0x1B, 0xE8, 0x6D, 0x34, 
  0x86, 0x79, 0x3C, 0xAF, 0xD1, 0xE4, 0x0B, 0x52,
  0x0F, 0xB8, 0xC9, 0x63, 0xD1, 0x24, 0xA7, 0x5E,
  0x1F, 0x83, 0xC0, 0xB6, 0x25, 0x4A, 0x9E, 0x7D,
  0xF5, 0x2B, 0x4A, 0x9C, 0x03, 0xE8, 0xD6, 0x71,
  0x72, 0xC5, 0x84, 0x6B, 0xE9, 0x1F, 0xD3, 0xA0,
  0x1D, 0xF0, 0xE8, 0x2B, 0x74, 0xCA, 0x93, 0x56,
  /* now the inverted sboxes */
  0xD3, 0xB0, 0xA6, 0x5C, 0x1E, 0x47, 0xF9, 0x82,
  0x58, 0x2E, 0xF6, 0xC3, 0xB4, 0x79, 0x1D, 0xA0,
  0xC9, 0xF4, 0xBE, 0x12, 0x03, 0x6D, 0x58, 0xA7,
  0x09, 0xA7, 0xBE, 0x6D, 0x35, 0xC2, 0x48, 0xF1,
  0x50, 0x83, 0xA9, 0x7E, 0x2C, 0xB6, 0x4F, 0xD1,
  0x8F, 0x29, 0x41, 0xDE, 0xB6, 0x53, 0x7C, 0xA0,
  0xFA, 0x1D, 0x53, 0x60, 0x49, 0xE7, 0x2C, 0x8B,
  0x30, 0x6D, 0x9E, 0xF8, 0x5C, 0xB7, 0xA1, 0x42 };
 
#define SHR_O(a) cy=(a)&1; ((a) = (a)>>1)
#define SHR_I(a) ((a) = (cy ? 0x80 : 0x00) | ((a) >> 1))

void serpent_ip (serpent_blk *in, serpent_blk *out) 
{
	uint8_t cy;  // carry 
	uint8_t n, m;
  
	blkclr (out);
  
	for (n=0; n<16; n++) {
		for (m=0; m<8; m++) {
		  SHR_O(in->v32[m & 3]);
		  SHR_I(out->v8[n]);
		}
	}
}

#undef SHR_I
#define SHR_I(a) ((a) = (cy ? 0x80000000L : 0x00L)| ((a) >> 1))

void serpent_fp (serpent_blk *in, serpent_blk *out) 
{
	uint8_t cy; // carry 
	uint8_t n, m;
  
	blkclr (out);
  
	for (n=0; n<4; n++) {
		for (m=0; m<32; m++) {
		  SHR_O(in->v32[n]);
		  SHR_I(out->v32[m & 3]);
		}
	}
}

/******************************************************************************/
void sbox128 (serpent_blk *blk, uint8_t box, int type) 
{
  serpent_blk sb, o;
	uint8_t i, t, x;
  
  box &= 7;
  
  if (type==SERPENT_DECRYPT) {
    box |= 8;
  }
	box &= 0x0f;
  
	/* load sbox */
	for (i=0; i<8; i++) {
		t = sbox[i+box*8];

		sb.v8[2*i+0]=t >> 4;
		sb.v8[2*i+1]=t & 0xf;
	}
  
	serpent_ip (w, o);
	
	for (i=0; i<16; i++) {
    t = o.v8[i];
		x = sb.v8[t >> 4];
		x <<= 4;
		x |= sb.v8[t & 0xf];
		o.v8[i] = x;
	}
	serpent_fp (o, w);
}

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

uint32_t serpent_gen_w (uint32_t * b, uint8_t i) {
	uint32_t ret;
	ret = b[0] ^ b[3] ^ b[5] ^ b[7] ^ GOLDEN_RATIO ^ (uint32_t)i;
	return ROL32(ret, 11);
} 

void serpent_setkey (SERPENT_KEY *key, void *input, uint32_t inlen) 
{
	uint32_t buf[8];
	uint8_t  i, j;
  
  // valid key sizes are 128, 192 or 256
  memset (buf, 0, sizeof (buf));
  memcpy (buf, input, inlen/8);
  
  // pad if less than 256-bits
  if (keylen < SERPENT_KEY256) {
    ((uint8_t*)buf)[inlen] |= 1 << ((inlen*8) % 8);
  }

	for (i=0; i<=SERPENT_ROUNDS; i++) {
		for (j=0; j<4; j++) {
			key->k[i][j] = serpent_gen_w (buf, i*4+j);
      // shift buffer one to the "left"
			memmove (buf, &(buf[1]), 7*4); 
			buf[7] = key->k[i][j];
		}
	}
	for (i=0; i<=SERPENT_ROUNDS; i++) {
		sbox128 (&key->k[i], 3 - i, SERPENT_ENCRYPT);
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
