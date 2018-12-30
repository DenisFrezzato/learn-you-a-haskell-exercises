-- This function should print a single digit number as English text, or "unknown" if it's out of the range 0-9
englishDigit :: Int -> String
englishDigit 0 = show "Zero"
englishDigit 1 = show "One"
englishDigit 2 = show "Two"
englishDigit 3 = show "Three"
englishDigit 4 = show "Four"
englishDigit 5 = show "Five"
englishDigit 6 = show "Six"
englishDigit 7 = show "Seven"
englishDigit 8 = show "Eight"
englishDigit 9 = show "Nine"
englishDigit _ = show "unknown"

-- given a tuple, divide fst by snd, using pattern matching. 
-- it should return undefined for division by zero
divTuple :: (Eq a, Fractional a) => (a, a) -> a
divTuple (_, 0) = undefined
divTuple (x, y) = x / y

-- if the first three numbers in a list are all zero, return True
threeZeroList :: [Int] -> Bool
threeZeroList [0:0:0:xs] = True
threeZeroList _ = False
