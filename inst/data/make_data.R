## make factors

FF5 <- readr::read_csv("inst/data/source/F-F_Research_Data_5_Factors_2x3.CSV")

factors <- as.matrix(FF5[,-7])
factors[,-1] <- factors[,-1] / 100

usethis::use_data(factors)

## make returns

MEBTM25 = readr::read_csv("inst/data/source/25_Portfolios_5x5.CSV")
IND17   = readr::read_csv("inst/data/source/17_Industry_Portfolios.CSV")

MEBTM25_mat = as.matrix(MEBTM25)
IND17_mat = as.matrix(IND17)

Rf = as.matrix(FF5[,7]) / 100.0 + 1.0

MEBTM25_mat[,-1] = MEBTM25_mat[,-1] / 100.0 + 1.0
IND17_mat[,-1]   = IND17_mat[,-1] / 100.0 + 1.0

MEBTM25_mat[,-1] = MEBTM25_mat[,-1] - matrix(Rf, length(Rf), ncol(MEBTM25_mat[,-1]))
IND17_mat[,-1]   = IND17_mat[,-1] - matrix(Rf, length(Rf), ncol(IND17_mat[,-1]))

returnsMEBTM25 = MEBTM25_mat
returnsIND17   = IND17_mat

usethis::use_data(returnsMEBTM25)
usethis::use_data(returnsIND17)
