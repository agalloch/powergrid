module Powergrid (Plant(..), FuelType(..), Fuel, Output, burn, createPlant) where

data FuelType = Coal | Oil | Garbage | Uranium | Hybrid [FuelType] | Eco deriving (Show, Eq)

type Capacity = Int
type Price = Int
type Output = Int

type Fuel = (FuelType, Capacity)

data Plant = Plant
        { fuel :: Fuel
        , cities :: Output
        , price :: Price
        } deriving (Show)


createPlant :: Fuel -> Output -> Price -> Plant
createPlant plantFuel output price =
    Plant {fuel = plantFuel, cities = output, price = price}


burn :: Plant -> Maybe Fuel -> (Output, Maybe Fuel)
burn Plant { fuel = (Eco, _), cities = output, price = _ } fuelToBurn = (output, fuelToBurn)

burn Plant { fuel = f@(Hybrid (x:xs), fCap), cities = output, price = _ } fuelToBurn@(Just (fuelType, quantity)) =
    (0, fuelToBurn)

burn Plant { fuel = f@(fType, fCap), cities = output, price = _ } fuelToBurn@(Just (fuelType, quantity)) =
    if sufficientFuel f fuelToBurn
    then (output, Just (fuelType, (abs quantity) - (abs fCap)))
    else (0, fuelToBurn)

burn _ Nothing = (0, Nothing)


sufficientFuel :: Fuel -> Maybe Fuel -> Bool
sufficientFuel (plantFuel, plantCapacity) (Just (fuelToBurn, quantity)) =
    plantFuel == fuelToBurn && (abs plantCapacity) <= (abs quantity)

sufficientFuel _ _ = False
