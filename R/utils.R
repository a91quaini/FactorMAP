# Author: Alberto Quaini

## Check returns and factors
# Checks that the main data arguments, namely returns and factors, are
# conforming to the packgae implementation.
CheckData = function(returns, factors) {

  stopifnot("`returns` does not contain numeric values" = is.numeric(returns))
  stopifnot("`factors` does not contain numeric values" = is.numeric(returns))
  stopifnot("`returns` and `factors` must have the same number of rows" = nrow(returns) == nrow(factors))
  stopifnot("`returns` contains more assets (columns) than observations (rows)" = nrow(returns) > ncol(returns))
  stopifnot("`factors` contains more variables (columns) than observations (rows)" = nrow(factors) > ncol(factors))
  stopifnot("the number of `returns` must be grater than the number of `factors`" = ncol(returns) > ncol(factors))
  stopifnot("`returns` must not contain missing values (NA/NaN)" = !anyNA(returns))
  stopifnot("`factors` must not contain missing values (NA/NaN)" = !anyNA(factors))

}
