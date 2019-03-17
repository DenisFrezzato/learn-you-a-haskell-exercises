import Control.Applicative
import Data.Monoid

-- We can use the following type to simulate our own list
data List a = Empty | Value a (List a) deriving (Show, Eq)

-- Make the list a Functor
instance Functor List where
    fmap _ Empty = Empty
    fmap f (Value a as) = Value (f a) (fmap f as)

-- Write a function which appends one list on to another
combineLists:: List a -> List a -> List a
combineLists Empty as = as
combineLists as Empty = as
combineLists (Value head tail) bs = Value head (combineLists tail bs)

-- Make our list a Monoid
-- instance Monoid (List a) where
--     mempty = Empty
--     mappend = combineLists

-- Make our list an Applicative
instance Applicative List where
    pure a = Value a Empty
    Empty <*> _ = Empty
    (Value head tail) <*> bs = combineLists (fmap head bs) (tail <*> bs)

-- Make sure that the List obeys the laws for Applicative and Monoid
list1 :: List Integer
list1 = Value 666 Empty
list2 :: List Integer
list2 = Value 111 Empty
list3 :: List Integer
list3 = Value 777 Empty
list4 = Value (-1) Empty

applicativeLaw1 = (pure id <*> list1) == list1 

-- applicativeLaw2 = (pure (.) <*> list4 <*> list3 <*> list1) == (list4 <*> (list3 <*> list1))

listPure :: x -> (List x)
listPure = pure
-- applicativeLaw3 = (pure (*6) <*> pure 1) == (pure ((*6) 1))

const7 :: Integer
const7 = 7
-- applicativeLaw4 = (list4 <*> pure const7) == (pure ($ const7) <*> list4)

-- -- Create some lists of numbers of different lengths such as:
twoValueList = Value 10 $ Value 20 Empty
threeValueList = Value 6 $ Value 5 $ Value 53 Empty

-- -- Use <$> on the lists with a single-parameter function, such as:
plusTwo = (+2)

resPlusTwo = plusTwo <$> twoValueList
resPlusTwo' = plusTwo <$> threeValueList

-- -- Use <$> and <*> on the lists with a binary function
resLiftedSum = (+) <$> twoValueList <*> threeValueList

-- -- Create some lists of binary functions
binaryFunctionList = combineLists (listPure (+)) $ combineLists (listPure (^)) (listPure (*))

-- Use <*> on the binary functions list and the number lists
bigNumbers = binaryFunctionList <*> twoValueList <*> threeValueList
