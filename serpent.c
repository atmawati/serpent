/* serpent.c */
/*
    This file is part of the AVR-Crypto-Lib.
    Copyright (C) 2008  Daniel Otte (daniel.otte@rub.de)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
/* serpent.c
 * a bitsliced implementation of the serpent cipher for avr microcontrollers
 * author: Daniel Otte 
 * email:  daniel.otte@rub.de
 * license: GPLv3
 */
 
// minor changes made by Odzhan to make it more compact

#include <stdint.h>
#include <string.h>

#include "serpent.h"

// xor dst blk by src
void blkxor (serpent_blk *dst, serpent_key *src, int idx) {
  uint8_t i;
  serpent_blk *p=(serpent_blk*)&src->x[idx];
  
  for (i=0; i<SERPENT_BLK_LEN/4; i++) {
    dst->v32[i] ^= p->v32[i];
  }
}

uint8_t sbox[8][8] = 
{ { 0x83, 0x1F, 0x6A, 0xB5, 0xDE, 0x24, 0x07, 0xC9 },
  { 0xCF, 0x72, 0x09, 0xA5, 0xB1, 0x8E, 0xD6, 0x43 },
  { 0x68, 0x97, 0xC3, 0xFA, 0x1D, 0x4E, 0xB0, 0x25 },
  { 0xF0, 0x8B, 0x9C, 0x36, 0x1D, 0x42, 0x7A, 0xE5 },
  { 0xF1, 0x38, 0x0C, 0x6B, 0x52, 0xA4, 0xE9, 0xD7 },
  { 0x5F, 0xB2, 0xA4, 0xC9, 0x30, 0x8E, 0x6D, 0x17 },
  { 0x27, 0x5C, 0x48, 0xB6, 0x9E, 0xF1, 0x3D, 0x0A },
  { 0xD1, 0x0F, 0x8E, 0xB2, 0x47, 0xAC, 0x39, 0x65 }
};

uint8_t sbox_inv[8][8] =
{ { 0x3D, 0x0B, 0x6A, 0xC5, 0xE1, 0x74, 0x9F, 0x28 },
  { 0x85, 0xE2, 0x6F, 0x3C, 0x4B, 0x97, 0xD1, 0x0A },
  { 0x9C, 0x4F, 0xEB, 0x21, 0x30, 0xD6, 0x85, 0x7A },
  { 0x90, 0x7A, 0xEB, 0xD6, 0x53, 0x2C, 0x84, 0x1F },
  { 0x05, 0x38, 0x9A, 0xE7, 0xC2, 0x6B, 0xF4, 0x1D },
  { 0xF8, 0x92, 0x14, 0xED, 0x6B, 0x35, 0xC7, 0x0A },
  { 0xAF, 0xD1, 0x35, 0x06, 0x94, 0x7E, 0xC2, 0xB8 },
  { 0x03, 0xD6, 0xE9, 0x8F, 0xC5, 0x7B, 0x1A, 0x24 }
};

// initial/final permutation
void permute (serpent_blk *out, 
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
    sb.v8[i+0] = LO_NIBBLE(t);
    sb.v8[i+1] = HI_NIBBLE(t);
  }
  
  permute (&tmp_blk, blk, SERPENT_IP);
  
  for (i=0; i<SERPENT_BLK_LEN; i++) {
    t = tmp_blk.v8[i];
    tmp_blk.v8[i] = (sb.v8[HI_NIBBLE(t)] << 4) | sb.v8[LO_NIBBLE(t)];
  }
  permute (blk, &tmp_blk, SERPENT_FP);
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
      key->x[i][j] = serpent_gen_w (s_ws.v32, i*4+j);
      memmove (&s_ws.v8, &s_ws.v8[4], 7*4);
      s_ws.v32[7] = key->x[i][j];
    }
    sbox128 ((serpent_blk*)&key->x[i], 3 - i, SERPENT_ENCRYPT);
  }
}

void serpent_encrypt (void *in, serpent_key *key, int enc)
{
  int8_t i;
  serpent_blk *out=in;
  
  if (enc==SERPENT_DECRYPT)
  {
    i=SERPENT_ROUNDS;
    blkxor (out, key, i);
    for (;;) {
      --i;
      // apply sbox
      sbox128 (out, i, SERPENT_DECRYPT);
      // xor with subkey
      blkxor (out, key, i);
      if (i==0) break;
      // linear transformation
      serpent_lt (out, SERPENT_DECRYPT);
    }
  } else {
    i=0;
    for (;;) {
      // xor with subkey
      blkxor (out, key, i);
      // apply sbox
      sbox128 (out, i, SERPENT_ENCRYPT);
      if (++i == SERPENT_ROUNDS) break;
      // linear transformation
      serpent_lt (out, SERPENT_ENCRYPT);
    }
    blkxor (out, key, i);
  }
}

