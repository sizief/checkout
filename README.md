# checkout
Simple in memory chckout system

## Repository
Since we are not using any storage technology, we defined a repository to save the state of objects. 
Repository is responsible only for save state ob objects. Objects themselves did not know anything about this storgae. 

## Floats vs BigDecimals
It's not a good idea to have prices as a float in our system, so prices are converted to `BigDecimal` to make sure accuracy. 

## TODO
x. Product - 1
x. Load product - 0.5 
O. Discount - 2
O. Checkout - 1
5. Readme - 0.5
