test_that("Test HJMisspecificationTest", {

  factors = factors5FF[,-1]
  returns = returns25MEBTM[,-1]

  expect_no_error(HJMisspecificationTest(returns, factors))

})
