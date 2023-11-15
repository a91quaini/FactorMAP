// Author: Ali Moin
// devtools::document()
#include "GMM.h"
#include "hac_standard_errors.h"

/////////////////
///// FMBCpp ////

Rcpp::List FMBCpp(
  const arma::mat& returns,
  const arma::mat& factors,
  const bool include_intercept,
  const bool include_standard_errors
) {
    const int n_obs = factors.n_rows;
    const int n_factors = factors.n_cols;
    const int n_assets = returns.n_cols;

    // Time Series Regression to determine beta
    const arma::mat iota_factors = join_horiz(arma::ones<arma::vec>(n_obs), factors);
    const arma::mat inv_iota_factors_squared = arma::solve(
      iota_factors.t() * iota_factors,
      arma::eye<arma::mat>(iota_factors.n_cols, iota_factors.n_cols),
      arma::solve_opts::likely_sympd
    );
    const arma::mat reg_coefficients = inv_iota_factors_squared * iota_factors.t() * returns;

    const arma::vec alpha = reg_coefficients.row(0).t();
    const arma::mat beta = reg_coefficients.rows(1, n_factors).t();
    const arma::mat residual = returns - iota_factors * reg_coefficients;
    const arma::mat SSR = residual.t() * residual;
    const arma::vec mean_returns = mean(returns, 0).t();
    const arma::mat SST = (returns.each_row() - mean_returns.t()).t() * (returns.each_row() - mean_returns.t());
    const arma::mat cov_iid_residuals = (1.0 / n_obs) * SSR;

    arma::mat A, iota_beta, Theta, Theta_gls;
    arma::vec Lambda, Lambda_gls;
    double const_val = arma::datum::nan, const_gls = arma::datum::nan;
    if (include_intercept) {
      // Cross-sectional regression with intercept
      iota_beta = arma::join_horiz(arma::ones(n_assets), beta);
      A = arma::solve(iota_beta.t() * iota_beta, iota_beta.t());
      Theta = A * mean_returns;
      Lambda = Theta.submat(1, 0, n_factors, 0);
      Theta_gls = arma::solve(iota_beta.t() * arma::inv(arma::cov(returns)) * iota_beta, iota_beta.t() * arma::inv(arma::cov(returns)) * mean_returns);
      Lambda_gls = Theta_gls.submat(1, 0, n_factors, 0);
      const_val = Theta(0, 0);
      const_gls = Theta_gls(0, 0);
    } else {
      // Cross-sectional regression without intercept
      A = arma::solve(beta.t() * beta, beta.t());
      Lambda = A * mean_returns;
      Lambda_gls = arma::solve(beta.t() * arma::inv(arma::cov(returns)) * beta, beta.t() * arma::inv(arma::cov(returns)) * mean_returns);
    }

    // Temporary output
    return Rcpp::List::create(
      Rcpp::Named("alpha") = alpha,
      Rcpp::Named("beta") = beta,
      Rcpp::Named("residual") = residual,
      Rcpp::Named("SSR") = SSR,
      Rcpp::Named("mean_returns") = mean_returns,
      Rcpp::Named("SST") = SST,
      Rcpp::Named("cov_iid_residuals") = cov_iid_residuals
    );
}
