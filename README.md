 # checkout
  A simple in memory checkout system
  ## Usage
  ` $ bundler` You need `Ruby 2.6.3` however I think it would run on any `2.x` versions.
  ` $ rake test` to run all test
  ` $ ruby app.rb` to see example usage
  
  ## Modules
   There are four main modules/Class used in this project:
   - [Repository](/lib/store/repository.rb) is a simple implementation of repository pattern. Why we need repository? to save the state of objects (products, discounts). It has two main part. First [Repository](/lib/store/repository.rb) itself, it behave like Database object. And then [Item Reposittory](/lib/store/repository/item_repository.rb) which acts as a index or table name. 
   Also there is `Repository::Searchability` module that can be extended into any class and it would give them a ActiveRecord like interface. (Book.all or Book.find)
   
   - [Product](/lib/store/product.rb) which defines products. Easy. Product list can be defined using `json`. See example [here](/data/products.json)
   
   - [Discount](/lib/store/discount.rb) which holds all discount functions. The main module is responsible for two things: 1. Discount factory and 2. loop through all given discount types and returns total discounts. There are two separate discounts defined in [discount folder](/lib/store/discount). Any number of discounts can be defined in the future. The only rule is they should implement `total` method. Like [Free discount](/lib/store/discount/free.rb)for example.
   All discounts configuration is stored in [JSON config file](/data/discounts.json)  
   - [Checkout](//lib/store/checkout.rb). The only module that dependent to `repository` is `checkout`. (Discount can be used in other projects without any dependency). It's job is straight forward:
   A. User asks to add item to his basket
   B. Checkout asks from Product for existence of that product
   C. If exists it would be added to the basket
   D. As soon as user ask for `total` it would convert product objects to hash and sends it to discount (with discount type that defined before). Then the discount price would be deducted from total price and the number would be returned to user.
   
 ## Notes
 - I use hashes of data for testing discounts in three separate files. It is not dry, should be gather all test data in one place. For this phase I think it is fine since it can help to read tests better.
  - For numbers I use BigDecimals instead of floats. Floats are not accurate when we do calculations, specially with the case of percentage discounts. 
  
