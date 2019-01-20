import System.Environment
import System.Random
import Data.List

{-
 - Lets implement the UNIX echo command
 - The program arguments are simply printed to the standard output.
 - If the first argument is -n, this argument is not printed, and no trailing newline is printed
 -}
  
main = do
    flag:args <- getArgs
    let isFlag = flag == "-n"
    let output = unwords $ if isFlag then args else flag:args
    let outputFn = if isFlag then putStr else putStrLn 
    outputFn output

{- Write a lottery number picker
 - This function should take a StdGen instance, and produce a list of six unique numbers between 1 and 49, in numerical order
 -}
lottery :: StdGen -> [Int]
lottery gen = sort $ take 6 $ nub $ randomRs (1, 49) gen

-- main = do
--     gen <- getStdGen
--     putStrLn . unwords . map show $ lottery gen
