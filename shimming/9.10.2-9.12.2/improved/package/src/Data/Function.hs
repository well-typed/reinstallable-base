{-# LANGUAGE Safe #-}

-- |
--
-- Module      :  Data.Function
-- Copyright   :  Nils Anders Danielsson 2006
--             ,  Alexander Berntsen     2014
-- License     :  BSD-style (see the LICENSE file in the distribution)
--
-- Maintainer  :  libraries@haskell.org
-- Stability   :  stable
-- Portability :  portable
--
-- Simple combinators working solely on and with functions.
--

module Data.Function
    (-- *  "Prelude" re-exports
     id,
     const,
     (.),
     flip,
     ($),
     -- *  Other combinators
     (&),
     fix,
     on,
     applyWhen
     ) where

import GHC.Internal.Data.Function hiding (flip)
import qualified GHC.Internal.Data.Function as Internal (flip)

{-
    A version of 'flip' that is guaranteed to not use representation
    polymorphism.
-}
flip :: (a -> b -> c) -> (b -> a -> c)
flip = Internal.flip
{-# INLINE flip #-}
