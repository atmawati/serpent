
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

char *plain[]=
{ "00000000000000000000000000000000" };

char *keys[]=
{ "80000000000000000000000000000000" };

char *cipher[]=
{ "264E5481EFF42A4606ABDA06C0BFDA3D" };

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
  uint8_t ct1[32], ct2[32], pt[32], key[64];
  
  memset (ct1, 0, sizeof ct1);
  memset (ct2, 0, sizeof ct2);
  memset (pt,  0, sizeof pt);
  memset (key, 0, sizeof key);
  
  hex2bin (ct1, cipher[0]);
  hex2bin (pt, plain[0]);
  hex2bin (key, keys[0]);
  
  serpent_set_key (key, 128);
  serpent_encrypt (pt, ct2);
  
  if (memcmp (ct2, ct1, 16) == 0) {
    printf ("\nSelf-test OK");
  }
  
  return 0;
}
