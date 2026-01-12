Acquisition of operating-system handles
=======================================


Concrete descriptions of usage reasons
--------------------------------------

  * Does so for obtaining the file descriptor of a handle
  * Does so for obtaining the file descriptor of a handle on Unix
  * Does so for obtaining the file descriptor of a handle on Unix
    (initially obtaining the GHC-style file descriptor but later only
    ever using the actual file descriptor)
  * Does so for obtaining the operating-system handle of a Haskell
    handle on Windows


Affected packages
-----------------

  * [`Win32`](https://hackage.haskell.org/package/Win32)
  * [`ansi-terminal`](https://hackage.haskell.org/package/ansi-terminal)
  * [`arena`](https://hackage.haskell.org/package/arena)
  * [`dura`](https://hackage.haskell.org/package/dura)
  * [`franz`](https://hackage.haskell.org/package/franz)
  * [`haskeline`](https://hackage.haskell.org/package/haskeline)
  * [`hermit`](https://hackage.haskell.org/package/hermit)
  * [`hsshellscript`](https://hackage.haskell.org/package/hsshellscript)
  * [`ide-backend-common`](https://hackage.haskell.org/package/ide-backend-common)
  * [`iterIO`](https://hackage.haskell.org/package/iterIO)
  * [`libiserv`](https://hackage.haskell.org/package/libiserv)
  * [`network-socket-options`](https://hackage.haskell.org/package/network-socket-options)
  * [`process`](https://hackage.haskell.org/package/process)
  * [`process-leksah`](https://hackage.haskell.org/package/process-leksah)
  * [`project-m36`](https://hackage.haskell.org/package/project-m36)
  * [`rawfilepath`](https://hackage.haskell.org/package/rawfilepath)
  * [`sendfile`](https://hackage.haskell.org/package/sendfile)
  * [`terminal-size`](https://hackage.haskell.org/package/terminal-size)
  * [`unix-handle`](https://hackage.haskell.org/package/unix-handle)
  * [`unliftio`](https://hackage.haskell.org/package/unliftio)


Alternative approaches
----------------------

  * Use the new operations for operating-system handle acquisition that
    GHC merge request
    [!14732](https://gitlab.haskell.org/ghc/ghc/-/merge_requests/14732)
    adds to `base`
  * Use `System.Win32.Types.withHandleToHANDLE` from the `Win32`
    package, if applicable


Example usages of the alternative approaches
--------------------------------------------

  * [UnkindPartition/ansi-terminal#187](https://github.com/UnkindPartition/ansi-terminal/pull/187)
  * [haskell/haskeline#211](https://github.com/haskell/haskeline/pull/211)
  * [jeltsch/hsshellscript#2](https://github.com/jeltsch/hsshellscript/pull/2)
  * [haskell/process#348](https://github.com/haskell/process/pull/348)
  * [Happstack/sendfile#5](https://github.com/Happstack/sendfile/pull/5)
  * [biegunka/terminal-size#20](https://github.com/biegunka/terminal-size/pull/20)


Blocking access to I/O streams
==============================


Concrete descriptions of usage reasons
--------------------------------------

  * Does so for blocking access to the standard input


Affected packages
-----------------

  * [`sensei`](https://hackage.haskell.org/package/sensei)


Alternative approaches
----------------------

  * Use the new operations for operating-system handle acquisition that
    GHC merge request
    [!14732](https://gitlab.haskell.org/ghc/ghc/-/merge_requests/14732)
    adds to `base`


Example usages of the alternative approaches
--------------------------------------------

[None]


Determination of line break encodings used by handles
=====================================================


Concrete descriptions of usage reasons
--------------------------------------

  * Does so for determining the line break and text encoding a handle
    uses for writing
  * Does so for determining the line break and text encodings a handle
    uses
  * Does so for determining the line break encoding a handle uses for
    writing
  * Does so for determining the line break encodings a handle uses


Affected packages
-----------------

  * [`say`](https://hackage.haskell.org/package/say)
  * [`text-locale-encoding`](https://hackage.haskell.org/package/text-locale-encoding)


Alternative approaches
----------------------

  * Use the new operation `System.IO.hGetNewlineMode` that GHC merge
    request
    [!14905](https://gitlab.haskell.org/ghc/ghc/-/merge_requests/14905)
    adds to `base`


Example usages of the alternative approaches
--------------------------------------------

  * [fpco/say#6](https://github.com/fpco/say/pull/6)


Determination of text encodings used by handles
===============================================


Concrete descriptions of usage reasons
--------------------------------------

  * Does so for determining the line break and text encoding a handle
    uses for writing
  * Does so for determining the line break and text encodings a handle
    uses
  * Does so for determining the text encoding a handle uses
  * Does so for determining the text encoding a handle uses for writing


Affected packages
-----------------

  * [`rio`](https://hackage.haskell.org/package/rio)
  * [`say`](https://hackage.haskell.org/package/say)
  * [`text-locale-encoding`](https://hackage.haskell.org/package/text-locale-encoding)


Alternative approaches
----------------------

  * Use `System.IO.hGetEncoding`


Example usages of the alternative approaches
--------------------------------------------

  * [commercialhaskell/rio#265](https://github.com/commercialhaskell/rio/pull/265)
  * [fpco/say#6](https://github.com/fpco/say/pull/6)


Other purposes
==============

The concrete descriptions of those usage reasons from which higher-level
purposes have not yet been distilled and that are therefore not
mentioned in this document are listed in the file
[`untreated-usage-reasons`](untreated-usage-reasons): one per line, in
lexicographic order according to the POSIX locale.
