{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty

import qualified Data.Text.Lazy as T

import Meownicode

main = scotty 3000 $ do
  get "/" $ do
    setHeader "content-type" "text/html"
    file "meownicode.html"

  get "/encode" $ do
    setHeader "content-type" "text/html"
    file "meowencode.html"

  post "/encode" $ do
    paramString <- param "data"
    text . T.pack $ unwords $ meowencode paramString

  get "/decode" $ do
    setHeader "content-type" "text/html"
    file "meowdecode.html"

  post "/decode" $ do
    paramString <- param "data"
    text . T.pack $ meowdecode $ words paramString
