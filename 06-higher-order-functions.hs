-- Sum the numbers between two inclusive values recursively, assuming a < b when the function is first called
-- Example: sumInts 0 1 = 1
--          sumInts 1 3 = 6
sumInts :: Int -> Int -> Int
sumInts a b = if a <= b then a + sumInts (a + 1) b else 0

-- Define a square function
sq :: Int -> Int
sq x = x * x

-- Sum the squares between two numbers. This function should be similar to the sumInts function
sumSquares :: Int -> Int -> Int
sumSquares a b = if a <= b then a * a + sumSquares (a + 1) b else 0

-- Define a higher order sum function which accepts an (Int -> Int) function to apply to all integers between two values.
-- Again this should look similar to the sumInts and sumSquares functions
higherOrderSum :: (Int -> Int) -> Int -> Int -> Int
higherOrderSum intApplication a b = if a <= b
    then intApplication a + higherOrderSum intApplication (a + 1) b
    else 0

-- Define the square sum in terms of higherOrderSum
hoSumSquares :: Int -> Int -> Int
hoSumSquares = higherOrderSum sq

-- Define the sum between two values in terms of higherOrderSum
-- Note there is no parameter on the function definition
-- Try to use a lambda if possible
hoSumInts :: Int -> Int -> Int
hoSumInts = higherOrderSum (\n -> n)

-- Create a new higher order method which generalises over the function provided by sumInts (That is, parameterize (+) :: Int -> Int -> Int) between a and b
-- This will give the ability to perform utilities such as the product of all squares (or any other Int -> Int function) between a and b
-- You will also need to generalise the base case
-- You can also define the function signature yourself, which leaves you free to define the parameters and their order
-- To be clear, your function will need to handle:
--  - A start value, a :: Int
--  - A end value, b :: Int
--  - A function to apply to each value, op :: Int -> Int
--  - A function to apply between each value, f :: Int -> Int -> Int
--  - A value to return in the base case when a > b, z :: Int
higherOrderSequenceApplication :: (Int -> Int) -> (Int -> Int -> Int) -> Int -> Int -> Int -> Int
higherOrderSequenceApplication op f z a b = if a <= b
    then f (op a) (higherOrderSequenceApplication op f z (a + 1) b)
    else z

-- Define a factorial method using the higherOrderSequenceApplication
hoFactorial :: Int -> Int
hoFactorial = higherOrderSequenceApplication (\n -> n) (*) 1 2
