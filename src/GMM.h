// Author: Ali Moin

#ifndef GMM_H
#define GMM_H

#include <RcppArmadillo.h>

/////////////////////////////////////////////////
////////////  Factor Risk Premia ////////////////
/////////////////////////////////////////////////

//' Compute factor risk premia
//'
//' @name FMBCpp
//' @description Computes Fama MacBeth (1973) factor risk premia or misspecification-robust factor
//' risk premia of Kan Robotti Shanken (2013) from data on test asset excess
//' returns and risk factors. Optionally computes the corresponding
//' heteroskedasticity and autocorrelation robust standard errors using the
//' Newey-West (1994) plug-in procedure to select the number of relevant lags,
//' i.e., `n_lags = 4 * (n_observations/100)^(2/9)`.
//'
//' @param returns `n_observations x n_returns`-dimensional matrix of test asset
//' excess returns.
//' @param factors `n_observations x n_factors`-dimensional matrix of risk
//' factors.
//' @param misspecification_robust boolean `TRUE` for the
//' "misspecification-robust" Kar Robotti Shanken GLS approach using the
//' inverse covariance matrix of returns; `FALSE` for standard Fama-Mac-Beth
//' risk premia. Default is `TRUE`.
//' @param include_standard_errors boolean `TRUE` if you want to compute the
//' adaptive intrinsic factor risk premia HAC standard errors; `FALSE` otherwise.
//' Default is `FALSE`.
//'
//' @return a list containing `n_factors`-dimensional vector of factor
//' risk premia in `"risk_premia"`; if `include_standard_errors=TRUE`, then
//' it further includes `n_factors`-dimensional vector of factor risk
//' premia standard errors in `"standard_errors"`.
//'
//' @noRd
//'
// [[Rcpp::export]]
Rcpp::List FMBCpp(
    const arma::mat& returns,
    const arma::mat& factors,
    const bool include_intercept,
    const bool include_standard_errors
);
#endif
