module PowerPlantsSpec where

import PowerPlants (allPlants)
import Powergrid (Plant(..), FuelType(..))

import Test.Hspec
import Test.QuickCheck

spec :: Spec
spec = do
  describe "PowerPlants.allPlants" $ do
    it "returns all plants" $ do
      length allPlants `shouldBe` 9

    it "starts with an Oil plant" $ do
      head allPlants `shouldBe` Plant {fuel = (Oil, 2), cities = 1, price = 3}

    it "ends with an Eco plant" $ do
      last allPlants `shouldBe` Plant {fuel = (Eco, 0), cities = 1, price = 13}

    it "has correct second power plant" $ do
      (head (tail allPlants)) `shouldBe` Plant {fuel = (Coal, 2), cities = 1, price = 4}
      
