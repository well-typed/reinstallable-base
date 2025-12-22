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

1. Entanglement between `base` and `ghc-internal`:
   https://github.com/well-typed/reinstallable-base/labels/entanglement
2. Governance challenges:
   https://github.com/well-typed/reinstallable-base/labels/governance
3. Specification of GHC version constraints:
   https://github.com/well-typed/reinstallable-base/labels/GHC%20version%20constraints

# Exploratory work

* [An attempt to make the `base` version of GHC 9.10.2 usable with
  GHC 9.12.2](shimming/9.10.2-9.12.2)
* [An attempt to move module implementations that are not tied to GHC
  into `base`](moving-code-to-base/whole-modules)
