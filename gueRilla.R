### GueRilla - a simple unit testing tool for R programming
###
### HOW TO USE:
### 1. source this file
###    source('./gueRilla.R')
### 2. create new GueRilla object
###    mytests <- Guerilla()
### 3. add tests, build all objects to be tested as needed
###    mytests$add( a_list )
### 4. a_list must be comprised of these elements in order:
###    - description of the test (character)
###    - testing logic (function)
###    - parameters to pass in to the testing function (character)
###    - expected outcome of testing logic (logical) - put in NA if output is meant to be manually inspected
###    SEE EXAMPLE FILE unit_test_dice.R
### 5. run the tests after all tests are defined and added
###    mytests$run()
###    this will add another element to each test, named: result, and will be printed when displaying the results
### 6. To see the test results, simply call display()
###    mytests$display()


library(R6)
library(assertive)
library(tidyverse)

gueRilla_factory <- R6Class(
    "GueRilla",
    private = list(
        ..tests = list(),
        ..numTests = 0
    ),
    active = list(),
    public = list(
        seeTests = function(){
            private$..tests
        },
        add = function( alist ){
            assert_is_list( alist )
            assert_is_of_length( alist, 4 )
            assert_is_character( alist[[1]] )
            assert_is_function( alist[[2]] )
            assert_is_character( alist[[3]] )
            assert_is_logical( alist[[4]] )
            private$..numTests <- private$..numTests + 1
            private$..tests[[ private$..numTests ]] <- alist
        },

        run = function(){
            private$..tests <- lapply(private$..tests, function(x){
                result <- x[[2]]( eval(parse(text=x[[3]])) )
                if( !is.na( x[[4]] ) ){
                    result <- result == x[[4]]
                }
                x$result <- result
                x
            })
        },

        display = function(){
            invisible(
                lapply(private$..tests, function(x){
                    message( paste( "\n", x[[1]], ":" ) )
                    if( !is.na(x[[4]]) ){
                        message( paste( "\t", x$result ) )
                    } else {
                       print(x$result)
                    }
                })
            )
        }
    ) # end public()
) # end R6Class()

GueRilla <- function(){
    gueRilla_factory$new()
}



