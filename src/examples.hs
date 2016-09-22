-- install Haskell Platform https://www.haskell.org/platform/

  -- https://wiki.haskell.org/Tutorials
  -- http://stackoverflow.com/questions/1012573/getting-started-with-haskell

  -- http://learnyouahaskell.com/chapters
  -- http://book.realworldhaskell.org/read/

  -- https://learnxinyminutes.com/docs/haskell/
  -- https://wiki.haskell.org/99_questions/1_to_10


-- run GHC interactive from command line: ghci

-- load functions from examples.hs by :l examples
-- reload file by :r
-- load modules with :m + Data.list Data.Map Data.Set
-- check type :t valueToCheck




import Data.List

-- function
main = do

  -- string concatenation
  print ("aaa" ++ "bbb")

  print (succ 10)
  print (min 2 3)
  print (max 2 3)
  print (2 `max` 3)


printHello = putStrLn "Hello"
mySumFn a b = a + b
squareMe x = x * x
doubleSmallNumber x = if x > 100  
                        then x  
                        else x*2   

nestedFnExample = do
  let myMul a b = a * b
  print (myMul 2 5)



--------------------------------------
-- LISTS
--------------------------------------

listExample = do

  let myList = [1 ,2 ,3, 4, 5, 6]
  
  putStrLn "my list is: " 
  print myList

  putStrLn "Second element of my list is:"
  print (myList !! 1)

  putStrLn "My list head is first element of list:"
  print (head myList)

  putStrLn "My list tail is list without head:"
  print (tail myList)

  putStrLn "Last element:"
  print (last myList)

  putStrLn "Everything except last element:"
  print (init myList)

  putStrLn "List length:"
  print (length myList)

  putStrLn "Is my list empty?"
  print (null myList)

  putStrLn "My list reversed:"
  print (reverse myList)

  putStrLn "is 6 element of my list?"
  print (6 `elem` myList)

  -- string is also list
  -- take function is taking x elements from the begining of list
  -- cycle function takes list and cycles it into infinite list (so we must use take to cut it)
  -- repeat function produces infinite list of just one element
  print (take 12 (cycle "LOL "))

  -- [5, 5, 5]
  print (replicate 3 5)



--------------------------------------
-- TUPLES
--------------------------------------

tuplesExample = do

  -- first element of tuple
  print (fst (1, 2))

  -- second element of tuple
  print (snd (1, 2))

  -- zip takes two lists and creates one list of tuples
  print (zip [1 .. 5] ["one", "two", "three", "four", "five"])



--------------------------------------
-- LIST COMPREHENSION
--------------------------------------

listCompExample = do
  
  -- make list of doubled numbers from 1 to 10
  print ([x*2 | x <- [1..10]] )

  -- with condition (or predicate, we can use many of them after comma)
  print ([x*2 | x <- [1..10], x*2 >= 12] )

  -- function that takes list xs, 
  -- filter odd numbers and map it to boom if greater than 10 or to bang
  let boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]  
  print (boomBangs [8, 9, 11, 12])

  -- which right triangle that has integers for all sides
  -- and all sides equal to or smaller than 10 has a perimeter of 24
  let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]
  print rightTriangles



--------------------------------------
-- FUNCTIONS
--------------------------------------

-- function with type declaration
removeNonUppercase :: [Char] -> [Char]  
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']] 

-- 3 parameters and return type
addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z  

-- guard patterns
sayMe :: (Integral a) => a -> String  
sayMe 1 = "One!"  
sayMe 2 = "Two!"  
sayMe 3 = "Three!"  
sayMe 4 = "Four!"  
sayMe 5 = "Five!"  
sayMe x = "Not between 1 and 5" 

factorial :: (Integral a) => a -> a  
factorial 0 = 1  
factorial n = n * factorial (n - 1)

fibonacci :: (Integral a) => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

third :: (a, b, c) -> c
third (_, _, z) = z

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

zip' :: [a] -> [b] -> [(b, a)]
zip' _ [] = []
zip' [] _ = []
zip' (a:aa) (b:bb) = (b, a): zip' aa bb



--------------------------------------
-- HIGH ORDER FUNCTIONS
--------------------------------------

map' :: (a -> b) -> [a] -> [b]  
map' _ [] = []  
map' f (x:xs) = f x : map f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' predicateFn (x:xs)
  | predicateFn x = x : filter' predicateFn xs 
  | otherwise = filter' predicateFn xs

filter'' :: (a -> Bool) -> [a] -> [a]  
filter'' p = foldr (\x acc -> if p x then x : acc else acc) []  

-- fuctions composition with "."
dictGetValByKey dict key = snd . head $ filter (\(k, v) -> k == key) dict



--------------------------------------
-- CUSTOM TYPES
--------------------------------------

data Person = Person { firstName :: String, lastName :: String } deriving (Show)

introducePerson :: Person -> IO()
introducePerson p = putStrLn $ "Hi, I'am " ++ firstName p ++ " " ++ lastName p

introduceExample = do
  let dude = Person "Jan" "Kowalski"
  introducePerson dude