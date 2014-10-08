module Main where

import Database.HDBC (runRaw, disconnect)
import Test.Hspec
import Spec
import SpecHelper (openConnection, loadFixture)

main :: IO ()
main = do
  c <-openConnection
  runRaw c "drop schema if exists \"1\" cascade"
  runRaw c "drop schema if exists private cascade"
  runRaw c "drop schema if exists dbapi cascade"
  loadFixture "roles" c
  loadFixture "schema" c
  disconnect c
  hspec spec