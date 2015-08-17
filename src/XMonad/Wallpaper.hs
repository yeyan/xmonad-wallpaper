module XMonad.Wallpaper where

import XMonad.Core
import XMonad.Wallpaper.Find
import XMonad.Wallpaper.Expand

import Control.Applicative
import System.Random

{- |
Example usage: (~/.xmonad/xmonad.hs)

> import XMonad
> import XMonad.Config.Desktop
> import XMonad.Wallpaper
> main = do
>     setRandomWallpaper ["paths-of-your choice", "$HOME/Pictures/Wallpapers"]
>     xmonad $ desktopConfig
>        { terminal    = "urxvt"
>        , modMask     = mod4Mask
>        }

Paths will be expanded using environment variables. 
The following syntax are supported:

> epxand $HOME/Pictures
\/home\/user/Pictures

> expand ${HOME}ABC
\/home\/userABC

-}

setRandomWallpaper filepaths = do
    rootPaths  <- mapM expand filepaths
    candidates <- findImages rootPaths
    wallpaper  <- ((!!) candidates) <$> getStdRandom (randomR (0, length candidates - 1)) 
    spawn $ "feh --bg-scale " ++ wallpaper
