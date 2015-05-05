

// SERPENT in C
// Odzhan

#ifndef SERPENT_H
#define SERPENT_H

#include <stdint.h>

#define GOLDEN_RATIO    0x9e3779b9l

#define SERPENT_ROUNDS  32
#define SERPENT_BLK_LEN 16

#define SERPENT_KEY128  16
#define SERPENT_KEY192  24
#define SERPENT_KEY256  32

#define SERPENT_ENCRYPT  0
#define SERPENT_DECRYPT  1

typedef union _serpent_blk_t {
  uint8_t v8[SERPENT_BLK_LEN];
  uint32_t v32[SERPENT_BLK_LEN/4];
  uint64_t v64;
} serpent_blk;

typedef struct serpent_key_t {
  serpent_blk x[SERPENT_ROUNDS+1];
} SERPENT_KEY;

#define ROL32(a, n)(((a) << (n)) | (((a) & 0xffffffff) >> (32 - (n))))
#define ROR32(a, n)((((a) & 0xffffffff) >> (n)) | ((a) << (32 - (n))))

#ifdef BIGENDIAN
# define SWAP32(n) (n)
#else
# define SWAP32(n) \
  ROR32((((n & 0xFF00FF00) >> 8) | ((n & 0x00FF00FF) << 8)), 16)
#endif

#ifdef __cplusplus
extern "C" {
#endif

  void serpent_setkey (SERPENT_KEY*, void*, uint32_t);
  void serpent_enc (SERPENT_KEY*, void*, void*);
  void serpent_dec (SERPENT_KEY*, void*, void*);

#ifdef __cplusplus
}
#endif

#endif
