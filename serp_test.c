

// SERPENT in C
// Odzhan

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <ctype.h>

#include "serpent.h"

char *plain[]=
{ "00000000000000000000000000000000",
  "4528CACCB954D450655E8CFD71CBFAC7",
  "3DA46FFA6F4D6F30CD258333E5A61369"
};

char *keys[]=
{ "80000000000000000000000000000000",
  "000102030405060708090A0B0C0D0E0F1011121314151617",
  "000102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F" 
};

char *cipher[]=
{ "264E5481EFF42A4606ABDA06C0BFDA3D",
  "00112233445566778899AABBCCDDEEFF",
  "00112233445566778899AABBCCDDEEFF"  
};

size_t hex2bin (void *bin, char hex[]) {
  size_t len, i;
  int x;
  uint8_t *p=(uint8_t*)bin;
  
  len = strlen (hex);
  
  if ((len & 1) != 0) {
    return 0; 
  }
  
  for (i=0; i<len; i++) {
    if (isxdigit((int)hex[i]) == 0) {
      return 0; 
    }
  }
  
  for (i=0; i<len / 2; i++) {
    sscanf (&hex[i * 2], "%2x", &x);
    p[i] = (uint8_t)x;
  } 
  return len / 2;
} 

int main (int argc, char *argv[])
{
  uint8_t ct1[32], ct2[32], pt1[32], pt2[32], key[64];
  int klen, plen, clen, i;
  SERPENT_KEY serpent_key;
  
  for (i=0; i<3; i++) {
    clen=hex2bin (ct1, cipher[i]);
    plen=hex2bin (pt1, plain[i]);
    klen=hex2bin (key, keys[i]);
  
    // set key 
    serpent_setkeyx (&serpent_key, key, klen);
    // encrypt
    serpent_enc (ct2, pt1, &serpent_key);
  
    if (memcmp (ct1, ct2, clen) == 0) {
      printf ("\n\nSelf-test for key length %i OK", klen);
      serpent_dec (pt2, ct2, &serpent_key);
      if (memcmp (pt1, pt2, plen) == 0) {
        printf ("\nDecryption okay for key length %i", klen);
      }
    } else {
      printf ("\nSelf-test for key length %i failed\n", klen);
    }
  }
  return 0;
}
