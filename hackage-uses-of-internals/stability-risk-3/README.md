# Hackage uses of GHC-specific `base` modules with stability risk 3

[Several characteristics of GHC-specific `base`
modules][base-module-characteristics] have been identified. One of these
characteristics is how much a module contributes to the need for version
changes according to the [PVP][pvp], which is called its stability risk.

We have determined and documented all concrete Hackage uses of modules
with stability risk 3, the highest one, as well as the reasons for them.
To make some of these uses unnecessary, we have extended `base` with
additional functionality that is provided via portable interfaces.
Furthermore, we have developed recommendations for avoiding certain uses
of GHC-specific modules and have changed several Hackage packages
according to these recommendations.

These undertakings are documented in two files:

  * The file
    [by-module-and-using-package.md](by-module-and-using-package.md)
    lists all uses of modules with stability risk 3 by Hackage packages.
    The uses are grouped by used module and using package. Each use is
    annotated with the reasons for it or an immediate way to avoid it.

  * The file [by-purpose.md](by-purpose.md) discusses the high-level
    purposes of some of the module uses presented in the previous file.
    For each purpose, it lists the following:

      - The concrete reasons for using stability-risk-3 modules for this
        purpose
      - The Hackage packages that contain these uses
      - Alternative approaches that we recommend for meeting this
        purpose, which make use of our extensions to `base` in some
        cases and functionality provided via existing portable
        interfaces in others
      - Examples of using these alternative approaches, which have been
        implemented by us by changing some of the concerned Hackage
        packages

[base-module-characteristics]:
    https://docs.google.com/spreadsheets/d/1WmyYLbJIMk9Q-vK4No5qvKIIdIZwhhFFlw6iVWd1xNQ
    "Characteristics of base modules"
[pvp]:
    https://pvp.haskell.org/
    "Haskell Package Versioning Policy"
