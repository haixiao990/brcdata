context("Test Harvard is valid")

test_that("Harvard_Oxford anatomical is valid", {
  utils::data("Harvard_Oxford")
  
  expect_true(brcbase::isValid(Harvard_Oxford))
  expect_true(all(Harvard_Oxford$parcellation$dim3d == c(91,109,91)))
  expect_true(nrow(Harvard_Oxford$data2d) == 1)
  
  partition <- Harvard_Oxford$parcellation$partition
  partition <- partition[partition != 0]
  expect_true(all(sort(unique(partition)) == sort(partition)))
})
