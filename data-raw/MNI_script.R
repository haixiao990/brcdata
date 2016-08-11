install_github("cdgreenidge/brcbase", ref = "kevin")

library(oro.nifti)
library(brcbase)

dat <- readNIfTI("data-raw/data/MNI152_T1_2mm_brain.nii.gz")
data <- dat@.Data
dim.vec <- dim(data)
vec <- which(data != 0)

mat <- matrix(vec, ncol = length(vec), nrow = 1)
idx <- which(vec != 0)
partition <- rep(0, prod(dim.vec[1:3]))
partition[idx] = 1:length(idx)

parcellation <- brcbase::BrcParcellation(dim3d = dim.vec[1:3], 
  partition = partition)
MNI_2mm <- brcbase::BrcFmri(data2d = mat, id = "MNI_2mm", parcellation =
  parcellation)
devtools::use_data(MNI_2mm)
