context("Test MNI is valid")

test_that("MNI_2mm has a valid partition", {
  utils::data("MNI_2mm")
  expect_true(brcbase:::.isValid_partition(MNI_2mm$parcellation$partition))
})

test_that("MNI_2mm is a valid fMRI", {
  utils::data("MNI_2mm")
  expect_true(class(MNI_2mm) == "BrcFmri")
  expect_true(brcbase::isValid(MNI_2mm))
})

test_that("MNI_2mm is has the right properties",{
  utils::data("MNI_2mm")
  expect_true(class(MNI_2mm) == "BrcFmri")
  expect_true(all(MNI_2mm$parcellation$dim3d == c(91,109,91)))
  expect_true(nrow(MNI_2mm$data2d) == 1)
  
  partition <- MNI_2mm$parcellation$partition
  partition <- partition[partition != 0]
  expect_true(all(sort(unique(partition)) == sort(partition)))
})

test_that("MNI_3mm is a valid fMRI",{
  utils::data("MNI_3mm")
  expect_true(brcbase::isValid(MNI_3mm))
  expect_true(class(MNI_3mm) == "BrcFmri")
  expect_true(all(MNI_3mm$parcellation$dim3d == c(61,73,61)))
  expect_true(nrow(MNI_3mm$data2d) == 1)
  
  partition <- MNI_3mm$parcellation$partition
  partition <- partition[partition != 0]
  expect_true(all(sort(unique(partition)) == sort(partition)))
})