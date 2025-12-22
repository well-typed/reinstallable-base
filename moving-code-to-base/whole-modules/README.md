# An attempt to move module implementations that are not tied to GHC into `base`

When `ghc-internal` was introduced, all or at least most of the
implementation code that had been residing in `base` so far was moved to
`ghc-internal`. However, a good deal of this code is better placed in
`base`, since it is not tied to GHC: it does not use GHC-specific
features, it does not provide entities that GHC treats specially, and it
is not needed by code that is tied to GHC itself.

We have checked which `base` modules have implementations that in full
are not tied to GHC, with the goal of moving such implementations from
`ghc-internal` to `base`. For our check, we have considered the `base`
and `ghc-internal` versions that were at the head of the GHC repository
around mid-December 2025. We have conducted this check using human
judgment with the help of some machine assistance for dependency
checking. We do not guarantee full correctness of our results but
believe that they are pretty precise.

The outcome of our check is that all `base` modules whose
implementations are not tied to GHC are already implemented in `base`
alone. These are the following modules:

  * `Data.Bifoldable`
  * `Data.Bifoldable1`
  * `Data.Bifunctor`
  * `Data.Bitraversable`
  * `Data.Complex`
  * `Data.Fixed`
  * `Data.Foldable1`
  * `Data.Functor.Classes`
  * `Data.Functor.Compose`
  * `Data.Functor.Contravariant`
  * `Data.Functor.Product`
  * `Data.Functor.Sum`
  * `System.Console.GetOpt`
  * `System.CPUTime.Utils`
  * `Text.Printf`
  * `Text.Show.Functions`

Note that resolving [GHC
issue #26657](https://gitlab.haskell.org/ghc/ghc/-/issues/26657) will
likely untie more module implementations from GHC. It would also be
possible to move *parts* of module implementations from `ghc-internal`
to `base` were only such parts are not tied to GHC, but it may be better
to first check what opportunities the resolution of #26657 brings.
