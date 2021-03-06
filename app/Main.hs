module Main where

import Data.List

import PowerPlants(allPlants)
import Powergrid(FuelType(..), burn)

main :: IO ()
main = do
    let fuelsWithPlants =
            zipWith burner
                [ Just (Oil, 3)
                , Just (Coal, 4)
                , Just (Hybrid [Coal], 1)
                , Just (Garbage, 1)
                , Just (Oil, 7)
                , Just (Coal, 4)
                , Just (Oil, 1)
                , Just (Coal, 3)
                , Nothing
                ] allPlants
        burner = \fuel plant -> burn plant fuel
        summer = \memo (output, _) -> memo + output


    putStrLn $ "We have a liftoff. Burned so far: \n"
        ++ (intercalate ", \n" $ map show fuelsWithPlants)
        ++ "\nPowered " ++ show (foldl summer 0 fuelsWithPlants) ++ " cities in total"
