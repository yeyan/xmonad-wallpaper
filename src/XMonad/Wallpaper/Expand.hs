module XMonad.Wallpaper.Expand where

import Control.Monad.State
import Data.List
import Data.Char

import System.Posix.Env
import Data.Maybe
import Control.Applicative

data AST = Variable String | Literal String
    deriving (Show)

isExpr a = isAlphaNum a || a == '_'

literal str =
    let (a, b) = break (== '$') str in (Literal a, b)

variable ('{':as) =
    let (a, b) = break (== '}') as in (Variable a, tail b)
variable as = 
    let (a, b) = break (not . isExpr) as in (Variable a, b)

parse []       = []
parse ('$':as) =
    let (a, b) = variable as in a : parse b
parse as = 
    let (a, b) = literal as in a : parse b
    
t0 = do
    let ast = parse "$HOME/Pictures/Wallpapers"
    values <- mapM interpolate ast
    putStrLn $ show values

interpolate (Variable var) = maybe "" id <$> getEnv var
interpolate (Literal str) = return str

expand str = do
    let ast = parse str
    concat <$> mapM interpolate ast
