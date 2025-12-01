# Project Goal: What “Reinstallable base” Means

The overall goal of reinstallable base is to make the base library
independently versioned, maintainable, and replaceable outside of the GHC
source tree. Today, `base` is effectively part of the compiler: its
implementation is interwoven with GHC internals, it shares a release cycle with
the compiler, and it cannot be upgraded, downgraded, patched, or experimentally
replaced without rebuilding GHC itself. A reinstallable base would separate
these concerns. It would allow base to evolve under its own stewardship,
and reduce the coupling between compiler development and library development.

# Repository Purpose and Scope

This repository acts as the coordination hub for the reinstallable base effort.
It does not (yet) contain an implementation or prototype; instead, it collects the
problem statements, design constraints, open questions, and cross-project
coordination tasks that must be resolved before such an implementation is
feasible. It links together GHC HQ, the Core Libraries Committee, Cabal
maintainers, and external contributors, providing a shared place to track
blockers, document decisions, and plan the sequence of work.

The most recent discussions about `reinstallable-base` took place on these threads:

* [Discourse](https://discourse.haskell.org/t/what-are-the-next-steps-for-reinstallable-base/13319/)
* [CLC Issue Tracker #375](https://github.com/haskell/core-libraries-committee/issues/375)

This project tracks progress towards the four goals identified to make the project possible:

-----

## 1. Entanglement Between `base` and `ghc-internal`

This seems to be the main point raised by CLC members on the discussion thread.

A substantial portion of `base`’s real implementation currently resides in the `ghc-internal` package.
`base` re-exports much of this code. The consequences:

- Base maintainers cannot meaningfully maintain or evolve the implementation.
- Changes within GHC can alter `base` semantics unexpectedly (for example, a new instance can leak)


### Why This Matters
Independent development is only useful when `base` has autonomy over most of its implementation.
Without untangling:

- `base` cannot be versioned independently
- changes remain tightly coupled to GHC internals
- Contributors will have to indirectly modify ghc-internal to change `base`.

### Open Questions
- What portion of code needs to migrate from `ghc-internal` to `base`?
- Which parts must remain due to wired-in constraints (e.g. primops, core types)?
- What should the long-term maintenance boundary look like? This is already fleshed out
- How much is necessary to move before making the repository split? At some tipping point, making the split will force the issue of moving more if it becomes difficult to work on.

## 2. Increased Coordination and Maintainership Burden

As Julian and Simon noted, decoupling `base` from GHC introduces new governance and operational overhead:

- A new base maintainer group will be required, with clear leadership.
- Coordination between GHC releases and `base` releases becomes a cross-project responsibility.
- CI must test multiple GHC versions against multiple `base` versions.
- Responsibility for breakage becomes more ambiguous.

### Why This Matters
Without clear roles and decision-making structures, independent development risks fragmentation and ecosystem instability.

### Open Questions
- Who maintains the independent `base` repository?
- How do GHC HQ, CLC, and base maintainers coordinate?

## 3. How we replace the current “base bounds == GHC bounds” signalling

This was mainly brought up on discourse and within our company chat.

The ecosystem currently relies on base version bounds as a proxy for specifying compatible GHC versions:
```cabal
build-depends: base >= X && < Y
```

This convention works because GHC and `base` have historically maintained a tight 1:1 mapping.

### Why this matters

If `base` becomes independently versioned:

- `base` bounds will no longer provide information about compiler compatibility.
- Packages may silently build against unsupported GHC versions.

### Open Questions
- How should compiler compatibility be expressed once the `base ↔ GHC` relationship is broken?
- How do we maintain safety for users on older versions of Cabal that cannot understand new constraint formats?
- Does allowing reinstalling base help, if library authors will now "upper bound" compiler version instead? Are we solving the right problem?
- There is also the issue of portability, how would a package express a bound on a non-GHC Haskell compiler (such as MicroHS).

## 4. Lack of Compiler Constraint Mechanisms in Cabal

Cabal currently offers no dedicated, revision-friendly, widely supported mechanism for expressing GHC version requirements.
Existing alternatives have serious limitations:

- `if impl(ghc)`:
  - Not revision-safe
  - Not backwards compatible with older Cabal versions
  * `impl(ghc >=9.12) and `!impl(ghc <9.12)` are not the same.
    - `impl(ghc >=9.12)` means  "implementation is GHC and it's version is >=9.12
    - `!impl(ghc < 9.12)` is "implementation is not GHC at all or not GHC which is <9.12

- `buildable: False`:
  - Does not behave correctly for conditional compiler constraints
  - Also not revision-friendly

- `other-extensions`:
  - A declarative way to specify which features a compiler needs to support.
  - Only expresses *lower bounds*
  - Extension semantics can change between GHC versions

- Dependency on `ghc-internal`:
  - Violates the principle that normal libraries must not depend on GHC internals
  - Breaks `-Wunused-packages`

### Why This Matters
Without a robust compiler-constraint mechanism, library authors will not be able to express that their package requires a specific GHC version.

In the past, it has been argued that declarative features such as `other-extensions` should be used to place requirements on a compiler. In practice, the compiler semantics do change, and packages need to express this in a direct manner. It is common for Hackage trustees to modify `base` bounds to stop packages building with bad GHC versions.


### Open Questions
- What new Cabal features are needed (e.g. `ghc-version`, `compiler-version`, or a declarative constraint system)?
- How can such features be introduced without breaking old Cabal versions?
- What is the required migration timeline for the ecosystem?

