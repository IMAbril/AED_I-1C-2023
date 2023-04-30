esCapicua :: Integer -> Bool
esCapicua n | n < 10 = True
            | otherwise = show n == reverse (show n)
            