context("Test ABIDE is valid")

test_that("ABIDE 0050002 anatomical is valid", {
  utils::data("ABIDE_0050002_anat")
  
  expect_true(brcbase::isValid(ABIDE_0050002_anat))
  expect_true(all(ABIDE_0050002_anat$parcellation$dim3d == c(91,109,91)))
  expect_true(nrow(ABIDE_0050002_anat$data2d) == 1)
  
  partition <- ABIDE_0050002_anat$parcellation$partition
  partition <- partition[partition != 0]
  expect_true(all(sort(unique(partition)) == sort(partition)))
})

test_that("ABIDE 0050002 functional is valid", {
  utils::data("ABIDE_0050002_funcSeg")
  
  expect_true(brcbase::isValid(ABIDE_0050002_funcSeg))
  expect_true(all(ABIDE_0050002_funcSeg$parcellation$dim3d == c(91,109,91)))
  expect_true(nrow(ABIDE_0050002_funcSeg$data2d) == 5)
  
  partition <- ABIDE_0050002_funcSeg$parcellation$partition
  partition <- partition[partition != 0]
  expect_true(all(sort(unique(partition)) == sort(partition)))
})

test_that("ABIDE 0050003 anatomical is valid", {
  utils::data("ABIDE_0050003_anat")
  
  expect_true(brcbase::isValid(ABIDE_0050003_anat))
  expect_true(all(ABIDE_0050003_anat$parcellation$dim3d == c(91,109,91)))
  expect_true(nrow(ABIDE_0050003_anat$data2d) == 1)
  
  partition <- ABIDE_0050003_anat$parcellation$partition
  partition <- partition[partition != 0]
  expect_true(all(sort(unique(partition)) == sort(partition)))
})

test_that("ABIDE 0050003 functional is valid", {
  utils::data("ABIDE_0050003_funcSeg")
  
  expect_true(brcbase::isValid(ABIDE_0050003_funcSeg))
  expect_true(all(ABIDE_0050003_funcSeg$parcellation$dim3d == c(91,109,91)))
  expect_true(nrow(ABIDE_0050003_funcSeg$data2d) == 5)
  
  partition <- ABIDE_0050003_funcSeg$parcellation$partition
  partition <- partition[partition != 0]
  expect_true(all(sort(unique(partition)) == sort(partition)))
})