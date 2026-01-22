# What “reinstallable `base`” means

The overall goal of the reinstallable `base` project is for the `base`
library to be replaceable, versioned independently of GHC, and
maintained outside of the GHC repository.

Today, `base` is effectively part of the compiler: its implementation is
interwoven with GHC internals, it shares a release cycle with GHC, and
it cannot be upgraded, downgraded, patched, or experimentally replaced
without rebuilding GHC itself. If `base` was reinstallable, it would not
suffer from these issues. It could evolve under its own stewardship with
less coupling between compiler and library development. Users would be
able to upgrade `base` independently of GHC, which would support in
particular the following workflows:

1. The user updates GHC without updating `base`.
2. The user updates `base` without updating GHC.

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

# Foundational questions

1. Why do we want `base` to be reinstallable? What concrete workflows
   are we trying to improve?
2. Why does `ghc-internal` need to evolve over time?
3. How does `ghc-internal` evolve in practice?
4. What does the current process of updating `base` look like in
   practice?

# Exploratory work

* [Hackage uses of GHC-specific `base` modules with stability
  risk 3](hackage-uses-of-internals/stability-risk-3)
* [An attempt to move module implementations that are not tied to GHC
  into `base`](moving-code-to-base/whole-modules)
* [An attempt to make the `base` version of GHC 9.10.2 usable with
  GHC 9.12.2](shimming/9.10.2-9.12.2)

# Subprojects

## 1. Disentanglement of `base` and `ghc-internal`

### Goal

Understand whether a meaningful and sustainable boundary between `base`
and `ghc-internal` is achievable

### Status

Blocking

### Questions

1. How much code can realistically be moved from `ghc-internal` into
   `base` without addressing known-key items yet?
2. Which parts of the `base` interface can be deprecated and removed?
3. Which code can be moved depending on its category: portable,
   semi-portable, etc.?
4. What technical obstacles remain after such “low-hanging fruit” is
   reaped?
5. What would constitute a promising outcome from a proof-of-concept
   refactoring?
6. What findings would indicate that further disentanglement is unlikely
   to be possible without addressing known-key items?

## 2. Tooling constraints and ecosystem signaling

### Goal

Understand the implications of decoupling `base` versioning from GHC
versioning for tooling and ecosystem conventions

### Status

Partially blocking

### Questions

1. Does the ecosystem require a means for library authors to express
   compiler constraints? What are the reasons for people currently doing
   this?
2. If a single `base` version can work across multiple GHC versions, how
   should compiler constraints be expressed?
3. Are changes required in Cabal or related tooling to support
   expressing compiler constraints better, and, if so, which?
4. Do we need to resolve this issue now, or can we wait until the
   disentanglement opportunities have been further explored?

## 3. Stability and reliability

### Goal

Have clarity about expectations around stability boundaries

### Status

Deferred

### Questions

1. What stability guarantees do we expect from `base` compared to
   `ghc-internal`?
2. Is it realistic to identify a subset of `ghc-internal` with stronger
   stability guarantees that `base` can rely on?
3. How should unavoidable breaking changes be handled when they affect
   the `base`–`ghc-internal` boundary?
4. What do we have to keep in mind when performing this work to ensure a
   smooth transition for users?

## 4. Developer experience

### Goal

Know the state of contributor workflows and how they need to be adapted

### Status

Deferred

### Questions

1. Are current workflows sufficient if `base` remains in the GHC
   repository?
2. Which developer experience concerns only arise if `base` is developed
   in a separate repository?
3. Which workflow changes are prerequisites for progress, and which are
   optimizations?
4. How should experimental or refactoring work be carried out to
   minimize disruption?

## 5. Governance and maintainership

### Goal

Understand ownership and responsibility

### Status

Deferred

### Questions

1. Who is responsible for maintaining compatibility between `base` and
   new GHC versions?
2. Which governance questions only become relevant if `base` moves to
   its own repository?
3. How should responsibilities be shared between GHC developers, the
   CLC, and the wider community?
4. What happens if there are no volunteers for certain maintenance tasks
   concerning a `base` repository outside the GHC repository?
