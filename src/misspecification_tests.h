// Author: Alberto Quaini

#ifndef MISSPECIFICATION_TESTS_H
#define MISSPECIFICATION_TESTS_H

#include <RcppArmadillo.h>

// For internal use
// Computes the Hansen-Jagannatan misspecification statistic and p-value of an
// asset pricing model for given test asset excess returns and risk factors.
arma::vec2 HJMisspecificationStatisticAndPvalueCpp(
  const arma::mat& returns,
  const arma::mat& factors,
  const arma::mat& beta,
  const arma::mat& variance_returns,
  const arma::vec& mean_returns
);

#endif
