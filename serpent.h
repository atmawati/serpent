

// SERPENT-256 in C
// Odzhan

#ifndef SERPENT_H
#define SERPENT_H

#include <stdint.h>

#define GOLDEN_RATIO    0x9e3779b9l

#define SERPENT_ROUNDS  32
#define SERPENT_BLK_LEN 16
#define SERPENT_KEY256  32

#define SERPENT_ENCRYPT  0
#define SERPENT_DECRYPT  1

#define SERPENT_IP       0
#define SERPENT_FP       1

typedef union _serpent_blk_t {
  uint8_t v8[SERPENT_BLK_LEN];
  uint32_t v32[SERPENT_BLK_LEN/4];
  uint64_t v64[SERPENT_BLK_LEN/2];
} serpent_blk;

typedef uint32_t serpent_subkey_t[4];

typedef struct serpent_key_t {
  serpent_subkey_t x[SERPENT_ROUNDS+1];
} serpent_key;

#define ROL32(a, n)(((a) << (n)) | (((a) & 0xffffffff) >> (32 - (n))))
#define ROR32(a, n)((((a) & 0xffffffff) >> (n)) | ((a) << (32 - (n))))

#ifdef __cplusplus
extern "C" {
#endif

  // x86 asm
  void serpent_setkeyx (serpent_key*, void*);  
  void serpent_encryptx (void*, serpent_key*, int);
  
  // C code
  void serpent_setkey (serpent_key*, void*);  
  void serpent_encrypt (void*, serpent_key*, int);

#ifdef __cplusplus
}
#endif

#ifdef USE_ASM
  #define serpent_setkey(x,y) serpent_setkeyx(x,y)
  #define serpent_encrypt(x,y,z) serpent_encryptx(x,y,z)
#endif

#endif
