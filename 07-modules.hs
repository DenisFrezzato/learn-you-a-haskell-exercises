-- Fill in the DistanceConversions module first, and import it here
import DistanceConversions

-- create a higher-order function for converting an area between two dimensions
-- this will take the function for converting a distance, and an area to convert
-- using the functions defined in the DistanceConversions module
-- Example areaConv inchesToCentimetres 9 = 58.0644

areaConv :: (Float -> Float) -> Float -> Float
areaConv linearConversion area = converted * converted
    where
        converted = linearConversion $ sqrt area

-- define a function for converting square inches into square centimetres
sqInToSqCm :: Float -> Float
sqInToSqCm = areaConv inchesToCentimetres

-- define a function for converting square chains (22 yards) to square metres
sqChainsToSqM :: Float -> Float
sqChainsToSqM a = metres * metres
    where
        metres = centimetresToMetres $ inchesToCentimetres $ feetToInches $ yardsToFeet $ chainsToYards (sqrt a)
