## GueRilla - a simple unit testing tool for R programming

### HOW TO USE:

1. source this file
   ```source('./gueRilla.R')```

2. create new GueRilla object
   ```mytests <- Guerilla()```

3. add tests, build all objects to be tested as needed
   ```mytests$add( a_list )```

4. a_list must be comprised of these elements in order:
   - description of the test (character)
   - testing logic (function)
   - parameters to pass in to the testing function (character)
   - expected outcome of testing logic (logical) - put in NA if output is meant to be manually inspected
   SEE EXAMPLE FILE unit_test_dice.R

5. run the tests after all tests are defined and added
   ```mytests$run()```
   this will add another element to each test, named: result, and will be printed when displaying the results

6. To see the test results, simply call display()
   ```mytests$display()```

