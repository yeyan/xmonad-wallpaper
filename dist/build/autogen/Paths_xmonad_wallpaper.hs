module Paths_xmonad_wallpaper (
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
version = Version [0,0,1,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/haskell/.cabal/bin"
libdir     = "/home/haskell/.cabal/lib/x86_64-linux-ghc-7.10.1/xmona_CDaX9Km7pm5HPpa0bUKbAi"
datadir    = "/home/haskell/.cabal/share/x86_64-linux-ghc-7.10.1/xmonad-wallpaper-0.0.1.0"
libexecdir = "/home/haskell/.cabal/libexec"
sysconfdir = "/home/haskell/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "xmonad_wallpaper_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "xmonad_wallpaper_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "xmonad_wallpaper_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "xmonad_wallpaper_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "xmonad_wallpaper_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
