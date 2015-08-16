module XMonad.Wallpaper where

import XMonad.Core
import XMonad.Wallpaper.Find
import XMonad.Wallpaper.Expand

import Control.Applicative
import System.Random

setRandomWallpaper filepaths = do
    rootPaths  <- mapM expand filepaths
    candidates <- findImages rootPaths
    wallpaper  <- ((!!) candidates) <$> getStdRandom (randomR (0, length candidates - 1)) 
    spawn $ "feh --bg-scale " ++ wallpaper
