context("Test MNI 2mm is valid")

test_that("MNI_2mm is a valid BrcFmri with right size and properties", {
  utils::data("MNI_2mm")
  expect_true(brcbase::isValid(MNI_2mm))
  expect_true(all(MNI_2mm$parcellation$dim3d == c(91,109,91)))
  
  partition <- MNI_2mm$parcellation$partition
  partition <- partition[partition != 0]
  expect_true(all(sort(unique(partition)) == sort(partition)))
})