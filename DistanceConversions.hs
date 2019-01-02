module DistanceConversions
( chainsToYards
, yardsToFeet
, feetToInches
, inchesToCentimetres
, centimetresToMetres
) where

chainsToYards :: Float -> Float
chainsToYards = (* 22)

-- Define yards to feet
yardsToFeet ::  Float -> Float
yardsToFeet = (* 3)

-- Define feet to inches
feetToInches :: Float -> Float
feetToInches = (* 12)

-- Define inches to centimetres
inchesToCentimetres :: Float -> Float
inchesToCentimetres = (* 2.54)

centimetresToMetres :: Float -> Float
centimetresToMetres = (/ 100)
