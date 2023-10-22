# Author: Ali Moin

###################################
######  Factor Risk Premia ########
###################################

#' Perform the iterative model selection procedure for KRS factor risk premia
#' of Gospodinov Kan Robotti (2014) from moments extracted from data
#'
#' @name IterativeKRSFRP
#' @description Performs the iterative model selection procedure for KRS factor
#' risk premia of Gospodinov Kan Robotti (2014) based on moments extracted from
#' factors and test asset excess returns.
#'
#' @param returns `n_observations x n_returns`-dimensional matrix of test asset
#' excess returns.
#' @param factors `n_observations x n_factors`-dimensional matrix of risk
#' factors.
#' @param alpha significance level.
#'
#' @return list of original indices in "factors" of kept factors.
#'
#' @examples
#' # import package data on 15 risk factors and 42 test asset excess returns
#' factors = FactorMAP::factors5FF[,-1]
#' returns = FactorMAP::returns25MEBTM[,-1]
#'
#' # compute KRS factor risk premia and their standard errors
#' frp = FRP(returns, factors, include_standard_errors = TRUE)
#'
#' @export
IterativeKRSFRP = function(
    returns,
    factors,
    alpha = 0.05
) {

  # if (check_arguments) {
  #
  #   CheckData(returns, factors)
  #   stopifnot("`misspecification_robust` must be boolean" = is.logical(misspecification_robust))
  #   stopifnot("`include_standard_errors` must be boolean" = is.logical(include_standard_errors))
  #
  # }

  return(.Call(`_FactorMAP_external_IterativeKRSFRPCpp`,
               returns,
               factors,
               alpha
  ))

}
