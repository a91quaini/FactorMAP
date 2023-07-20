// Author: Alberto Quaini

#ifndef RANK_TESTS_H
#define RANK_TESTS_H

#include <RcppArmadillo.h>

// For internal use
// Computes the Chen fang 2019 rank statistic and p-value of the null that
// the matrix of regression loadings of test asset excess returns on risk
// factors has reduced rank.
// If `target_level_kp2006_rank_test > 0`, it uses the iterative Kleibergen Paap
// 2006 rank test to estimate the initial rank, with
// `level = target_level_kp2006_rank_test / n_factors`.
// If `target_level_kp2006_rank_test <= 0`, the initial rank estimator is taken
// to be the number of singular values above `n_observations^(-1/4)`.
// It assumes n_factors < n_returns.
arma::vec2 ChenFang2019BetaFullRankTestStatisticAndPvalueCpp(
  const arma::mat& returns,
  const arma::mat& factors,
  const unsigned int n_bootstrap = 500,
  const double target_level_kp2006_rank_test = 0.05
);

// For internal use
// Computes the iterative Kleibergen Paap 2006 rank statistics and p-values
// of the test that the matrix of regression loadings of test asset excess
// returns on risk factors has rank q = 0, ..., n_factors - 1.
// It also returns an estimate of the rank as the first value q with associated
// p-value below a given `level = target_level / n_factors`.
// It assumes n_factors < n_returns.
Rcpp::List IterativeKleibergenPaap2006BetaRankTestCpp(
  const arma::mat& returns,
  const arma::mat& factors,
  const double target_level = .05
);

// For internal use
// Computes the Kleibergen Paap 2006 rank statistic and p-value
// of the test that the matrix of regression loadings of test asset excess
// returns on risk factors has rank `q`.
double KleibergenPaap2006BetaRankTestPvalueCpp(
  const arma::mat& theta_vec,
  const arma::mat& asy_var_theta_vec,
  const arma::mat& U_theta,
  const arma::mat& V_theta,
  const arma::mat& Aq_perp,
  const arma::mat& Bq_perp,
  const unsigned int q
);

// For internal use
// Computes the scaled (n_factors x n_returns) matrix of factor loadings,
// useful for the Kleibergen Paap 2006 or the Chen Fang 2019 rank tests.
// The resulting invariant matrix is proportional to the matrix of t-statistics
// of the least squares regression estimator.
arma::mat ScaledFactorLoadingsCpp(
  const arma::mat& returns,
  const arma::mat& factors
);

#endif
