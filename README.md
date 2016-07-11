Meownicode
==========

Meownicode is a library based on Glounicode that encodes unicode strings using “meow”.

```
> ghci Meownicode.hs
*Meownicode> let msg = meowencode "Meownicode is a library that encodes unicode strings using “meow”."
*Meownicode> import Data.List
*Meownicode Data.List> intercalate " " msg 
"meoooooooowwwwwwww meoooooooooooww meooooooooooooww meoooooooooooowwwwwwwwww meoooooooooooow meooooooooooowwwwww meoooooooooowwwwwwwwww meooooooooooooww meooooooooooow meoooooooooooww meoooowww meooooooooooowwwwww meoooooooooooowwwwww meoooowww meoooooooooowwwwwwww meoooowww meooooooooooowwwwwwwww meooooooooooowwwwww meoooooooooowwwwwwwww meoooooooooooowwwww meoooooooooowwwwwwww meoooooooooooowwwww meoooooooooooooww meoooowww meoooooooooooowwwwwww meooooooooooowwwww meoooooooooowwwwwwww meoooooooooooowwwwwww meoooowww meoooooooooooww meoooooooooooow meoooooooooowwwwwwwwww meooooooooooooww meooooooooooow meoooooooooooww meoooooooooooowwwwww meoooowww meoooooooooooowwwwwwww meoooooooooooow meooooooooooowwwwww meoooooooooowwwwwwwwww meooooooooooooww meooooooooooow meoooooooooooww meoooowww meoooooooooooowwwwww meoooooooooooowwwwwww meoooooooooooowwwww meooooooooooowwwwww meoooooooooooow meooooooooooowwww meoooooooooooowwwwww meoooowww meoooooooooooowwwwwwww meoooooooooooowwwwww meooooooooooowwwwww meoooooooooooow meooooooooooowwww meoooowww meeeowww mmeow mmeooowwwwwwwww meooooooooooowwwwwwwwww meoooooooooooww meooooooooooooww meoooooooooooowwwwwwwwww meeeowww mmeow mmeooowwwwwwwwww meooooowwwwwww"
*Meownicode Data.List> putStrLn $ meowdecode msg 
Meownicode is a library that encodes unicode strings using “meow”.
```
