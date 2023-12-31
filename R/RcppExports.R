# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#' Compute adaptive weights from data on factors and test asset excess returns
#'
#' @name AdaptiveWeightsCpp
#' @description Computes adaptive weights from data on factors and test asset
#' excess returns. The possible adaptive weights are based on: the first-step
#' intrinsic factor risk premia estimates with choice `a`; the matrix of
#' factors regression coefficients on test asset excess returns with choice
#' `b`; the correlation matrix between factors and returns with choice `c`;
#' the unit vector with any other character.
#'
#' @param returns `n_observations x n_returns`-dimensional matrix of test asset
#' excess returns.
#' @param factors `n_observations x n_factors`-dimensional matrix of risk
#' factors.
#' @param type character specifying the type of adaptive weights:
#' based on the correlation between factors and returns `'c'`; based on the
#' regression coefficients of returns on factors `'b'`; based on the first-step
#' intrinsic risk premia estimator `'a'`; otherwise a vector of ones (any other
#' character). Default is `'c'`.
#'
#' @return 'n_factors'-dimensional vector of adaptive weights.
#'
#' @noRd
#'
AdaptiveWeightsCpp <- function(returns, factors, type = 'c') {
    .Call(`_FactorMAP_AdaptiveWeightsCpp`, returns, factors, type)
}

#' Compute Fama-MacBeth (1973) factor risk premia from moments extracted from data
#'
#' @name FMFRPCpp
#' @description Computes Fama-MacBeth (1973) factor risk premia based on moments
#' extracted from factors and test asset returns.
#'
#' @param beta `n_returns x n_factors`-dimensional regression coefficient
#' matrix of test asset returns on risk factors: `beta =
#' covariance(returns, factors) * variance(factors)^(-1)`.
#' @param mean_returns `n_returns`-dimensional mean vector of test asset excess
#' returns.
#'
#' @return `n_factors`-dimensional vector of factor risk premia.
#'
#' @noRd
NULL

#' Compute the misspecification robust factor risk premia of Kan Robotti
#' Shanken (2013) from moments extracted from data
#'
#' @name KRSFRP
#' @description Computes misspecification-robust factor risk premia of
#' Kan Robotti Shanken (2013) based on moments extracted from factors and test
#' asset excess returns.
#'
#' @param beta `n_returns x n_factors`-dimensional regression coefficient
#' matrix of test asset returns on risk factors: `beta =
#' covariance(returns, factors) * variance(factors)^(-1)`.
#' @param mean_returns `n_returns`-dimensional mean vector of test asset excess
#' returns.
#' @param weighting_matrix `n_returns x n_returns`-dimensional weighting
#' matrix. Typically it is the inverse covariance matrix or the
#' second-moment matrix of test asset excess returns, or the asymptotic
#' covariance of the pricing errors.
#'
#' @return `n_factors`-dimensional vector of factor risk premia.
#'
#' @noRd
NULL

#' Compute the standard errors of Fama-MacBeth factor risk premia from moments
#'
#' @name StandardErrorsFRPCpp
#' @description Computes the HAC standard errors of Fama MacBeth (1973) factor risk
#' premia based on moments extracted from factors and test asset excess returns.
#' It uses the Newey-West (1994) plug-in procedure to select the
#' number of relevant lags, i.e., `n_lags = 4 * (n_observations/100)^(2/9)`.
#'
#' @param frp `n_factors`-dimensional vector of factor risk premia.
#' E.g., the result of function `FRPCpp`.
#' @param returns `n_observations x n_returns`-dimensional matrix of test asset
#' excess returns.
#' @param factors `n_observations x n_factors`-dimensional matrix of risk
#' factors.
#' @param beta `n_returns x n_factors`-dimensional regression coefficient
#' matrix of test asset returns on risk factors: `beta =
#' covariance(returns, factors) * variance(factors)^(-1)`.
#' @param covariance_factors_returns `n_factors x n_returns`-dimensional
#' covariance matrix between factors and test asset excess returns.
#' @param mean_returns `n_returns`-dimensional mean vector of test asset excess
#' returns.
#'
#'
#' @return `n_factors`-dimensional vector of standard errors for the Fama-MacBeth
#' factor risk premia.
#'
#' @noRd
NULL

#' Compute the standard errors of krs factor risk premia from moments
#'
#' @name StandardErrorsKRSFRPCpp
#' @description Computes the HAC standard errors of misspecification-robust factor
#' risk premia of Kan Robotti Shanken (2013) based on moments extracted from
#' factors and test asset excess returns. It uses the Newey-West (1994) plug-in procedure to select the
#' number of relevant lags, i.e., `n_lags = 4 * (n_observations/100)^(2/9)`.
#'
#' @param krs_frp `n_factors`-dimensional vector of krs factor risk premia.
#' E.g., the result of function `KRSFRPCpp`.
#' @param returns `n_observations x n_returns`-dimensional matrix of test asset
#' excess returns.
#' @param factors `n_observations x n_factors`-dimensional matrix of risk
#' factors.
#' @param beta `n_returns x n_factors`-dimensional regression coefficient
#' matrix of test asset returns on risk factors: `beta =
#' covariance(returns, factors) * variance(factors)^(-1)`.
#' @param covariance_factors_returns `n_factors x n_returns`-dimensional
#' covariance matrix between factors and  test asset excess returns.
#' @param variance_returns `n_returns x n_returns`-dimensional covariance
#' matrix of test asset excess returns.
#' @param mean_returns `n_returns`-dimensional mean vector of test asset excess
#' returns.
#'
#' @return `n_factors`-dimensional vector of HAC standard errors for the krs factor
#' risk premia.
#'
#' @noRd
NULL

#' Compute factor risk premia
#'
#' @name FRPCpp
#' @description Computes Fama MacBeth (1973) factor risk premia or misspecification-robust factor
#' risk premia of Kan Robotti Shanken (2013) from data on test asset excess
#' returns and risk factors. Optionally computes the corresponding
#' heteroskedasticity and autocorrelation robust standard errors using the
#' Newey-West (1994) plug-in procedure to select the number of relevant lags,
#' i.e., `n_lags = 4 * (n_observations/100)^(2/9)`.
#'
#' @param returns `n_observations x n_returns`-dimensional matrix of test asset
#' excess returns.
#' @param factors `n_observations x n_factors`-dimensional matrix of risk
#' factors.
#' @param misspecification_robust boolean `TRUE` for the
#' "misspecification-robust" Kar Robotti Shanken GLS approach using the
#' inverse covariance matrix of returns; `FALSE` for standard Fama-Mac-Beth
#' risk premia. Default is `TRUE`.
#' @param include_standard_errors boolean `TRUE` if you want to compute the
#' adaptive intrinsic factor risk premia HAC standard errors; `FALSE` otherwise.
#' Default is `FALSE`.
#'
#' @return a list containing `n_factors`-dimensional vector of factor
#' risk premia in `"risk_premia"`; if `include_standard_errors=TRUE`, then
#' it further includes `n_factors`-dimensional vector of factor risk
#' premia standard errors in `"standard_errors"`.
#'
#' @noRd
#'
FRPCpp <- function(returns, factors, misspecification_robust = TRUE, include_standard_errors = FALSE) {
    .Call(`_FactorMAP_FRPCpp`, returns, factors, misspecification_robust, include_standard_errors)
}

#' Compute the Chen Fang 2019 beta rank test
#'
#' @name ChenFang2019BetaRankTestCpp
#' @description Computes the Chen fang 2019 rank statistic and p-value of the
#' null that the matrix of regression loadings of test asset excess returns on
#' risk factors has reduced rank. If `target_level_kp2006_rank_test > 0`,
#' it uses the iterative Kleibergen Paap 2006 rank test to estimate the initial
#' rank, with `level = target_level_kp2006_rank_test / n_factors`. If
#' `target_level_kp2006_rank_test <= 0`, the initial rank estimator is taken to
#' be the number of singular values above `n_observations^(-1/4)`. It assumes
#' n_factors < n_returns.
#'
#' @param returns `n_observations x n_returns`-dimensional matrix of test asset
#' excess returns.
#' @param factors `n_observations x n_factors`-dimensional matrix of risk
#' factors.
#' @param n_bootstrap numeric integer indicating the number of bootstrap
#' samples used to compute the Chen fang 2019 test.
#' @param target_level_kp2006_rank_test numeric level of the Kleibergen Paap
#' 2006 rank test. If it is strictly grater than zero, then the iterative
#' Kleibergen Paap 2006 rank test at `level = target_level_kp2006_rank_test /
#' n_factors` is used to compute an initial estimator of the rank of the factor
#' loadings in the Chen Fang 2019 rank test. Otherwise, the initial rank
#' estimator is taken to be the number of singular values above
#' `n_observations^(-1/4)`. Default is `0.05` (as correction for multiple
#' testing).
#'
#' @return a list containing the Chen fang 2019 rank statistic
#' and the corresponding p-value.
#'
#' @noRd
#'
ChenFang2019BetaRankTestCpp <- function(returns, factors, n_bootstrap = 500L, target_level_kp2006_rank_test = 0.05) {
    .Call(`_FactorMAP_ChenFang2019BetaRankTestCpp`, returns, factors, n_bootstrap, target_level_kp2006_rank_test)
}

#' Compute the Hansen-Jagannatan misspecification test
#'
#' @name HJMisspecificationTestCpp
#' @description Computes the Hansen-Jagannatan misspecification statistic and
#' p-value of an asset pricing model from test asset excess returns and
#' risk factors.
#'
#' @param returns `n_observations x n_returns`-dimensional matrix of test asset
#' excess returns.
#' @param factors `n_observations x n_factors`-dimensional matrix of risk
#' factors.
#'
#' @return a list containing the HJ test statistic and the corresponding
#' p-value.
#'
#' @noRd
#'
HJMisspecificationTestCpp <- function(returns, factors) {
    .Call(`_FactorMAP_HJMisspecificationTestCpp`, returns, factors)
}

#' Compute oracle tradable factor risk premia
#'
#' @name OracleTFRPCpp
#' @description Computes oracle tradable factor risk premia based on
#' pre-computed tradable factor risk premia and oracle penalty weights for
#' various penalty parameter values.
#'
#' @param tradable_frp `n_factors`-dimensional vector of tradable factor risk premia.
#' Usually, it is the output of function `TFRPCpp`
#' @param weights `n_factors`-dimensional vector of weights for the penalty
#' term. Usually, it is the output of function `OracleWeightsCpp`.
#' @param penalty_parameters `n_parameters`-dimensional vector of penalty
#' parameter values from smallest to largest.
#'
#' @return `n_factors x n_parameters`-dimensional matrix of oracle
#' tradable factor risk premia.
#'
#' @noRd
NULL

#' Compute the HAC standard errors of the nonzero oracle tradable factor risk
#' premia
#'
#' @name StandardErrorsOracleTFRPCpp
#' @description Computes the HAC standard errors of oracle tradable factor
#' risk premia based on moments extracted from factors and test asset excess
#' returns. It uses the Newey-West (1994) plug-in procedure to select the
#' number of relevant lags, i.e., `n_lags = 4 * (n_observations/100)^(2/9)`.
#'
#' @param idx_nonzero index vector of nonzero oracle tradable factor risk premia.
#' @param returns `n_observations x n_returns`-dimensional matrix of test asset
#' excess returns.
#' @param factors `n_observations x n_factors`-dimensional matrix of risk
#' factors.
#' @param covariance_factors_returns `n_factors x n_returns`-dimensional
#' covariance matrix between factors and test asset excess returns.
#' @param variance_returns `n_returns x n_returns`-dimensional covariance
#' matrix of test asset excess returns.
#' @param mean_returns `n_returns`-dimensional mean vector of test asset excess
#' returns.
#'
#' @noRd
#'
#' @return `n_factors`-dimensional vector of standard errors for oracle
#' tradable factor risk premia.
NULL

#' Compute optimal oracle tradable factor risk premia under generalized
#' cross validation
#'
#' @name OracleTFRPGCVCpp
#' @description Computes optimal oracle tradable factor risk premia based
#' on moments extracted from factors and test asset excess returns and oracle
#' weights over various penalty parameter values. Tuning is performed via
#' Generalized Cross Validation (GCV). Oracle weights can be based on the
#' correlation between factors and returns, on the regression coefficients of
#' returns on factors or on the first-step tradable risk premia estimator.
#'
#' @param returns `n_observations x n_returns`-dimensional matrix of test asset
#' excess returns.
#' @param factors `n_observations x n_factors`-dimensional matrix of factors.
#' @param covariance_factors_returns `n_factors x n_returns`-dimensional
#' covariance matrix between factors and test asset excess returns.
#' @param variance_returns `n_returns x n_returns`-dimensional covariance
#' matrix of test asset excess returns.
#' @param mean_returns `n_returns`-dimensional mean vector of test asset excess
#' returns.
#' @param penalty_parameters `n_parameters`-dimensional vector of penalty
#' parameter values from smallest to largest.
#' @param weighting_type character specifying the type of oracle weights:
#' based on the correlation between factors and returns `'c'`; based on the
#' regression coefficients of returns on factors `'b'`; based on the first-step
#' tradable risk premia estimator `'a'`; otherwise a vector of ones (any other
#' character). Default is `'c'`.
#' @param one_stddev_rule boolean `TRUE` for picking the most parsimonious model
#' whose score is not higher than one standard error above the score of the
#' best model; `FALSE` for picking the best model. Default is `FALSE`.
#' @param gcv_scaling_n_assets boolean `TRUE` for sqrt(n_assets) scaling
#' (`sqrt(n_assets) / n_observations`); `FALSE` otherwise (`1 / n_observations`).
#' Default is `FALSE`.
#' @param gcv_identification_check boolean `TRUE` for a loose check for model
#' identification; `FALSE` otherwise. Default is `FALSE`.
#' @param target_level_kp2006_rank_test (only relevant if `gcv_identification_check` is
#' `TRUE`) numeric level of the Kleibergen Paap 2006 rank test. If it is
#' strictly grater than zero, then the iterative Kleibergen Paap 2006 rank
#' test at `level = target_level_kp2006_rank_test / n_factors` is used to compute an initial estimator
#' of the rank of the factor loadings in the Chen Fang 2019 rank test.
#' Otherwise, the initial rank estimator is taken to be the number of singular
#' values above `n_observations^(-1/4)`. Default is `0.05` (as correction
#' for multiple testing).
#' @param relaxed boolean `TRUE` if you want to compute a post-selection
#' unpenalized tradable factor risk premia to remove the bias due to shrinkage;
#' FALSE` otherwise. Default is `FALSE`.
#' @param include_standard_errors boolean `TRUE` if you want to compute the
#' oracle factor risk premia HAC standard errors; `FALSE` otherwise.
#' Default is `FALSE`.
#'
#' @return a list containing the `n_factors`-dimensional vector of oracle
#' tradable factor risk premia in `"risk_premia"`, and the optimal penalty
#' parameter value in `"penalty_parameter"`.
#'
#' @noRd
#'
OracleTFRPGCVCpp <- function(returns, factors, covariance_factors_returns, variance_returns, mean_returns, penalty_parameters, weighting_type = 'c', one_stddev_rule = FALSE, gcv_scaling_n_assets = FALSE, gcv_identification_check = FALSE, target_level_kp2006_rank_test = 0.05, relaxed = FALSE, include_standard_errors = FALSE) {
    .Call(`_FactorMAP_OracleTFRPGCVCpp`, returns, factors, covariance_factors_returns, variance_returns, mean_returns, penalty_parameters, weighting_type, one_stddev_rule, gcv_scaling_n_assets, gcv_identification_check, target_level_kp2006_rank_test, relaxed, include_standard_errors)
}

#' Compute optimal oracle tradable factor risk premia under cross validation
#'
#' @name OracleTFRPCVCpp
#' @description Computes optimal oracle tradable factor risk premia based
#' on moments extracted from factors and test asset excess returns and oracle
#' weights over various penalty parameter values. Tuning is performed via
#' Cross Validation (CV). Oracle weights can be based on the correlation
#' between factors and returns, on the regression coefficients of returns on
#' factors or on the first-step tradable risk premia estimator.
#'
#' @param returns `n_observations x n_returns`-dimensional matrix of test asset
#' excess returns.
#' @param factors `n_observations x n_factors`-dimensional matrix of factors.
#' @param covariance_factors_returns `n_factors x n_returns`-dimensional
#' covariance matrix between factors and test asset excess returns.
#' @param variance_returns `n_returns x n_returns`-dimensional covariance
#' matrix of test asset excess returns.
#' @param mean_returns `n_returns`-dimensional mean vector of test asset excess
#' returns.
#' @param penalty_parameters `n_parameters`-dimensional vector of penalty
#' parameter values from smallest to largest.
#' @param weighting_type character specifying the type of oracle weights:
#' based on the correlation between factors and returns `'c'`; based on the
#' regression coefficients of returns on factors `'b'`; based on the first-step
#' tradable risk premia estimator `'a'`; otherwise a vector of ones (any other
#' character). Default is `'c'`.
#' @param one_stddev_rule boolean `TRUE` for picking the most parsimonious model
#' whose score is not higher than one standard error above the score of the
#' best model; `FALSE` for picking the best model. Default is `FALSE`.
#' @param n_folds integer number of k-fold for cross validation. Default is `5`.
#' @param relaxed boolean `TRUE` if you want to compute a post-selection
#' unpenalized tradable factor risk premia to remove the bias due to shrinkage;
#' FALSE` otherwise. Default is `FALSE`.
#' @param include_standard_errors boolean `TRUE` if you want to compute the
#' oracle factor risk premia HAC standard errors; `FALSE` otherwise.
#' Default is `FALSE`.
#'
#' @return a list containing the n_factors-dimensional vector of oracle
#' tradable factor risk premia in "risk_premia", and the optimal penalty
#' parameter value in "penalty_parameter".
#'
#' @noRd
#'
OracleTFRPCVCpp <- function(returns, factors, covariance_factors_returns, variance_returns, mean_returns, penalty_parameters, weighting_type = 'c', one_stddev_rule = FALSE, n_folds = 5L, relaxed = FALSE, include_standard_errors = FALSE) {
    .Call(`_FactorMAP_OracleTFRPCVCpp`, returns, factors, covariance_factors_returns, variance_returns, mean_returns, penalty_parameters, weighting_type, one_stddev_rule, n_folds, relaxed, include_standard_errors)
}

#' Compute optimal oracle tradable factor risk premia under rolling validation
#'
#' @name OracleTFRPRVCpp
#' @description Computes optimal oracle tradable factor risk premia based
#' on moments extracted from factors and test asset excess returns and oracle
#' weights over various penalty parameter values. Tuning is performed via
#' Rolling Validation (RV). Oracle weights can be based on the correlation
#' between factors and returns, on the regression coefficients of returns on
#' factors or on the first-step tradable risk premia estimator.
#'
#' @param returns `n_observations x n_returns`-dimensional matrix of test asset
#' excess returns.
#' @param factors `n_observations x n_factors`-dimensional matrix of factors.
#' @param covariance_factors_returns `n_factors x n_returns`-dimensional
#' covariance matrix between factors and test asset excess returns.
#' @param variance_returns `n_returns x n_returns`-dimensional covariance
#' matrix of test asset excess returns.
#' @param mean_returns `n_returns`-dimensional mean vector of test asset excess
#' returns.
#' @param penalty_parameters `n_parameters`-dimensional vector of penalty
#' parameter values from smallest to largest.
#' @param weighting_type character specifying the type of oracle weights:
#' based on the correlation between factors and returns `'c'`; based on the
#' regression coefficients of returns on factors `'b'`; based on the first-step
#' tradable risk premia estimator `'a'`; otherwise a vector of ones (any other
#' character). Default is `'c'`.
#' @param one_stddev_rule boolean `TRUE` for picking the most parsimonious model
#' whose score is not higher than one standard error above the score of the
#' best model; `FALSE` for picking the best model. Default is `FALSE`.
#' @param n_train_observations number of observations in the rolling training
#' set. Default is `120`.
#' @param n_test_observations number of observations in the test set. Default
#' is `12`.
#' @param roll_shift number of observation shift when moving from the rolling
#' window to the next one. Default is `12`.
#' @param relaxed boolean `TRUE` if you want to compute a post-selection
#' unpenalized tradable factor risk premia to remove the bias due to shrinkage;
#' FALSE` otherwise. Default is `FALSE`.
#' @param include_standard_errors boolean `TRUE` if you want to compute the
#' oracle factor risk premia HAC standard errors; `FALSE` otherwise.
#' Default is `FALSE`.
#'
#' @return a list containing the n_factors-dimensional vector of oracle
#' tradable factor risk premia in "risk_premia", and the optimal penalty
#' parameter value in "penalty_parameter".
#'
#' @noRd
#'
OracleTFRPRVCpp <- function(returns, factors, covariance_factors_returns, variance_returns, mean_returns, penalty_parameters, weighting_type = 'c', one_stddev_rule = FALSE, n_train_observations = 120L, n_test_observations = 12L, roll_shift = 12L, relaxed = FALSE, include_standard_errors = FALSE) {
    .Call(`_FactorMAP_OracleTFRPRVCpp`, returns, factors, covariance_factors_returns, variance_returns, mean_returns, penalty_parameters, weighting_type, one_stddev_rule, n_train_observations, n_test_observations, roll_shift, relaxed, include_standard_errors)
}

#' Compute tradable factor risk premia from moments extracted from data
#'
#' @name TFRPCpp
#' @description Computes tradable factor risk premia based on moments
#' extracted from factors and test asset excess returns.
#'
#' @param covariance_factors_returns `n_factors x n_returns`-dimensional
#' covariance matrix between factors and test asset excess returns.
#' @param variance_returns `n_returns x n_returns`-dimensional covariance
#' matrix of test asset excess returns.
#' @param mean_returns `n_returns`-dimensional mean vector of test asset excess
#' returns.
#'
#' @return `n_factors`-dimensional vector of tradable factor risk premia.
#'
#' @noRd
NULL

#' Compute the HAC standard errors of tradable factor risk premia
#'
#' @name StandardErrorsTFRPCpp
#' @description Computes the HAC standard errors of tradable factor risk
#' premia based on moments extracted from factors and test asset excess returns.
#' It uses the Newey-West (1994) plug-in procedure to select the
#' number of relevant lags, i.e., `n_lags = 4 * (n_observations/100)^(2/9)`.
#'
#' @param ifrp n_factors-dimensional vector of tradable factor risk premia.
#' E.g., the result of function 'IFRPFCpp'.
#' @param returns (n_observations x n_returns)-dimensional matrix of test asset
#' excess returns.
#' @param factors (n_observations x n_factors)-dimensional matrix of risk
#' factors.
#' @param covariance_factors_returns (n_factors x n_returns)-dimensional
#' covariance matrix between factors and  test asset excess returns.
#' @param variance_returns (n_returns x n_returns)-dimensional covariance
#' matrix of test asset excess returns.
#' @param mean_returns n_returns-dimensional mean vector of test asset excess
#' returns.
#'
#' @return n_factors-dimensional vector of HAC standard errors for
#' tradable factor risk premia.
#'
#' @noRd
NULL

#' Compute tradable factor risk premia and their standard errors
#'
#' @name TFRPCpp
#' @description Computes tradable factor risk premia based on data on
#' risk factors and test asset excess returns.
#'
#' @param returns `n_observations x n_returns`-dimensional matrix of test
#' asset excess returns.
#' @param factors `n_observations x n_factors`-dimensional matrix of factors.
#' @param include_standard_errors boolean `TRUE` if you want to compute the
#' tradable factor risk premia HAC standard errors; `FALSE` otherwise.
#' Default is `FALSE`.
#'
#' @return a list containing the `n_factors`-dimensional vector of tradable
#' factor risk premia in `"risk_premia"`; if `include_standard_errors=TRUE`,
#' then it further includes `n_factors`-dimensional vector of factor risk
#' premia standard errors in `"standard_errors"`.
#'
#' @noRd
#'
TFRPCpp <- function(returns, factors, include_standard_errors) {
    .Call(`_FactorMAP_TFRPCpp`, returns, factors, include_standard_errors)
}

