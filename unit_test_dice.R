################################
###     TESTS DEFINITION     ###
################################
source( './gueRilla.R' )
mytests <- GueRilla()

source('./dice.R')
### create new dice
d <- Dice()

mytests$add( list(
    "dice contains class \"Dice\"",
    function(d){
        "Dice" %in% class(d)
    },
    "d=d",
    TRUE
) )

mytests$add( list(
    "dice roll greater or equal to 1",
    function(d){
        as.numeric( unlist( d$roll() ) ) >= 1
    },
    "d=d",
    TRUE
) )

mytests$add( list(
    "dice roll lesser or equal to 6",
    function(d){
        as.numeric( unlist( d$roll() ) ) <= 6
    },
    "d=d",
    TRUE
) )


### testing outcome of rolls
rolls <- sapply( c(1:60000), function(X){
    as.numeric( d$roll() )
} )

mytests$add( list(
    "no rolls are out of range",
    function(rolls){
        sum( rolls < 1 | rolls > 6 ) == 0
    },
    "rolls=rolls",
    TRUE
) )

mytests$add( list(
    "all rolls within range",
    function(rolls){
        sum( rolls >=1 & rolls<=6 ) == 60000
    },
    "rolls=rolls",
    TRUE
) )

mytests$add( list(
    "visual inspection of the distribution of rolls",
    function(rolls){
        table( rolls )
    },
    "rolls=rolls",
    NA
) )




#########################
###     RUN TESTS     ###
#########################
mytests$run()
mytests$display()

