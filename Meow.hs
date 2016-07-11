{-# LANGUAGE DeriveDataTypeable #-}

import System.Console.CmdArgs
import Meownicode

data Meow = Meow {decode :: Bool} deriving (Show, Data, Typeable)

meow = Meow {
  decode = def &= help "Decode a meow encoded string"
} &= help "That help" &= summary "meow"

optionHandler Meow{decode=True} = meowdecode . words
optionHandler _ = unwords . meowencode

main = cmdArgs meow >>= interact . optionHandler

