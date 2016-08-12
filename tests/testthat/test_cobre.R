context("Test COBRE is valid")

test_that("COBRE 0040071 anatomical is valid", {
  utils::data("COBRE_0040071_anat")
  
  expect_true(brcbase::isValid(COBRE_0040071_anat))
  expect_true(all(COBRE_0040071_anat$parcellation$dim3d == c(61,73,61)))
  expect_true(nrow(COBRE_0040071_anat$data2d) == 1)
  
  partition <- COBRE_0040071_anat$parcellation$partition
  partition <- partition[partition != 0]
  expect_true(all(sort(unique(partition)) == sort(partition)))
})

test_that("COBRE 0040071 functional is valid", {
  utils::data("COBRE_0040071_funcSeg")
  
  expect_true(brcbase::isValid(COBRE_0040071_funcSeg))
  expect_true(all(COBRE_0040071_funcSeg$parcellation$dim3d == c(61,73,61)))
  expect_true(nrow(COBRE_0040071_funcSeg$data2d) == 5)
  
  partition <- COBRE_0040071_funcSeg$parcellation$partition
  partition <- partition[partition != 0]
  expect_true(all(sort(unique(partition)) == sort(partition)))
})