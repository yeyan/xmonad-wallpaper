module Paths_bg_changer (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/haskell/Projects/bg-changer/.cabal-sandbox/bin"
libdir     = "/home/haskell/Projects/bg-changer/.cabal-sandbox/lib/x86_64-linux-ghc-7.10.1/bgcha_93SMYRNdopbERdLVysCsdk"
datadir    = "/home/haskell/Projects/bg-changer/.cabal-sandbox/share/x86_64-linux-ghc-7.10.1/bg-changer-0.1.0.0"
libexecdir = "/home/haskell/Projects/bg-changer/.cabal-sandbox/libexec"
sysconfdir = "/home/haskell/Projects/bg-changer/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "bg_changer_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "bg_changer_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "bg_changer_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "bg_changer_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "bg_changer_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
