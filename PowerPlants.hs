module PowerPlants (allPlants) where

import Powergrid (Plant(..), Fuel, FuelType(..))


allPlants :: [Plant]
allPlants =
    [ Plant {fuel = (Oil, 2), cities = 1, price = 3}
    , Plant {fuel = (Coal, 2), cities = 1, price = 4}
    , Plant {fuel = (Hybrid [Coal, Oil], 2), cities = 1, price = 5}
    , Plant {fuel = (Garbage, 1), cities = 1, price = 6}
    , Plant {fuel = (Oil, 3), cities = 2, price = 7}
    , Plant {fuel = (Coal, 3), cities = 2, price = 8}
    , Plant {fuel = (Oil, 1), cities = 1, price = 9}
    , Plant {fuel = (Coal, 2), cities = 2, price = 10}
    , Plant {fuel = (Eco, 0), cities = 1, price = 13}
    ]
