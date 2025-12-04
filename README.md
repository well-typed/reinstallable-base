# Project goal: What “reinstallable `base`” means

The overall goal of the reinstallable `base` project is for the `base`
library to be replaceable, versioned independently of GHC, and
maintained outside of the GHC repository. Today, `base` is effectively
part of the compiler: its implementation is interwoven with GHC
internals, it shares a release cycle with GHC, and it cannot be
upgraded, downgraded, patched, or experimentally replaced without
rebuilding GHC itself. A reinstallable `base` would not suffer from
these issues and could evolve under its own stewardship with less
coupling between compiler development and library development.

# Purpose of this repository

This repository acts as the coordination hub for the reinstallable
`base` effort. It does not yet contain a prototype, but it collects the
problems, design constraints, open questions, and cross-project
coordination tasks that must be addressed before such an implementation
can be feasible. It links together GHC HQ, the Core Libraries Committee,
Cabal maintainers, and external contributors, providing a shared place
to track blockers, document decisions, and plan the sequence of work.

The discussions about reinstallable `base` that lead to the creation of
this repository took place in the following spaces:

* [Discourse thread #13319](https://discourse.haskell.org/t/13319)
* [CLC issue #375](https://github.com/haskell/core-libraries-committee/issues/375)

# Problem areas

## 1. Entanglement between `base` and `ghc-internal`

### Problem

A substantial portion of `base`’s real implementation currently resides
in the `ghc-internal` package. `base` re-exports much of this code. The
consequences:

* Base maintainers cannot meaningfully maintain or evolve the
  implementation.
* Changes within GHC can alter `base` semantics unexpectedly (for
  example, a new instance can leak).

### Why this matters

Independent development is only useful when `base` has autonomy over its
implementation. Without untangling, `base` cannot be versioned
independently, and changes remain tightly coupled to GHC internals or
even have to be made in `ghc-internal`.

### Open questions

* What portion of code needs to migrate from `ghc-internal` to `base`?
* Can items that are wired into the language (for example, the `Monad`
  methods, for desugaring `do` expressions) be moved into `base`? If
  they have to stay in `ghc-internal`, which are these wired-in items
  exactly?
* How much code must be moved before making the repository split?
* What should the long-term maintenance boundary look like?

### Possible solutions

* A good approach may be to have `base` contain only portable code, that
  is, code that is not GHC-specific, and only re-export items from
  `ghc-internal` that have at least a portable *interface*. Portable
  code may have to stay in `ghc-internal` if GHC-specific code, which
  will stay in `ghc-internal` anyhow, depends on it.
* To avoid leaving too much portable code in `ghc-internal`, we could
  split up the libraries further. Joachim Breitner’s old split-`base`
  experiments can give insight regarding where the boundaries of smaller
  libraries should lie.
* Agda and Rust show how defined items can be declared to be used as
  wired-in items.

### Next steps

See [CLC issue
#299](https://github.com/haskell/core-libraries-committee/issues/299).

## 2. Increased coordination and maintainership burden

### Problem

Decoupling `base` from GHC introduces new governance and operations
overhead:

- A new `base` maintainer group will be required, with clear leadership.
- Coordination between GHC releases and `base` releases becomes a
  cross-project responsibility.
- The CI infrastructure must test multiple GHC versions against multiple
  `base` versions.
- Responsibility for breakage becomes more ambiguous.

### Why this matters

Without clear roles and decision-making structures, independent
development of `base` risks fragmentation and ecosystem instability.

### Open questions

- Who maintains the independent `base` repository?
- How do GHC HQ, CLC, and `base` maintainers coordinate?

### Possible solutions

* It would be good if the CLC would organize the maintenance of `base`,
  while giving the actual maintainers (from within or outside the CLC)
  enough freedom to do their work in an unbureaucratic fashion.

### Next steps

* `base` should be split out soon to motivate doing the rest of the
  work.

## 3. Loss of GHC version signaling

### Problem

The ecosystem currently relies on `base` version bounds as proxies for
specifying compatible GHC versions. This convention works because GHC
and `base` are maintaining a tight mapping regarding their versions. If
`base` becomes independently versioned, `base` bounds will no longer
provide information about compiler compatibility. Consequently packages
may be silently built against unsupported GHC versions.

### Why this matters

Language flavors and extensions are sometimes interpreted differently by
different GHC versions, for example, regarding syntax or typing.
Upper-bounding GHC is essential for avoiding breakage. `base` being
reinstallable removes the only practical mechanism the ecosystem
currently uses to enforce these bounds.

### Open questions

* How should compiler compatibility be expressed once the `base`–GHC
  relationship is broken?
* How do we maintain safety for users of older versions of Cabal that do
  not understand new constraint formats?
* Does allowing reinstalling `base` help if library authors will then
  upper-bound compiler version instead? Are we solving the right
  problem?
* How would a package express a bound on a non-GHC Haskell compiler,
  such as MicroHS?

### Possible solutions

* A dependency on supported GHC versions could be specified as a
  dependency on versions of a dummy package `ghc-version`.

### Next steps

*To be decided.*

## 4. Lack of compiler constraint mechanisms in Cabal

### Problem

Cabal currently offers no dedicated, revision-friendly, widely supported
mechanism for expressing GHC version requirements. Existing alternatives
have serious limitations:

* `if impl(ghc)`:
    - Not revision-friendly
    - Not backwards-compatible with older Cabal versions
    - `impl(ghc >= 9.12) and `!impl(ghc < 9.12)` having different
      meanings
        + `impl(ghc >= 9.12)` means “the implementation is GHC and its
          version is >= 9.12”.
        + `!impl(ghc < 9.12)` means “the implementation is not GHC at
          all or GHC with a version < 9.12”.
* `buildable: False`:
    - Does not behave correctly for conditional compiler constraints
    - Also not revision-friendly
* `other-extensions`:
    - Only expresses *lower* bounds
    - Extension semantics can be different across GHC versions
* Dependency on `ghc-internal`:
    - Violates the principle that normal libraries shall not depend on
      GHC internals
    - Breaks `-Wunused-packages`

### Why this matters

Without a robust compiler constraint mechanism, library authors will not
be able to express that their package requires a specific GHC version.

In the past, it has been argued that declarative features such as
`other-extensions` should be used to place requirements on a compiler.
In practice, the extension semantics do change, and packages need to
express this in a direct manner. It is common for Hackage trustees to
modify `base` bounds to stop packages building with bad GHC versions.

### Open questions

* What new Cabal features are needed (for example, `ghc-version`,
  `compiler-version`, or a declarative constraint system)?
* How can such features be introduced without breaking old Cabal
  versions?
* What is the required migration timeline for the ecosystem?

### Possible solutions

* Cabal could be extended to allow for specifying dependencies on
  versions of GHC and other compilers.
* With clearly defined and stable semantics of language extensions, we
  could even get away from specifying dependencies on compiler versions
  and towards specifying only dependencies on language features.

### Next steps

*To be decided.*
