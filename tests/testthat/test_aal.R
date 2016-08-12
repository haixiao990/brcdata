context("Test AAL is valid")

test_that("AAL 2mm is a valid parcellation", {
  utils::data("AAL_2mm")
  
  expect_true(brcbase::isValid(AAL_2mm))
  expect_true(class(AAL_2mm) == "BrcParcellation")
  expect_true(all(AAL_2mm$dim3d == c(91,109,91)))
  expect_true(max(AAL_2mm$partition) <= 116)
})

test_that("AAL 3mm is a valid parcellation", {
  utils::data("AAL_3mm")
  
  expect_true(brcbase::isValid(AAL_3mm))
  expect_true(class(AAL_3mm) == "BrcParcellation")
  expect_true(all(AAL_3mm$dim3d == c(61,73,61)))
  expect_true(max(AAL_3mm$partition) <= 116)
})