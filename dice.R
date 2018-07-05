library(R6)
library(tidyverse)
library(assertive)


dice_factory <- R6Class(
    "Dice",
    private = list(
        ..faces = list("1","2","3","4","5","6"),
        ..numFaces = 6
    ),
    public = list(
        initialize = function(){

        },
        roll = function(){
            private$..faces[ ceiling( runif( 1, 0, private$..numFaces ) ) ]
        }
    ),
    active = list()
)

Dice <- function(){
    dice_factory$new()
}

