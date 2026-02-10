`GHC.Desugar`
=============


`base-orphans-0.9.3`
--------------------

  * Imports `AnnotationWrapper` but does not use it


`GHC.Event.TimeOut`
===================

[No uses]


`GHC.ExecutionStack.Internal`
=============================

[No uses]


`GHC.Float.RealFracMethods`
===========================


`byte-count-reader-0.10.1.12`
-----------------------------

  * Uses `roundDoubleInteger`
      - Can use `round` instead
      - Should perhaps use rationals instead of floating point numbers
        in the first place


`Hastructure-0.50.4`
--------------------

  * Imports `truncateFloatInteger` but does not use it


`hsautogui-0.3.0`
-----------------

  * Uses `roundDoubleInteger`
      - Can use `round` instead


`GHC.GHCi`
==========


`base-orphans-0.9.3`
--------------------

  * Imports the whole module but does not use anything from it


`subhask-0.1.1.0`
-----------------

  * Introduces the instantiation `Functor Hask NoIO`
      - Does perhaps not need to do this, because, according to a
        comment in `SubHask.Compatibility.Base`, it does so only because
        of `NoIO` not being a `Functor` instance, while in fact `NoIO`
        is a `Monad` instance, the `Functor`–`Applicative`–`Monad`
        proposal was implemented in GHC 7.10, and `subhask-0.1.1.0`
        requires GHC 7.10 or later


`GHC.GHCi.Helpers`
==================

[No uses]


`GHC.IO.Handle.Internals`
=========================


`arena-0.1`
-----------

  * Uses `flushWriteBuffer`
      - Does so in preparation for file synchronization


`buildbox-2.2.1.2`
------------------

  * Uses `flushCharReadBuffer`
      - Does so for reading until right after a newline has been read
        or, if no newline is present, until the end of the buffer is
        reached (with code that, according to a source code comment, has
        been “hacked out” of `Data.ByteString`)
  * Uses `ioe_EOF`
      - Does so for reading until right after a newline has been read
        or, if no newline is present, until the end of the buffer is
        reached (with code that, according to a source code comment, has
        been “hacked out” of `Data.ByteString`)
  * Uses `wantReadableHandle`
      - Does so for reading until right after a newline has been read
        or, if no newline is present, until the end of the buffer is
        reached (with code that, according to a source code comment, has
        been “hacked out” of `Data.ByteString`)


`bytestring-0.12.2.0`
---------------------

  * Uses `flushCharReadBuffer`
      - Does so for implementing `hGetLine`
  * Uses `flushWriteBuffer`
      - Does so for implementing the internal `hPut` operation, defined
        in `Data.ByteString.Builder.Internal`
  * Uses `ioe_EOF`
      - Does so for implementing `hGetLine`
  * Uses `wantReadableHandle_`
      - Does so for implementing `hGetLine`
  * Uses `wantWritableHandle`
      - Does so for implementing the internal `hPut` operation, defined
        in `Data.ByteString.Builder.Internal`


`bytestring-builder-0.10.8.2.0`
-------------------------------

  * Uses `flushWriteBuffer`
      - Does so for implementing the internal `hPut` operation, defined
        in `Data.ByteString.Builder.Internal`
  * Uses `wantWritableHandle`
      - Does so for implementing the internal `hPut` operation, defined
        in `Data.ByteString.Builder.Internal`


`exceptionfree-readfile-0.1.0.0`
--------------------------------

  * Imports `debugIO` but does not use it
  * Uses `decodeByteBuf`
      - Does so in a re-implementation of `readFile` that is better
        behaved regarding profiling


`file-io-0.1.5`
---------------

  * Uses `debugIO`
      - Does so for automatic finalization of handles


`franz-0.5.3`
-------------

  * Uses `withHandle_`
      - Does so for obtaining the file descriptor of a handle on Unix


`ghcide-2.11.0.0`
-----------------

  * Uses `flushBuffer`
      - Does so for implementing a variant of `hDuplicateTo`, which in
        particular does not suffer from a certain bug
  * Uses `flushWriteBuffer`
      - Does so for implementing a variant of `hDuplicateTo`, which in
        particular does not suffer from a certain bug
  * Uses `mkHandle`
      - Does so for implementing a variant of `hDuplicateTo`, which in
        particular does not suffer from a certain bug
  * Uses `withHandle_'`
      - Does so for implementing a variant of `hDuplicateTo`, which in
        particular does not suffer from a certain bug
  * Uses `withHandle__'`
      - Does so for implementing a variant of `hDuplicateTo`, which in
        particular does not suffer from a certain bug


`ghcjs-base-0.8.0.4`
--------------------

  * Uses `withHandle` in tests
      - Does so to swap the configurations of two handles


`ghcjs-base-stub-0.3.0.2`
-------------------------

  * Includes the complete `ghcjs-base` package in a version very similar
    to `0.8.0.4`, with the uses mentioned [above](#ghcjs-base-0804)


`haskeline-0.8.3.0`
-------------------

  * Uses `withHandle_`
      - Does so for obtaining the file descriptor of a handle on Unix


`hsshellscript-3.6.4`
---------------------

  * Imports the whole module but does not use anything from it
  * Uses `withHandle'`
      - Does so for obtaining the file descriptor of a handle


`ide-backend-common-0.10.1.2`
-----------------------------

  * Uses `flushWriteBuffer`
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows
  * Uses `withHandle'`
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows


`ide-backend-rts-0.1.3.1`
-------------------------

  * Uses `closeTextCodecs`
      - Does so for replicating `stdHandleFinalizer` from
        `GHC.Internal.IO.Handle.FD` and `GHC.Internal.IO.Handle.Windows`
  * Uses `flushWriteBuffer`
      - Does so for replicating `stdHandleFinalizer` from
        `GHC.Internal.IO.Handle.FD` and `GHC.Internal.IO.Handle.Windows`
  * Uses `ioe_finalizedHandle`
      - Does so for replicating `stdHandleFinalizer` from
        `GHC.Internal.IO.Handle.FD` and `GHC.Internal.IO.Handle.Windows`
  * Uses `mkHandle`
      - Does so for resetting standard handles to their default
        configurations


`ide-backend-server-0.10.0.2`
-----------------------------

  * Includes the complete `ide-backend-rts-0.1.3.1` package, with the
    uses mentioned [above](#ide-backend-rts-0131)


`iterIO-0.2.2`
--------------

  * Uses `wantWritableHandle`
      - Does so for obtaining a file descriptor, suitable for writing,
        from a handle


`lio-eci11-0.2`
---------------

  * Uses `wantWritableHandle`
      - Does so for obtaining the file descriptor of a handle


`network-socket-options-0.2.0.1`
--------------------------------

  * Uses `withHandle_`
      - Does so for checking whether a file descriptor refers to a
        socket on Windows


`nullpipe-0.1.0.0`
------------------

  * Uses `flushCharReadBuffer`
      - Does so for reading until the next NUL character, using code
        that is almost identical to the code implementing
        `Data.ByteString.hGetLine`
  * Uses `ioe_EOF`
      - Does so for reading until the next NUL character, using code
        that is almost identical to the code implementing
        `Data.ByteString.hGetLine`
  * Uses `wantReadableHandle_`
      - Does so for reading until the next NUL character, using code
        that is almost identical to the code implementing
        `Data.ByteString.hGetLine`


`process-1.6.26.1`
------------------

  * Uses `mkFileHandleNoFinalizer`
      - Can be imported from `GHC.IO.Handle`
  * Uses `withHandle`
      - Does so for obtaining the file descriptor of a handle
      - Does so for marking the file descriptor of a handle as blocking
        on non-JavaScript platforms


`process-leksah-1.0.1.4`
------------------------

  * Uses `withHandle`
      - Does so for obtaining the file descriptor of a handle
      - Does so for marking the file descriptor of a handle as blocking
        on non-JavaScript platforms


`rawfilepath-1.1.1`
-------------------

  * Uses `withHandle`
      - Does so for obtaining the file descriptor of a handle
      - Does so for marking the file descriptor of a handle as blocking
        on non-JavaScript platforms


`rio-0.1.22.0`
--------------

  * Uses `wantWritableHandle`
      - Does so for determining the text encoding a handle uses for
        writing


`say-0.1.0.1`
-------------

  * Uses `wantWritableHandle`
      - Does so for determining the line break and text encoding a
        handle uses for writing
      - Does so for writing out data from a character buffer


`sendfile-0.7.11.6`
-------------------

  * Uses `withHandle_`
      - Does so for obtaining the file descriptor of a handle


`sensei-0.9.0`
--------------

  * Uses `wantReadableHandle_`
      - Does so for blocking access to the standard input


`shh-0.7.3.0`
-------------

  * Uses `mkHandle`
      - Does so for duplicating a handle without flushing, using code
        that is almost identical to the code implementing
        `GHC.IO.Handle.hDuplicate`
  * Uses `withHandle_'`
      - Does so for duplicating a handle without flushing, using code
        that is almost identical to the code implementing
        `GHC.IO.Handle.hDuplicate`


`simplexmq-1.1.0`
-----------------

  * Uses `ioe_EOF`
      - Does so for signaling an end of transmission using TLS
      - Does so for signaling an end of transmission using SMP


`terminal-size-0.3.4`
---------------------

  * Uses `withHandle_`
      - Does so for obtaining the file descriptor of a handle on Unix


`text-2.1.2`
------------

  * Uses `augmentIOError`
      - Does so for handling I/O errors
      - Does so for implementing the lazy variant of `hGetContents`
  * Uses `hClose_help`
      - Does so for implementing the strict variant of `hGetContents`
      - Does so for implementing the lazy variant of `hGetContents`
  * Uses `ioe_EOF`
      - Does so for reading a line
  * Uses `readTextDevice`
      - Does so for reading a bunch of characters, using code that is
        identical to the code implementing
        `GHC.IO.Handle.Text.getSomeCharacters`
  * Uses `wantReadableHandle`
      - Does so for implementing `hGetChunk`
      - Does so for implementing the strict variant of `hGetContents`
      - Does so for implementing the lazy variant of `hGetContents`
  * Uses `wantReadableHandle_`
      - Does so for reading a line
  * Uses `wantWritableHandle`
      - Does so for writing out data from a character buffer, using code
        that is almost identical to the code implementing
        `GHC.IO.Handle.Text.commitBuffer`
      - Does so for writing streams with special handling of UTF-8 and
        no newline conversion, using code that is almost identical to
        code from `GHC.IO.Handle.Text`
      - Does so for implementing `hPutStr`
  * Uses `withHandle`
      - Does so for implementing the lazy variant of `hGetContents`
      - Does so in tests to swap the configurations of two handles


`text-locale-encoding-0.1.0.2`
------------------------------

  * Uses `withHandle_`
      - Does so for determining the line break and text encodings a
        handle uses


`text-utf8-1.2.3.0`
-------------------

  * Uses `augmentIOError`
      - Does so for handling I/O errors
      - Does so for implementing the lazy variant of `hGetContents`
  * Uses `hClose_help`
      - Does so for implementing the strict variant of `hGetContents`
      - Does so for implementing the lazy variant of `hGetContents`
  * Uses `ioe_EOF`
      - Does so for reading a line
  * Uses `readTextDevice`
  * Uses `wantReadableHandle`
      - Does so for implementing `hGetChunk`
      - Does so for implementing the strict variant of `hGetContents`
      - Does so for implementing the lazy variant of `hGetContents`
  * Uses `wantReadableHandle_`
      - Does so for reading a line
  * Uses `wantWritableHandle`
      - Does so for writing out data from a character buffer, using code
        that is identical to the code implementing
        `GHC.IO.Handle.Text.commitBuffer`
  * Uses `withHandle`
      - Does so for implementing the lazy variant of `hGetContents`
      - Does so in tests to swap the configurations of two handles


`unix-2.8.7.0`
--------------

  * Uses `flushWriteBuffer`
      - Does so for implementing `handleToFd`
  * Uses `withHandle'`
      - Does so for implementing `handleToFd`


`unix-handle-0.0.0`
-------------------

  * Uses `withHandle_`
      - Does so for obtaining the file descriptor of a handle on Unix


`vector-bytestring-0.0.0.1`
---------------------------

  * Uses `flushCharReadBuffer`
      - Does so for implementing `hGetLine`
  * Uses `ioe_EOF`
      - Does so for implementing `hGetLine`
  * Uses `wantReadableHandle_`
      - Does so for implementing `hGetLine`


`GHC.IO.Handle.Types`
=====================


`ansi-terminal-1.1.3`
---------------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle`’s data constructors
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows
  * Uses `Handle__`
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows


`arena-0.1`
-----------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle`’s data constructors
      - Does so for obtaining the file descriptor of a handle on Unix
  * Uses `Handle__`
      - Does so for obtaining the file descriptor of a handle on Unix
  * Uses `haDevice`
      - Does so for obtaining the file descriptor of a handle on Unix
  * Uses `haType`
      - Does so for no apparent reason


`base-orphans-0.9.3`
--------------------

  * Imports the whole module but does not use anything from it


`buildbox-2.2.1.2`
------------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `haByteBuffer`
      - Does so for reading until right after a newline has been read
        or, if no newline is present, until the end of the buffer is
        reached (with code that, according to a source code comment, has
        been “hacked out” of `Data.ByteString`)
  * Uses `haDevice`
      - Does so for reading until right after a newline has been read
        or, if no newline is present, until the end of the buffer is
        reached (with code that, according to a source code comment, has
        been “hacked out” of `Data.ByteString`)


`bytestring-0.12.2.0`
---------------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle__`
      - Does so for implementing the internal `hPut` operation, defined
        in `Data.ByteString.Builder.Internal`
  * Uses `Handle__`’s data constructor
      - Does so for implementing `hGetLine`
  * Uses `haBufferMode`
      - Does so for implementing the internal `hPut` operation, defined
        in `Data.ByteString.Builder.Internal`
  * Uses `haByteBuffer`
      - Does so for implementing the internal `hPut` operation, defined
        in `Data.ByteString.Builder.Internal`
      - Does so for implementing `hGetLine`
  * Uses `haDevice`
      - Does so for implementing `hGetLine`


`bytestring-builder-0.10.8.2.0`
-------------------------------

  * Uses `Handle__`
      - Does so for implementing the internal `hPut` operation, defined
        in `Data.ByteString.Builder.Internal`
  * Uses `haBufferMode`
      - Does so for implementing the internal `hPut` operation, defined
        in `Data.ByteString.Builder.Internal`
  * Uses `haByteBuffer`
      - Does so for implementing the internal `hPut` operation, defined
        in `Data.ByteString.Builder.Internal`


`Capabilities-0.1.0.0`
----------------------

  * Uses `Handle`
      - Can be imported from `System.IO`


`chromatin-0.1.1.0`
-------------------

  * Uses `Handle`
      - Can be imported from `System.IO`


`Commando-1.0.0.4`
------------------

  * Uses `Handle`
      - Can be imported from `System.IO`


`Data-Rope-0.2`
---------------

  * Uses `Handle`
      - Can be imported from `System.IO`


`data-rope-0.3`
---------------

  * Uses `Handle`
      - Can be imported from `System.IO`


`dura-0.1`
----------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle`’s data constructors
      - Does so for obtaining the file descriptor of a handle on Unix
        (initially obtaining the GHC-style file descriptor but later
        only ever using the actual file descriptor)
  * Uses `Handle__`’s data constructor
      - Does so for obtaining the file descriptor of a handle on Unix
        (initially obtaining the GHC-style file descriptor but later
        only ever using the actual file descriptor)


`exceptionfree-readfile-0.1.0.0`
--------------------------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle`’s data constructors
      - Does so in a re-implementation of `readFile` that is better
        behaved regarding profiling
  * Uses `Handle__`
      - Does so in a re-implementation of `readFile` that is better
        behaved regarding profiling
  * Uses `Handle__`’s data constructor
      - Does so in a re-implementation of `readFile` that is better
        behaved regarding profiling
  * Uses `HandleType`
      - Does so in a re-implementation of `readFile` that is better
        behaved regarding profiling
  * Uses some of `HandleType`’s data constructors
      - Does so in a re-implementation of `readFile` that is better
        behaved regarding profiling
  * Imports `checkHandleInvariants` but does not use it


`file-io-0.1.5`
---------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle`’s data constructors
      - Does so for automatic finalization of handles
  * Uses `Handle__`
      - Does so for automatic finalization of handles


`franz-0.5.3`
-------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle__`
      - Does so for obtaining the file descriptor of a handle on Unix
  * Uses `Handle__`’s data constructor
      - Does so for obtaining the file descriptor of a handle on Unix
  * Uses `haDevice`
      - Does so for obtaining the file descriptor of a handle on Unix


`ghcide-2.11.0.0`
-----------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle`’s data constructors
      - Does so for implementing a variant of `hDuplicateTo`, which in
        particular does not suffer from a certain bug
  * Uses `Handle__`
      - Does so for implementing a variant of `hDuplicateTo`, which in
        particular does not suffer from a certain bug
  * Uses `Handle__`’s data constructor
      - Does so for implementing a variant of `hDuplicateTo`, which in
        particular does not suffer from a certain bug
  * Uses `NewLineMode`’s data constructor
      - Can be imported from `System.IO`
  * Uses `haDevice`
      - Does so for implementing a variant of `hDuplicateTo`, which in
        particular does not suffer from a certain bug
  * Uses `haEncoder`
      - Does so for implementing a variant of `hDuplicateTo`, which in
        particular does not suffer from a certain bug
  * Uses `haInputNL`
      - Does so for implementing a variant of `hDuplicateTo`, which in
        particular does not suffer from a certain bug
  * Uses `haOutputNL`
      - Does so for implementing a variant of `hDuplicateTo`, which in
        particular does not suffer from a certain bug
  * Uses `haType`
      - Does so for implementing a variant of `hDuplicateTo`, which in
        particular does not suffer from a certain bug


`haskeline-0.8.3.0`
-------------------

  * Uses some of `BufferMode`’s data constructors
      - Can be imported from `System.IO`
  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle`’s data constructors
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows
  * Uses `Handle__`’s data constructor
      - Does so for obtaining the file descriptor of a handle on Unix
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows
  * Uses `haDevice`
      - Does so for obtaining the file descriptor of a handle on Unix
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows


`hermit-1.0.1`
--------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle`’s data constructors
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows
  * Uses `Handle__`’s data constructor
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows
  * Uses `haDevice`
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows


`hsshellscript-3.6.4`
---------------------

  * Uses `Handle`
  * Uses one of `Handle`’s data constructors
      - Does so for setting and restoring the file descriptor of a
        handle
      - Does so for obtaining the file descriptor of a handle
  * Uses `Handle__`
      - Does so for setting and restoring the file descriptor of a
        handle
      - Does so for obtaining the file descriptor of a handle
  * Uses `Handle__`’s data constructor
      - Does so for obtaining the file descriptor of a handle
  * Uses some of `HandleType`’s data constructors
  * Uses `haDevice`
      - Does so for obtaining the file descriptor of a handle
  * Uses `haType`
      - Does so for setting and restoring the file descriptor of a
        handle


`http-enumerator-0.7.3.3`
-------------------------

  * Uses `Handle`
      - Can be imported from `System.IO`


`ide-backend-common-0.10.1.2`
-----------------------------

  * Uses `Handle`’s data constructors
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows
  * Uses `Handle__`
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows
  * Uses `Handle__`’s data constructor
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows
  * Uses one of `HandleType`’s data constructors
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows
  * Uses `haDevice`
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows
  * Uses `haType`
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows


`ide-backend-rts-0.1.3.1`
-------------------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses one of `Handle`’s data constructors
      - Does so to swap the configurations of two handles
  * Uses some of `HandleType`’s data constructors
      - Does so for replicating `stdHandleFinalizer` from
        `GHC.Internal.IO.Handle.FD` and `GHC.Internal.IO.Handle.Windows`
  * Uses `Handle__`
      - Does so for replicating `stdHandleFinalizer` from
        `GHC.Internal.IO.Handle.FD` and `GHC.Internal.IO.Handle.Windows`
  * Uses `haType`
      - Does so for replicating `stdHandleFinalizer` from
        `GHC.Internal.IO.Handle.FD` and `GHC.Internal.IO.Handle.Windows`
  * Uses `nativeNewlineMode`
      - Can be imported from `System.IO`


`ide-backend-server-0.10.0.2`
-----------------------------

  * Includes the complete `ide-backend-rts-0.1.3.1` package, with the
    uses mentioned [above](#ide-backend-rts-0131-1)


`ihaskell-0.12.0.0`
-------------------

  * Uses one of `BufferMode`’s data constructors
      - Can be imported from `System.IO`
  * Uses one of `Handle`’s data constructors
      - Does so in some strange-looking code


`interprocess-0.2.1.0`
----------------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle`’s data constructors in tests
      - Does so for redirecting the output of a handle to a byte string
        (via a temporary file)


`iterIO-0.2.2`
--------------

  * Uses `Handle__`’s data constructor
      - Does so for obtaining a file descriptor, suitable for writing,
        from a handle
  * Uses `haDevice`
      - Does so for obtaining a file descriptor, suitable for writing,
        from a handle


`lio-eci11-0.2`
---------------

  * Uses `Handle__`’s data constructor
      - Does so for obtaining the file descriptor of a handle
  * Uses `haDevice`
      - Does so for obtaining the file descriptor of a handle


`liquid-fixpoint-8.10.7`
------------------------

  * Uses `Handle`
      - Can be imported from `System.IO`


`mmsyn7ukr-0.17.0.0`
--------------------

  * Uses one of `Newline`’s data constructors
      - Probably stems from a misconception regarding representation of
        line breaks in Haskell
      - Can be imported from `System.IO`
  * Uses `nativeNewline`
      - Probably stems from a misconception regarding representation of
        line breaks in Haskell
      - Can be imported from `System.IO`


`mmsyn7ukr-common-0.3.1.0`
--------------------------

  * Uses one of `Newline`’s data constructors
      - Probably stems from a misconception regarding representation of
        line breaks in Haskell
      - Can be imported from `System.IO`
  * Uses `nativeNewline`
      - Probably stems from a misconception regarding representation of
        line breaks in Haskell
      - Can be imported from `System.IO`


`network-effectful-0.2.0.1`
---------------------------

  * Uses and re-exports `Handle`
      - Can be imported from `System.IO`


`network-socket-options-0.2.0.1`
--------------------------------

  * Uses `Handle__`’s data constructor
      - Does so for checking whether a file descriptor refers to a
        socket on Windows
  * Uses `haDevice`
      - Does so for checking whether a file descriptor refers to a
        socket on Windows


`nullpipe-0.1.0.0`
------------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle__`’s data constructor
      - Does so for reading until the next NUL character, using code
        that is almost identical to the code implementing
        `Data.ByteString.hGetLine`
  * Uses `haByteBuffer`
      - Does so for reading until the next NUL character, using code
        that is almost identical to the code implementing
        `Data.ByteString.hGetLine`
  * Uses `haDevice`
      - Does so for reading until the next NUL character, using code
        that is almost identical to the code implementing
        `Data.ByteString.hGetLine`


`process-1.6.26.1`
------------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle__`’s data constructor
      - Does so for obtaining the file descriptor of a handle
      - Does so for marking the file descriptor of a handle as blocking
        on non-JavaScript platforms
  * Uses `haDevice`
      - Does so for obtaining the file descriptor of a handle
      - Does so for marking the file descriptor of a handle as blocking
        on non-JavaScript platforms


`process-leksah-1.0.1.4`
------------------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle__`’s data constructor
      - Does so for obtaining the file descriptor of a handle
      - Does so for marking the file descriptor of a handle as blocking
        on non-JavaScript platforms
  * Uses `haDevice`
      - Does so for obtaining the file descriptor of a handle
      - Does so for marking the file descriptor of a handle as blocking
        on non-JavaScript platforms


`project-m36-1.1.1`
-------------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle`’s data constructors
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows
  * Uses `Handle__`’s data constructor
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows
  * Uses `haDevice`
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows


`rawfilepath-1.1.1`
-------------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle__`’s data constructor
      - Does so for obtaining the file descriptor of a handle
      - Does so for marking the file descriptor of a handle as blocking
        on non-JavaScript platforms
  * Uses `haDevice`
      - Does so for obtaining the file descriptor of a handle
      - Does so for marking the file descriptor of a handle as blocking
        on non-JavaScript platforms


`rio-0.1.22.0`
--------------

  * Uses `haCodec`
      - Does so for determining the text encoding a handle uses for
        writing


`say-0.1.0.1`
-------------

  * Uses `BufferList`’s data constructors
      - Does so to obtain the next spare character buffer, using code
        that is almost identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
  * Uses `Handle__`
      - Does so to obtain the next spare character buffer, using code
        that is almost identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
  * Uses `Handle__`’s data constructor
      - Does so to obtain the next spare character buffer, using code
        that is almost identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
  * Uses `haBuffers`
      - Does so to obtain the next spare character buffer, using code
        that is almost identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
  * Uses `haCharBuffer`
      - Does so to obtain the next spare character buffer, using code
        that is almost identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
  * Uses `haCodec`
      - Does so for determining the text encoding a handle uses for
        writing
  * Uses `haOutputNL`
      - Does so for determining the line break encoding a handle uses
        for writing


`sendfile-0.7.11.6`
-------------------

  * Uses `Handle__`’s data constructor
      - Does so for obtaining the file descriptor of a handle
  * Uses `haDevice`
      - Does so for obtaining the file descriptor of a handle


`shh-0.7.3.0`
-------------

  * Uses one of `BufferMode`’s data constructors
      - Can be imported from `System.IO`
  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle`’s data constructors
      - Does so for duplicating a handle without flushing, using code
        that is almost identical to the code implementing
        `GHC.IO.Handle.hDuplicate`
  * Uses `Handle__`
      - Does so for duplicating a handle without flushing, using code
        that is almost identical to the code implementing
        `GHC.IO.Handle.hDuplicate`
  * Uses `Handle__`’s data constructor
      - Does so for duplicating a handle without flushing, using code
        that is almost identical to the code implementing
        `GHC.IO.Handle.hDuplicate`
  * Uses `NewlineMode`’s data constructor
      - Can be imported from `System.IO`
  * Uses `haDevice`
      - Does so for duplicating a handle without flushing, using code
        that is almost identical to the code implementing
        `GHC.IO.Handle.hDuplicate`
  * Uses `haEncoder`
      - Does so for duplicating a handle without flushing, using code
        that is almost identical to the code implementing
        `GHC.IO.Handle.hDuplicate`
  * Uses `haInputNL`
      - Does so for duplicating a handle without flushing, using code
        that is almost identical to the code implementing
        `GHC.IO.Handle.hDuplicate`
  * Uses `haOutputNL`
      - Does so for duplicating a handle without flushing, using code
        that is almost identical to the code implementing
        `GHC.IO.Handle.hDuplicate`
  * Uses `haType`
      - Does so for duplicating a handle without flushing, using code
        that is almost identical to the code implementing
        `GHC.IO.Handle.hDuplicate`
  * Uses `inputNL`
      - Can be imported from `System.IO`
  * Uses `outputNL`
      - Can be imported from `System.IO`


`terminal-size-0.3.4`
---------------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle__`’s data constructor
      - Does so for obtaining the file descriptor of a handle on Unix
  * Uses `haDevice`
      - Does so for obtaining the file descriptor of a handle on Unix


`text-2.1.2`
------------

  * Uses `BufferList`’s data constructors
      - Does so to obtain the next spare character buffer, using code
        that is identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
  * Uses `BufferMode`
      - Can be imported from `System.IO`
  * Uses `BufferMode`’s data constructors
      - Can be imported from `System.IO`
  * Uses `Handle__`
      - Does so for reading available data into a character buffer,
        using code that is almost identical to the code implementing
        `GHC.IO.Handle.Text.maybeFillReadBuffer`
      - Does so for reading a bunch of characters, using code that is
        identical to the code implementing
        `GHC.IO.Handle.Text.getSomeCharacters`
      - Does so for reading a chunk of text
      - Does so for reading a line
      - Does so to obtain the next spare character buffer, using code
        that is identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
      - Does so for handling I/O errors
      - Does so for implementing the lazy variant of `hGetContents`
  * Uses `Handle__`’s data constructor
      - Does so for reading a bunch of characters, using code that is
        identical to the code implementing
        `GHC.IO.Handle.Text.getSomeCharacters`
      - Does so for reading a chunk of text
      - Does so for reading a line
      - Does so to obtain the next spare character buffer, using code
        that is identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
      - Does so for handling I/O errors
      - Does so for implementing `hGetChunk`
      - Does so for implementing the strict variant of `hGetContents`
      - Does so for implementing the lazy variant of `hGetContents`
  * Uses some of `HandleType`’s data constructors
      - Does so for implementing the strict variant of `hGetContents`
      - Does so for implementing the lazy variant of `hGetContents`
  * Uses `Newline`
      - Can be imported from `System.IO`
  * Uses `Newline`’s data constructors
      - Can be imported from `System.IO`
  * Uses `haBufferMode`
      - Does so to obtain the next spare character buffer, using code
        that is identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
  * Uses `haBuffers`
      - Does so to obtain the next spare character buffer, using code
        that is identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
  * Uses `haCharBuffer`
      - Does so for reading a chunk of text
      - Does so for reading a line
      - Does so to obtain the next spare character buffer, using code
        that is identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
      - Does so for handling I/O errors
      - Does so for implementing `hGetChunk`
      - Does so for implementing the strict variant of `hGetContents`
      - Does so for implementing the lazy variant of `hGetContents`
  * Uses `haCodec`
      - Does so for writing streams with special handling of UTF-8 and
        no newline conversion, using code that is almost identical to
        code from `GHC.IO.Handle.Text`
  * Uses `haInputNL`
      - Does so for reading a bunch of characters, using code that is
        identical to the code implementing
        `GHC.IO.Handle.Text.getSomeCharacters`
      - Does so for reading a chunk of text
      - Does so for reading a line
  * Uses `haOutputNL`
      - Does so for writing streams with special handling of UTF-8 and
        no newline conversion, using code that is almost identical to
        code from `GHC.IO.Handle.Text`
  * Uses `haType`
      - Does so for implementing the strict variant of `hGetContents`
      - Does so for implementing the lazy variant of `hGetContents`


`text-locale-encoding-0.1.0.2`
------------------------------

  * Uses `Handle__`’s data constructor
      - Does so for determining the line break and text encodings a
        handle uses
  * Uses `haCodec`
      - Does so for determining the text encoding a handle uses
  * Uses `haInputNL`
      - Does so for determining the line break encodings a handle uses
  * Uses `haOutputNL`
      - Does so for determining the line break encodings a handle uses


`text-show-3.11.2`
------------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle`’s data constructors
      - Does so for acquiring the file path underlying a handle
      - Can be circumvented by employing the `Show` instance for
        `Handle`


`text-utf8-1.2.3.0`
-------------------

  * Uses `BufferList`’s data constructors
      - Does so to obtain the next spare character buffer, using code
        that is identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
  * Uses `BufferMode`
      - Can be imported from `System.IO`
  * Uses `BufferMode`’s data constructors
      - Can be imported from `System.IO`
  * Uses `Handle__`
      - Does so for reading available data into a character buffer,
        using code that is almost identical to the code implementing
        `GHC.IO.Handle.Text.maybeFillReadBuffer`
      - Does so for reading a bunch of characters, using code that is
        identical to the code implementing
        `GHC.IO.Handle.Text.getSomeCharacters`
      - Does so for reading a chunk of text
      - Does so for reading a line
      - Does so to obtain the next spare character buffer, using code
        that is identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
      - Does so for handling I/O errors
      - Does so for implementing the lazy variant of `hGetContents`
  * Uses `Handle__`’s data constructor
      - Does so for reading a bunch of characters, using code that is
        identical to the code implementing
        `GHC.IO.Handle.Text.getSomeCharacters`
      - Does so for reading a chunk of text
      - Does so for reading a line
      - Does so to obtain the next spare character buffer, using code
        that is identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
      - Does so for handling I/O errors
      - Does so for implementing `hGetChunk`
      - Does so for implementing the strict variant of `hGetContents`
      - Does so for implementing the lazy variant of `hGetContents`
  * Uses some of `HandleType`’s data constructors
      - Does so for implementing the strict variant of `hGetContents`
      - Does so for implementing the lazy variant of `hGetContents`
  * Uses `Newline`
      - Can be imported from `System.IO`
  * Uses one of `Newline`’s data constructors
      - Can be imported from `System.IO`
  * Uses `haBufferMode`
      - Does so to obtain the next spare character buffer, using code
        that is identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
  * Uses `haBuffers`
      - Does so to obtain the next spare character buffer, using code
        that is identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
  * Uses `haCharBuffer`
      - Does so for reading a chunk of text
      - Does so for reading a line
      - Does so to obtain the next spare character buffer, using code
        that is identical to the code implementing
        `GHC.Internal.IO.Handle.Text.getSpareBuffer`
      - Does so for handling I/O errors
      - Does so for implementing `hGetChunk`
      - Does so for implementing the strict variant of `hGetContents`
      - Does so for implementing the lazy variant of `hGetContents`
  * Uses `haInputNL`
      - Does so for reading a bunch of characters, using code that is
        identical to the code implementing
        `GHC.IO.Handle.Text.getSomeCharacters`
      - Does so for reading a chunk of text
      - Does so for reading a line
  * Uses `haOutputNL`
      - Does so for implementing `hPutStr`
  * Uses `haType`
      - Does so for implementing the strict variant of `hGetContents`
      - Does so for implementing the lazy variant of `hGetContents`


`ui-1.0.0`
----------

  * Uses `BufferMode`
      - Can be imported from `System.IO`
  * Uses one of `BufferMode`’s data constructors
      - Can be imported from `System.IO`


`unix-2.8.7.0`
--------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle`’s data constructors
      - Does so for implementing `handleToFd`
  * Uses `Handle__`
      - Does so for implementing `handleToFd`
  * Uses `Handle__`’s data constructor
      - Does so for implementing `handleToFd`
  * Uses one of `HandleType`’s data constructors
      - Does so for implementing `handleToFd`
  * Uses `haDevice`
      - Does so for implementing `handleToFd`
  * Uses `haType`
      - Does so for implementing `handleToFd`


`unix-handle-0.0.0`
-------------------

  * Uses `Handle__`’s data constructor
      - Does so for obtaining the file descriptor of a handle on Unix
  * Uses `haDevice`
      - Does so for obtaining the file descriptor of a handle on Unix


`unliftio-0.2.25.1`
-------------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle`’s data constructors
      - Does so for obtaining the file descriptor of a handle
  * Uses `Handle__`’s data constructor
      - Does so for obtaining the file descriptor of a handle
  * Uses `haDevice`
      - Does so for obtaining the file descriptor of a handle


`uu-parsinglib-2.9.2`
---------------------

  * Imports the whole module but does not use anything from it


`vector-bytestring-0.0.0.1`
---------------------------

  * Uses `Handle__`’s data constructor
      - Does so for implementing `hGetLine`
  * Uses `haByteBuffer`
      - Does so for implementing `hGetLine`
  * Uses `haDevice`
      - Does so for implementing `hGetLine`


`Win32-2.14.2.1`
----------------

  * Uses `Handle`
      - Can be imported from `System.IO`
  * Uses `Handle`’s data constructors
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows
  * Uses `Handle__`’s data constructor
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows
  * Uses `haDevice`
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows


`GHC.IO.SubSystem`
==================


`ansi-terminal-1.1.3`
---------------------

  * Uses `(<!>)`
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows


`directory-1.3.9.0`
-------------------

  * Imports `IoSubSystem` but does not use it
  * Imports `IoSubSystem`’s data constructors but does not use them
  * Imports `ioSubSystem` but does not use it


`file-io-0.1.5`
---------------

  * Uses `ioSubSystem` in tests on Windows
      - Does so for selectively setting `FILE_FLAG_OVERLAPPED`
      - Can use `(<!>)` instead


`haskeline-0.8.3.0`
-------------------

  * Uses `(<!>)`
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows


`libiserv-9.6.6`
----------------

  * Uses `(<!>)`
      - Does so for constructing a Haskell handle from an
        operating-system handle on Windows


`process-1.6.26.1`
------------------

  * Uses `(<!>)`
      - Does so for constructing a Haskell handle from an
        operating-system handle on Windows
      - Does so for implementing several other low-level,
        Windows-specific operations


`streamly-core-0.2.3`
---------------------

  * Introduces the instantiation `Unbox IoSubSystem`
      - Does so for no apparent reason


`text-show-3.11.2`
------------------

  * Introduces the instantiation `TextShow IoSubSystem`
      - Probably due to a policy of covering all types of `base`
  * Introduces the instantiations generated by `deriveAll0
    ''SubSystem.IoSubSystem` in tests
  * Introduces the instantiation `Arbitrary IoSubSystem` in tests


`Win32-2.14.2.1`
----------------

  * Uses `(<!>)`
      - Does so for constructing a Haskell handle from an
        operating-system handle on Windows
      - Does so for obtaining the operating-system handle of a Haskell
        handle on Windows


`GHC.IOPort`
============

[No uses]


`System.Posix.Internals`
========================


`ajhc-0.8.0.10`
---------------

  * Uses `c_chmod`
      - Does so for defining an operation `setFileMode` to be used on
        Unix whose interface and implementation are identical to those
        of `setFileMode` from the `unix` package
  * Uses `c_close`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `c_getpid`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `c_open`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `o_BINARY`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `o_CREAT`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `o_EXCL`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `o_NOCTTY`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `o_NONBLOCK`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `o_RDWR`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `withFilePath`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
      - Does so for defining an operation `setFileMode` to be used on
        Unix whose interface and implementation are identical to those
        of `setFileMode` from the `unix` package


`base-orphans-0.9.3`
--------------------

  * Imports the whole module but does not use anything from it


`blockio-uring-0.1.0.0`
-----------------------

  * Uses `hostIsThreaded`
      - Does so to ensure that the runtime system uses threading


`btrfs-0.2.1.0`
---------------

  * Uses `peekFilePathLen`
      - Does so for accessing operating-system functionality regarding
        Btrfs
  * Uses `peekFilePath`
      - Does so for accessing operating-system functionality regarding
        Btrfs
  * Uses `withFilePath`
      - Does so for accessing operating-system functionality regarding
        Btrfs


`bytestring-0.12.2.0`
---------------------

  * Uses `c_unlink` in tests
      - Does so for removing a temporary file


`Cabal-3.16.0.0`
----------------

  * Uses `c_getpid`
      - Does so for implementing a simpler variant of
        `createTempDirectory`
  * Uses `withFilePath`
      - Does so for setting an environment variable on Unix


`Cabal-ide-backend-1.23.0.0`
----------------------------

  * Uses `c_chmod`
      - Does so for defining an operation `setFileMode` to be used on
        Unix whose interface and implementation are identical to those
        of `setFileMode` from the `unix` package
  * Uses `c_close`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `c_getpid`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `c_open`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `o_BINARY`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `o_CREAT`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `o_EXCL`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `o_NOCTTY`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `o_NONBLOCK`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `o_RDWR`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
  * Uses `withFilePath`
      - Does so for implementing a variant of `System.IO.Temp`
        functionality
      - Does so for defining an operation `setFileMode` to be used on
        Unix whose interface and implementation are identical to those
        of `setFileMode` from the `unix` package


`cabal-install-3.16.0.0`
------------------------

  * Uses `withFilePath`
      - Does so in a copy of the `getExecutablePath` implementation from
        `base-4.6.0.0`


`cabal-install-bundle-1.18.0.2.1`
---------------------------------

  * Uses `c_chmod`
      - Does so for defining an operation `setFileMode` to be used on
        Unix whose interface and implementation are identical to those
        of `setFileMode` from the `unix` package
  * Uses `withFilePath`
      - Does so for setting an environment variable on Unix


`cabal-install-bundle-1.18.0.2.1`
---------------------------------

  * Uses `setNonBlockingFD`
      - Does so for creating a socket
      - Does so for creating a pair of connected sockets on Unix, using
        code that is almost identical to the code implementing
        `Network.Socket.Unix.socketPair`
      - Does so for accepting a connection


`cabal-install-ghc72-0.10.4`
----------------------------

  * Uses `c_chmod`
      - Does so for defining an operation `setFileMode` to be used on
        Unix whose interface is identical and whose implementation is
        almost identical to that of `setFileMode` from the `unix`
        package


`cabal-install-ghc74-0.10.4`
----------------------------

  * Uses `c_chmod`
      - Does so for defining an operation `setFileMode` to be used on
        Unix whose interface is identical and whose implementation is
        almost identical to that of `setFileMode` from the `unix`
        package


`Coadjute-0.1.1`
----------------

  * Uses `lstat`
      - Does so in the Unix-specific part of a more efficient
        implementation of `doesPathExist`
  * Uses `sizeof_stat`
      - Does so in the Unix-specific part of a more efficient
        implementation of `doesPathExist`


`core-program-0.7.0.0`
----------------------

  * Uses `hostIsThreaded`
      - Does so to ensure that the runtime system uses threading


`cradle-0.0.0.0`
----------------

  * Uses `hostIsThreaded`
      - Does so to ensure that the runtime system uses threading


`darcs-2.18.5`
--------------

  * Uses `c_open`
      - Does so for implementing a portable variant of `openFd`
  * Uses `c_close`
      - Does so for implementing a portable variant of `closeFd`


`darcs-beta-2.7.99.2`
---------------------

  * Uses `c_open`
      - Does so for implementing a portable variant of `openFd`
  * Uses `c_close`
      - Does so for implementing a portable variant of `closeFd`
  * Uses `c_dup2`
      - Does so for implementing a portable variant of `dupTo`


`darcs-cabalized-2.0.2.2`
-------------------------

  * Uses `getEcho`
      - Does so for checking whether the standard input is a terminal
        device with echo disabled
  * Uses `setEcho`
      - Does so for disabling echo for the standard input
  * Uses `setCooked`
      - Does so for disabling echo for the standard input


`darcs-cabalized-2.0.2.2`
-------------------------

  * Uses `CStat`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `c_fstat`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `lstat`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `sizeof_stat`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `statGetType`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `st_mode`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `st_size`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `st_mtime`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `s_isreg`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `s_isdir`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `s_isfifo`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `c_open`
      - Does so for implementing a portable variant of `openFd`
  * Uses `c_close`
      - Does so for implementing a portable variant of `closeFd`
  * Uses `c_dup2`
      - Does so for implementing a portable variant of `dupTo`


`directory-1.3.9.0`
-------------------

  * Uses `CStat`
      - Does so for implementing `getMetadataAt` for Unix


`doctest-0.24.2`
----------------

  * Uses `c_getpid`
      - Does so for creating a temporary directory


`dura-0.1`
----------

  * Uses `CFilePath`
      - Does so for accessing operating-system functionality regarding
        files
      - Can use `CString` instead
  * Uses `c_safe_open`
      - Does so for accessing operating-system functionality regarding
        files
  * Uses `c_close`
      - Does so for accessing operating-system functionality regarding
        files
  * Uses `withFilePath`
      - Does so for accessing operating-system functionality regarding
        files


`effectful-2.6.0.0`
-------------------

  * Uses `FD`
      - Does so for creating a pipe
      - Can use `CInt` instead


`effectful-zoo-0.0.6.0`
-----------------------

  * Uses `FD`
      - Does so for creating a pipe
      - Can use `CInt` instead


`exitcode-0.1.0.9`
------------------

  * Uses `FD`
      - Does so for implementing an internal class `HasFD`
      - Can use `CInt` instead


`file-io-0.1.5`
---------------

  * Uses `c_getpid`
      - Does so for building a semi-random string
  * Uses `o_EXCL`
      - Does so for constructing a path for a temporary file


`ghcup-0.1.50.2`
----------------

  * Uses `peekFilePath`
      - Does so for reading a directory entry
  * Uses `withFilePath`
      - Does so for implementing a variant of `openFd`


`Glob-0.10.2`
-------------

  * Uses `lstat`
      - Does so in the Unix-specific part of a more efficient
        implementation of `doesDirectoryExist`
  * Uses `sizeof_stat`
      - Does so in the Unix-specific part of a more efficient
        implementation of `doesDirectoryExist`
  * Uses `s_isdir`
      - Does so in the Unix-specific part of a more efficient
        implementation of `doesDirectoryExist`
  * Uses `st_mode`
      - Does so in the Unix-specific part of a more efficient
        implementation of `doesDirectoryExist`


`hackport-0.9.1.0`
------------------

  * Includes the complete `Cabal` package in some version version, with
    the uses mentioned [above](#cabal-31600) and several more
  * Includes the complete `cabal-install` package in some version, with
    the uses mentioned [above](#cabal-install-31600)


`haddock-2.29.1`
----------------

  * Uses `c_getpid`
      - Does so for getting the running process’s ID on Unix


`haddock-api-2.29.1`
--------------------

  * Uses `c_getpid`
      - Does so for getting the running process’s ID on Unix


`hashed-storage-0.5.11`
-----------------------

  * Uses `CStat`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `c_stat`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `c_fstat`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `lstat`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files` and a small addition to it
  * Uses `sizeof_stat`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `st_mode`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `st_size`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `st_mtime`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `s_isreg`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`
  * Uses `s_isdir`
      - Does so for implementing a portable variant of part of
        `System.Posix.Files`


`haskeline-0.8.3.0`
-------------------

  * Uses `FD`
      - Does so for implementing various operations for Unix
      - Can use `CInt` instead


`haskell-src-exts-1.23.1`
-------------------------

  * Incorporates the complete `System.Directory` module, for various
    uses in tests


`hmp3-1.5.2.1`
--------------

  * Uses `c_stat`
      - Does so for obtaining the status of a file
  * Uses `c_access`
      - Does so for implementing a variant of `getPermissions`
  * Uses `sizeof_stat`
      - Does so for obtaining the status of a file


`hs-server-starter-0.1.2.0`
---------------------------

  * Uses `setNonBlockingFD`
      - Does so for setting a socket file descriptor to operate in
        non-blocking mode


`hsyscall-0.4`
--------------

  * Re-exports `c_open`
      - Does so for providing low-level I/O functionality
  * Re-exports `c_close`
      - Does so for providing low-level I/O functionality
  * Re-exports `c_read`
      - Does so for providing low-level I/O functionality
  * Re-exports `c_write`
      - Does so for providing low-level I/O functionality
  * Re-exports `c_stat `
      - Does so for providing low-level I/O functionality
  * Re-exports `c_fcntl_read`
      - Does so for providing low-level I/O functionality
  * Re-exports `c_fcntl_write`
      - Does so for providing low-level I/O functionality
  * Re-exports `c_fcntl_lock`
      - Does so for providing low-level I/O functionality


`hw-polysemy-0.3.1.2`
---------------------

  * Uses `FD`
      - Does so for creating a pipe
      - Can use `CInt` instead


`ide-backend-server-0.10.0.2`
-----------------------------

  * Uses `FD`
      - Does so for setting the controlling terminal of the running
        process
      - Can use `CInt` instead
  * Uses `c_fcntl_write`
      - Does so for duplicating a file descriptor
  * Uses `withFilePath`
      - Does so for implementing a variant of `executeFile`


`lazy-scope-0.0.1`
------------------

  * Uses `c_unlink` in tests
      - Does so for removing a temporary file


`libfuse3-0.2.1.0`
------------------

  * Uses `c_fstat`
      - Does so for providing a high-level operation for obtaining the
        status of a file
  * Uses `lstat`
      - Does so for providing a high-level operation for obtaining the
        status of a file
  * Uses `c_access`
      - Does so for obtaining the access permissions of a file
  * Uses `peekFilePath`
      - Does so for constructing a `fuse_operations` structure from a
        high-level description of it
      - Does so for parsing a command line argument specifying a mount
        point
  * Uses `withFilePath`
      - Does so for constructing a `fuse_operations` structure from a
        high-level description of it
      - Does so for obtaining the access permissions of a file
      - Does so for providing a high-level operation for obtaining the
        status of a file
      - Does so for providing a high-level operation for obtaining the
        status of a file system
  * Uses `newFilePath`
      - Does so for providing a resource-safe version of it


`libyaml-0.1.4`
---------------

  * Uses `c_open`
      - Does so for opening a file
  * Uses `o_NOCTTY`
      - Does so for opening a file
  * Uses `o_RDONLY`
      - Does so for opening a file for reading
  * Uses `o_CREAT`
      - Does so for opening a file for writing
  * Uses `o_TRUNC`
      - Does so for opening a file for writing
  * Uses `o_WRONLY`
      - Does so for opening a file for writing
  * Uses `withFilePath`
      - Does so for opening a file


`libyaml-streamly-0.2.3.0`
--------------------------

  * Uses `c_open`
      - Does so for opening a file
  * Uses `o_NOCTTY`
      - Does so for opening a file
  * Uses `o_RDONLY`
      - Does so for opening a file for reading
  * Uses `o_CREAT`
      - Does so for opening a file for writing
  * Uses `o_TRUNC`
      - Does so for opening a file for writing
  * Uses `o_WRONLY`
      - Does so for opening a file for writing
  * Uses `withFilePath`
      - Does so for opening a file


`lock-file-0.7.0.0`
-------------------

  * Uses `c_open`
      - Does so for creating a lock file
  * Uses `c_close`
      - Does so for creating a lock file
  * Uses `c_getpid`
      - Does so for creating a lock file
  * Uses `o_BINARY`
      - Does so for creating a lock file
  * Uses `o_CREAT`
      - Does so for creating a lock file
  * Uses `o_EXCL`
      - Does so for creating a lock file
  * Uses `o_NOCTTY`
      - Does so for creating a lock file
  * Uses `o_NONBLOCK`
      - Does so for creating a lock file
  * Uses `o_RDWR`
      - Does so for creating a lock file
  * Uses `withFilePath`
      - Does so for creating a lock file


`MFlow-0.4.6.0`
---------------

  * Imports the whole module but does not use anything from it


`MissingK-0.0.1`
----------------

  * Uses `withFilePath`
      - Does so for setting an environment variable


`network-3.2.7.0`
-----------------

  * Uses `setNonBlockingFD`
      - Does so for setting a file descriptor to operate in non-blocking
        mode on Unix
  * Uses `setCloseOnExec`
      - Does so for setting the `close_on_exec` flag of a file
        descriptor on Unix


`network-fancy-0.2.4`
---------------------

  * Uses `FD`
      - Does so for setting a socket file descriptor to operate in
        non-blocking mode
      - Can use `CInt` instead
  * Uses `setNonBlockingFD`
      - Does so for setting a socket file descriptor to operate in
        non-blocking mode


`NGLess-1.5.0`
--------------

  * Uses `c_getpid`
      - Does so for creating a temporary directory
  * Uses `c_open`
      - Does so for creating a lock file
  * Uses `c_close`
      - Does so for creating a lock file
  * Uses `o_BINARY`
      - Does so for creating a lock file
  * Uses `o_CREAT`
      - Does so for creating a lock file
  * Uses `o_EXCL`
      - Does so for creating a lock file
  * Uses `o_NOCTTY`
      - Does so for creating a lock file
  * Uses `o_NONBLOCK`
      - Does so for creating a lock file
  * Uses `o_RDWR`
      - Does so for creating a lock file
  * Uses `withFilePath`
      - Does so for creating a lock file


`ngx-export-1.7.10.1`
---------------------

  * Uses `CFLock`
      - Does so for performing file locking
  * Uses `c_fcntl_lock`
      - Does so for choosing a file locking implementation


`pidfile-0.1.0.4`
-----------------

  * Uses `c_open`
      - Does so for creating and opening a PID file
  * Uses `c_write`
      - Does so for creating and opening a PID file
  * Uses `c_close`
      - Does so for closing and removing a PID file
  * Uses `c_unlink`
      - Does so for closing and removing a PID file
  * Uses `o_CREAT`
      - Does so for creating and opening a PID file
  * Uses `o_EXCL`
      - Does so for creating and opening a PID file
  * Uses `o_WRONLY`
      - Does so for creating and opening a PID file
  * Uses `withFilePath`
      - Does so for creating and opening a PID file


`plugins-1.6.2.1`
-----------------

  * Uses `c_open`
      - Does so for creating and opening a file
  * Uses `o_BINARY`
      - Does so for creating and opening a file
  * Uses `o_CREAT`
      - Does so for creating and opening a file
  * Uses `o_EXCL`
      - Does so for creating and opening a file
  * Uses `o_NOCTTY`
      - Does so for creating and opening a file
  * Uses `o_NONBLOCK`
      - Does so for creating and opening a file
  * Uses `o_RDWR`
      - Does so for creating and opening a file
  * Uses `withFilePath`
      - Does so for creating and opening a file


`posix-realtime-0.0.0.4`
------------------------

  * Imports the whole module but does not use anything from it


`posix-socket-0.3`
------------------

  * Uses `setNonBlockingFD`
      - Does so for creating a socket
      - Does so for accepting a connection
      - Does so for potentially accepting a connection


`process-1.6.26.1`
------------------

  * Uses `FD`
      - Does so for providing the file descriptors for the standard
        input, the standard output, and the standard error
      - Does so for constructing a handle from a file descriptor
      - Does so for obtaining the file descriptor of a handle
      - Does so for creating a pipe
      - Does so for running an interactive process
      - Can use `CInt` instead
  * Uses `fdGetMode`
      - Does so for constructing a handle from a file descriptor
  * Uses `withFilePath`
      - Does so for getting an environment variable
      - Does so for creating a process


`process-leksah-1.0.1.4`
------------------------

  * Uses `FD`
      - Does so for providing the file descriptors for the standard
        input, the standard output, and the standard error
      - Does so for constructing a handle from a file descriptor
      - Does so for obtaining the file descriptor of a handle
      - Does so for running an interactive process
      - Can use `CInt` instead


`pugs-compat-0.0.6.20150815`
----------------------------

  * Imports the whole module but does not use anything from it


`rawfilepath-1.1.1`
-------------------

  * Uses `FD`
      - Does so for providing the file descriptors for the standard
        input, the standard output, and the standard error
      - Does so for obtaining the file descriptor of a handle
      - Does so for creating a pipe
      - Does so for running an interactive process
      - Can use `CInt` instead


`rz-pipe-0.1.0`
---------------

  * Uses `FD`
      - Does so for parsing a file descriptor
      - Can use `CInt` instead


`scion-browser-0.5.0`
---------------------

  * Uses `c_getpid`
      - Does so for creating a temporary directory
      - Does so for creating and opening a file
  * Uses `c_open`
      - Does so for creating and opening a file
  * Uses `c_close`
      - Does so for creating and opening a file
  * Uses `o_BINARY`
      - Does so for creating and opening a file
  * Uses `o_CREAT`
      - Does so for creating and opening a file
  * Uses `o_EXCL`
      - Does so for creating and opening a file
  * Uses `o_NOCTTY`
      - Does so for creating and opening a file
  * Uses `o_NONBLOCK`
      - Does so for creating and opening a file
  * Uses `o_RDWR`
      - Does so for creating and opening a file
  * Uses `withFilePath`
      - Does so for creating and opening a file


`shell-pipe-0.1`
----------------

  * Imports the whole module but does not use anything from it


`sizes-2.4.0`
-------------

  * Uses `CFilePath`
      - Does so for obtaining the status of a file system
      - Can use `CString` instead


`splice-0.6.1.1`
----------------

  * Uses `setNonBlockingFD`
      - Does so for implementing socket-to-socket data transfer on Linux


`streamly-0.10.1`
-----------------

  * Uses `c_write`
      - Does so for non-blocking writing
  * Uses `c_safe_write`
      - Does so for non-blocking writing


`streamly-process-0.3.1`
------------------------

  * Uses `fdGetMode`
      - Does so for constructing a handle from a standard file
        descriptor


`system-fileio-0.3.16.7`
------------------------

  * Uses `c_open`
      - Does so for opening a file
  * Uses `c_close`
      - Does so for opening a file
  * Uses `o_NOCTTY`
      - Does so for opening a file
  * Uses `o_NONBLOCK`
      - Does so for opening a file
  * Uses `o_RDONLY`
      - Does so for opening a file for reading
  * Uses `o_WRONLY`
      - Does so for opening a file for writing or appending to it
  * Uses `o_APPEND`
      - Does so for opening a file for appending to it
  * Uses `o_RDWR`
      - Does so for opening a file for reading and writing
  * Uses `o_CREAT`
      - Does so for opening a file for writing, reading and writing, or
        appending
  * Uses `withFilePath`
      - Does so for canonicalizing a path on Unix
      - Does so for checking whether a path denotes a directory on Unix
      - Does so for creating a directory on Unix
      - Does so for opening a file
      - Does so for opening a file on Unix
      - Does so for opening a directory on Unix
      - Does so for removing a file on Unix
      - Does so for removing an empty directory on Unix
      - Does so for renaming a file on Unix
      - Does so for copying file permissions
      - Does so for setting the working directory on Unix

`temporary-rc-1.2.0.3`
----------------------

  * Uses `c_getpid`
      - Does so for creating a temporary directory
      - Does so for creating and opening a file
  * Uses `c_open`
      - Does so for creating and opening a file
  * Uses `c_close`
      - Does so for creating and opening a file
  * Uses `o_BINARY`
      - Does so for creating and opening a file
  * Uses `o_CREAT`
      - Does so for creating and opening a file
  * Uses `o_EXCL`
      - Does so for creating and opening a file
  * Uses `o_NOCTTY`
      - Does so for creating and opening a file
  * Uses `o_NONBLOCK`
      - Does so for creating and opening a file
  * Uses `o_RDWR`
      - Does so for creating and opening a file
  * Uses `withFilePath`
      - Does so for creating and opening a file


`temporary-resourcet-0.1.0.1`
-----------------------------

  * Uses `c_getpid`
      - Does so for creating a temporary directory
      - Does so for creating and opening a file
  * Uses `c_open`
      - Does so for creating and opening a file
  * Uses `c_close`
      - Does so for creating and opening a file
  * Uses `o_BINARY`
      - Does so for creating and opening a file
  * Uses `o_CREAT`
      - Does so for creating and opening a file
  * Uses `o_EXCL`
      - Does so for creating and opening a file
  * Uses `o_NOCTTY`
      - Does so for creating and opening a file
  * Uses `o_NONBLOCK`
      - Does so for creating and opening a file
  * Uses `o_RDWR`
      - Does so for creating and opening a file
  * Uses `withFilePath`
      - Does so for creating and opening a file


`text-ansi-0.3.0.1`
-------------------

  * Uses `c_isatty`
      - Does so for checking whether the standard input is a terminal
        device


`unix-2.8.7.0`
--------------

  * Uses `CFilePath`
      - Does so for implementing various operations for Unix
      - Can use `CString` instead
  * Uses `CStat`
      - Does so for implementing `getFileStatus`
      - Does so for implementing `getSymbolicLinkStatus`
  * Uses `CFlock`
      - Does so for implementing various operations for Unix
  * Uses `CSigset`
      - Does so for implementing various operations for Unix
  * Uses `CUtsname`
      - Does so for implementing `getSystemID`
  * Uses `CTermios`
      - Does so for implementing various operations for Unix
  * Uses `c_umask`
      - Does so for implementing `setFileCreationMask`
  * Uses `c_mkfifo`
      - Does so for implementing `createNamedPipe`
  * Uses `c_link`
      - Does so for implementing `createLink`
  * Uses `c_utime`
      - Does so for implementing various operations for Unix
  * Uses `c_unlink`
      - Does so for implementing `removeLink`
  * Uses `c_chmod`
      - Does so for implementing `setFileMode`
  * Uses `c_stat`
      - Does so for implementing `getFileStatus`
  * Uses `c_fstat`
      - Does so for implementing `getFdStatus`
  * Uses `c_ftruncate`
      - Does so for implementing `setFdSize`
  * Uses `c_access`
      - Does so for implementing various operations for Unix
  * Uses `c_fcntl_read`
      - Does so for implementing various operations for Unix
  * Uses `c_fcntl_write`
      - Does so for implementing various operations for Unix
  * Uses `c_lseek`
      - Does so for implementing `fdSeek`
  * Uses `c_fcntl_lock`
      - Does so for implementing various operations for Unix
  * Uses `c_sigemptyset`
      - Does so for implementing `emptySignalSet`
  * Uses `c_sigaddset`
      - Does so for implementing `addSignal`
  * Uses `c_sigprocmask`
      - Does so for implementing various operations for Unix
  * Uses `c_lflag`
      - Does so for implementing various operations for Unix
  * Uses `sizeof_sigset_t`
      - Does so for implementing various operations for Unix
  * Uses `st_dev`
      - Does so for implementing `deviceID`
  * Uses `st_ino`
      - Does so for implementing `fileID`
  * Uses `st_mode`
      - Does so for implementing `fileMode`
  * Uses `st_size`
      - Does so for implementing `fileSize`
  * Uses `st_mtime`
      - Does so for implementing various operations for Unix
  * Uses `o_CREAT`
      - Does so for implementing various operations for Unix
  * Uses `o_EXCL`
      - Does so for implementing various operations for Unix
  * Uses `o_TRUNC`
      - Does so for implementing various operations for Unix
  * Uses `o_NOCTTY`
      - Does so for implementing various operations for Unix
  * Uses `o_NONBLOCK`
      - Does so for implementing various operations for Unix
  * Uses `o_RDONLY`
      - Does so for implementing various operations for Unix
  * Uses `o_WRONLY`
      - Does so for implementing various operations for Unix
  * Uses `o_APPEND`
      - Does so for implementing various operations for Unix
  * Uses `o_RDWR`
      - Does so for implementing various operations for Unix
  * Uses `newFilePath`
      - Does so for implementing various operations for Unix
  * Uses `peekFilePath`
      - Does so for implementing various operations for Unix
  * Uses `peekFilePathLen`
      - Does so for implementing various operations for Unix
  * Uses `withFilePath`
      - Does so for implementing various operations for Unix
  * Uses `hostIsThreaded`
      - Does so for locking a semaphore


`unix-bytestring-0.4.0.3`
-------------------------

  * Uses `c_lseek`
      - Does so for implementing various operations for Unix


`unliftio-0.2.25.1`
-------------------

  * Uses `FD`
      - Does so for creating a pipe
      - Can use `CInt` instead
  * Uses `CFilePath`
      - Does so for implementing various operations for Unix
      - Can use `CString` instead
  * Uses `c_getpid`
      - Does so for creating a temporary directory
  * Uses `c_safe_open`
      - Does so for implementing various operations for Unix
  * Uses `c_close`
      - Does so for implementing various operations for Unix
  * Uses `setNonBlockingFD`
  * Uses `withFilePath`
      - Does so for implementing various operations for Unix


`wai-cli-0.2.3`
---------------

  * Uses `setNonBlockingFD`
      - Does so for setting a socket file descriptor to operate in
        non-blocking mode
