# An attempt to make the `base` version of GHC 9.10.2 usable with GHC 9.12.2

GHC 9.10.2 comes with `base-4.20.1.0`. We have made an attempt to
construct a variant of this `base` version that can be compiled not only
with GHC 9.10.2 but also with GHC 9.12.2 and whose interface is only
little influenced by the choice of GHC version. This page documents this
work and important findings gained through it.

## The initial version

As a first step, we took a copy of `base-4.20.1.0`, increased its
version number to `4.20.1.1`, and modified it such that in the end it
could be compiled by both GHC 9.10.2 and GHC 9.12.2. The resulting
`base` variant, which we call the initial version, and data associated
with it are available in the folder [`initial`](initial).

We wanted to investigate with the help of Tobias Dammers’s [`print-api`
fork](https://github.com/tdammers/print-api) how the interface of the
initial `base` version changes when switching from GHC 9.10.2 to
GHC 9.12.2. However, it turned out to be impossible to run `print-api`
using GHC 9.10.2 on a `base` version other than `base-4.20.1.0`,
GHC 9.10.2’s native one. Given that the interface of `base-4.20.1.1` on
GHC 9.10.2 should be identical to the interface of `base-4.20.1.0`, we
decided to use the latter instead of the former in our investigation.
Consequently, we ran `print-api` on `base-4.20.1.0` using GHC 9.10.2 and
on `base-4.20.1.1` using GHC 9.12.2.

Some differences in the outputs that we gained from the `print-api` runs
were only due to different GHC versions rendering interfaces slightly
differently. To reduce the amount of such spurious differences, we
processed each of the two `print-api` outputs with a script called
[`cook`](initial/interfaces/cook), whose contents are as follows:

```sh
#! /usr/bin/env sh

sed -E -e '
    s/(ghc-internal|base)-[0-9.]+://g
    s/\[0\]//g
'
```

Finally, we ran `diff` on the two processed outputs and inspected the
result.

In the following, we list the interface features of `base-4.20.1.1` on
GHC 9.12.2 that are not present in `base-4.20.1.0` on GHC 9.10.2:

  * There are the following class instances:
      - `Monad a => MonadFix ((,) a)`
      - `Show (UAddr p)`
  * `ErrorCallWithLocation` is deprecated, and, when used in patterns,
    location arguments of it are always undefined.
  * `ioError` has a `HasCallStack` constraint.
  * The handler argument of `catchAny` has a `HasExceptionContext`
    constraint.
  * There are the following operations that check for weak pinning of
    byte arrays:
      - `isByteArrayWeaklyPinned#`
      - `isMutableByteArrayWeaklyPinned#`
  * There are many additional SIMD operations. They are listed
    [below](#additional-simd-operations-with-ghc9122).
  * `flip` is representation-polymorphic in the result type.
  * `HasField` is representation-polymorphic in both of its argument
    types.
  * `GHC.Base` and `GHC.Exts` do not export `seq#`, at least according
    to `print-api`.
  * `HpcFlags` has a field `readTixFile`.
  * The `ioManager` field of `MiscFlags` has type `IoManagerFlag`
    instead of `IoSubSystem`.
  * The data constructors of `IoSubSystem` are hidden.
  * `IoSubSystem` is not an instance of `Storable`.

### Additional SIMD operations with GHC 9.12.2

The additional SIMD operations are the following:

    fmaddDoubleX2# :: DoubleX2# -> DoubleX2# -> DoubleX2# -> DoubleX2#
    fmaddDoubleX4# :: DoubleX4# -> DoubleX4# -> DoubleX4# -> DoubleX4#
    fmaddDoubleX8# :: DoubleX8# -> DoubleX8# -> DoubleX8# -> DoubleX8#
    fmaddFloatX16# :: FloatX16# -> FloatX16# -> FloatX16# -> FloatX16#
    fmaddFloatX4# :: FloatX4# -> FloatX4# -> FloatX4# -> FloatX4#
    fmaddFloatX8# :: FloatX8# -> FloatX8# -> FloatX8# -> FloatX8#
    fmsubDoubleX2# :: DoubleX2# -> DoubleX2# -> DoubleX2# -> DoubleX2#
    fmsubDoubleX4# :: DoubleX4# -> DoubleX4# -> DoubleX4# -> DoubleX4#
    fmsubDoubleX8# :: DoubleX8# -> DoubleX8# -> DoubleX8# -> DoubleX8#
    fmsubFloatX16# :: FloatX16# -> FloatX16# -> FloatX16# -> FloatX16#
    fmsubFloatX4# :: FloatX4# -> FloatX4# -> FloatX4# -> FloatX4#
    fmsubFloatX8# :: FloatX8# -> FloatX8# -> FloatX8# -> FloatX8#
    fnmaddDoubleX2# :: DoubleX2# -> DoubleX2# -> DoubleX2# -> DoubleX2#
    fnmaddDoubleX4# :: DoubleX4# -> DoubleX4# -> DoubleX4# -> DoubleX4#
    fnmaddDoubleX8# :: DoubleX8# -> DoubleX8# -> DoubleX8# -> DoubleX8#
    fnmaddFloatX16# :: FloatX16# -> FloatX16# -> FloatX16# -> FloatX16#
    fnmaddFloatX4# :: FloatX4# -> FloatX4# -> FloatX4# -> FloatX4#
    fnmaddFloatX8# :: FloatX8# -> FloatX8# -> FloatX8# -> FloatX8#
    fnmsubDoubleX2# :: DoubleX2# -> DoubleX2# -> DoubleX2# -> DoubleX2#
    fnmsubDoubleX4# :: DoubleX4# -> DoubleX4# -> DoubleX4# -> DoubleX4#
    fnmsubDoubleX8# :: DoubleX8# -> DoubleX8# -> DoubleX8# -> DoubleX8#
    fnmsubFloatX16# :: FloatX16# -> FloatX16# -> FloatX16# -> FloatX16#
    fnmsubFloatX4# :: FloatX4# -> FloatX4# -> FloatX4# -> FloatX4#
    fnmsubFloatX8# :: FloatX8# -> FloatX8# -> FloatX8# -> FloatX8#
    maxDouble# :: Double# -> Double# -> Double#
    maxDoubleX2# :: DoubleX2# -> DoubleX2# -> DoubleX2#
    maxDoubleX4# :: DoubleX4# -> DoubleX4# -> DoubleX4#
    maxDoubleX8# :: DoubleX8# -> DoubleX8# -> DoubleX8#
    maxFloat# :: Float# -> Float# -> Float#
    maxFloatX16# :: FloatX16# -> FloatX16# -> FloatX16#
    maxFloatX4# :: FloatX4# -> FloatX4# -> FloatX4#
    maxFloatX8# :: FloatX8# -> FloatX8# -> FloatX8#
    maxInt16X16# :: Int16X16# -> Int16X16# -> Int16X16#
    maxInt16X32# :: Int16X32# -> Int16X32# -> Int16X32#
    maxInt16X8# :: Int16X8# -> Int16X8# -> Int16X8#
    maxInt32X16# :: Int32X16# -> Int32X16# -> Int32X16#
    maxInt32X4# :: Int32X4# -> Int32X4# -> Int32X4#
    maxInt32X8# :: Int32X8# -> Int32X8# -> Int32X8#
    maxInt64X2# :: Int64X2# -> Int64X2# -> Int64X2#
    maxInt64X4# :: Int64X4# -> Int64X4# -> Int64X4#
    maxInt64X8# :: Int64X8# -> Int64X8# -> Int64X8#
    maxInt8X16# :: Int8X16# -> Int8X16# -> Int8X16#
    maxInt8X32# :: Int8X32# -> Int8X32# -> Int8X32#
    maxInt8X64# :: Int8X64# -> Int8X64# -> Int8X64#
    maxWord16X16# :: Word16X16# -> Word16X16# -> Word16X16#
    maxWord16X32# :: Word16X32# -> Word16X32# -> Word16X32#
    maxWord16X8# :: Word16X8# -> Word16X8# -> Word16X8#
    maxWord32X16# :: Word32X16# -> Word32X16# -> Word32X16#
    maxWord32X4# :: Word32X4# -> Word32X4# -> Word32X4#
    maxWord32X8# :: Word32X8# -> Word32X8# -> Word32X8#
    maxWord64X2# :: Word64X2# -> Word64X2# -> Word64X2#
    maxWord64X4# :: Word64X4# -> Word64X4# -> Word64X4#
    maxWord64X8# :: Word64X8# -> Word64X8# -> Word64X8#
    maxWord8X16# :: Word8X16# -> Word8X16# -> Word8X16#
    maxWord8X32# :: Word8X32# -> Word8X32# -> Word8X32#
    maxWord8X64# :: Word8X64# -> Word8X64# -> Word8X64#
    minDouble# :: Double# -> Double# -> Double#
    minDoubleX2# :: DoubleX2# -> DoubleX2# -> DoubleX2#
    minDoubleX4# :: DoubleX4# -> DoubleX4# -> DoubleX4#
    minDoubleX8# :: DoubleX8# -> DoubleX8# -> DoubleX8#
    minFloat# :: Float# -> Float# -> Float#
    minFloatX16# :: FloatX16# -> FloatX16# -> FloatX16#
    minFloatX4# :: FloatX4# -> FloatX4# -> FloatX4#
    minFloatX8# :: FloatX8# -> FloatX8# -> FloatX8#
    minInt16X16# :: Int16X16# -> Int16X16# -> Int16X16#
    minInt16X32# :: Int16X32# -> Int16X32# -> Int16X32#
    minInt16X8# :: Int16X8# -> Int16X8# -> Int16X8#
    minInt32X16# :: Int32X16# -> Int32X16# -> Int32X16#
    minInt32X4# :: Int32X4# -> Int32X4# -> Int32X4#
    minInt32X8# :: Int32X8# -> Int32X8# -> Int32X8#
    minInt64X2# :: Int64X2# -> Int64X2# -> Int64X2#
    minInt64X4# :: Int64X4# -> Int64X4# -> Int64X4#
    minInt64X8# :: Int64X8# -> Int64X8# -> Int64X8#
    minInt8X16# :: Int8X16# -> Int8X16# -> Int8X16#
    minInt8X32# :: Int8X32# -> Int8X32# -> Int8X32#
    minInt8X64# :: Int8X64# -> Int8X64# -> Int8X64#
    minWord16X16# :: Word16X16# -> Word16X16# -> Word16X16#
    minWord16X32# :: Word16X32# -> Word16X32# -> Word16X32#
    minWord16X8# :: Word16X8# -> Word16X8# -> Word16X8#
    minWord32X16# :: Word32X16# -> Word32X16# -> Word32X16#
    minWord32X4# :: Word32X4# -> Word32X4# -> Word32X4#
    minWord32X8# :: Word32X8# -> Word32X8# -> Word32X8#
    minWord64X2# :: Word64X2# -> Word64X2# -> Word64X2#
    minWord64X4# :: Word64X4# -> Word64X4# -> Word64X4#
    minWord64X8# :: Word64X8# -> Word64X8# -> Word64X8#
    minWord8X16# :: Word8X16# -> Word8X16# -> Word8X16#
    minWord8X32# :: Word8X32# -> Word8X32# -> Word8X32#
    minWord8X64# :: Word8X64# -> Word8X64# -> Word8X64#
    shuffleDoubleX2# :: DoubleX2# -> DoubleX2# -> (# Int#, Int# #) -> DoubleX2#
    shuffleDoubleX4# :: DoubleX4# -> DoubleX4# -> (# Int#, Int#, Int#, Int# #) -> DoubleX4#
    shuffleDoubleX8# :: DoubleX8# -> DoubleX8# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> DoubleX8#
    shuffleFloatX16# :: FloatX16# -> FloatX16# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> FloatX16#
    shuffleFloatX4# :: FloatX4# -> FloatX4# -> (# Int#, Int#, Int#, Int# #) -> FloatX4#
    shuffleFloatX8# :: FloatX8# -> FloatX8# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> FloatX8#
    shuffleInt16X16# :: Int16X16# -> Int16X16# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Int16X16#
    shuffleInt16X32# :: Int16X32# -> Int16X32# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Int16X32#
    shuffleInt16X8# :: Int16X8# -> Int16X8# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Int16X8#
    shuffleInt32X16# :: Int32X16# -> Int32X16# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Int32X16#
    shuffleInt32X4# :: Int32X4# -> Int32X4# -> (# Int#, Int#, Int#, Int# #) -> Int32X4#
    shuffleInt32X8# :: Int32X8# -> Int32X8# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Int32X8#
    shuffleInt64X2# :: Int64X2# -> Int64X2# -> (# Int#, Int# #) -> Int64X2#
    shuffleInt64X4# :: Int64X4# -> Int64X4# -> (# Int#, Int#, Int#, Int# #) -> Int64X4#
    shuffleInt64X8# :: Int64X8# -> Int64X8# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Int64X8#
    shuffleInt8X16# :: Int8X16# -> Int8X16# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Int8X16#
    shuffleInt8X32# :: Int8X32# -> Int8X32# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Int8X32#
    shuffleInt8X64# :: Int8X64# -> Int8X64# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Int8X64#
    shuffleWord16X16# :: Word16X16# -> Word16X16# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Word16X16#
    shuffleWord16X32# :: Word16X32# -> Word16X32# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Word16X32#
    shuffleWord16X8# :: Word16X8# -> Word16X8# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Word16X8#
    shuffleWord32X16# :: Word32X16# -> Word32X16# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Word32X16#
    shuffleWord32X4# :: Word32X4# -> Word32X4# -> (# Int#, Int#, Int#, Int# #) -> Word32X4#
    shuffleWord32X8# :: Word32X8# -> Word32X8# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Word32X8#
    shuffleWord64X2# :: Word64X2# -> Word64X2# -> (# Int#, Int# #) -> Word64X2#
    shuffleWord64X4# :: Word64X4# -> Word64X4# -> (# Int#, Int#, Int#, Int# #) -> Word64X4#
    shuffleWord64X8# :: Word64X8# -> Word64X8# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Word64X8#
    shuffleWord8X16# :: Word8X16# -> Word8X16# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Word8X16#
    shuffleWord8X32# :: Word8X32# -> Word8X32# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Word8X32#
    shuffleWord8X64# :: Word8X64# -> Word8X64# -> (# Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int#, Int# #) -> Word8X64#

## The improved version

Based on the analysis of the initial version, we made some changes to
`base-4.20.1.1` in order to elide some of the interface deviations that
showed up when using GHC 9.12.2. The resulting version and data
associated with it are available in the folder [`improved`](improved).

The following interface deviations remained:

  * There are the following class instances:
      - `Monad a => MonadFix ((,) a)`
      - `Show (UAddr p)`
  * `ErrorCallWithLocation` is deprecated, and, when used in patterns,
    location arguments of it are always undefined.
  * `ioError` has a `HasCallStack` constraint.
  * The handler argument of `catchAny` has a `HasExceptionContext`
    constraint.
  * `HasField` is representation-polymorphic in both of its argument
    types.
  * `HpcFlags` has a field `readTixFile`.
  * The `ioManager` field of `MiscFlags` has type `IoManagerFlag`
    instead of `IoSubSystem`.
  * The data constructors of `IoSubSystem` are hidden.
  * `IoSubSystem` is not an instance of `Storable`.
