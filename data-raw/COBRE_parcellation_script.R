library(devtools)
install_github("cdgreenidge/brcbase", ref = "kevin")

library(oro.nifti)
library(brcbase)
source("data-raw/repackaging_source.R")

dat <- oro.nifti::readNIfTI("../0040071_COBRE_3mm_functional.nii.gz")
dat <- dat@.Data

idx <- which(dat[,,,1] != 0)
data2d <- matrix(0, ncol = length(idx), nrow = dim(dat)[4])
for(i in 1:nrow(data2d)){
  data2d[i,] <- dat[,,,i][idx]
}

partition <- rep(0, prod(dim(dat)[1:3]))
partition[idx] <- 1:length(idx)

parcellation <- brcbase::BrcParcellation(dim(dat)[1:3], partition)
COBRE_0040071_func <- brcbase::BrcFmri(data2d, "COBRE_0040071", parcellation)

data(AAL_3mm)
COBRE_0040071_func_AAL <- brcbase::reduce(COBRE_0040071_func, AAL_3mm)

devtools::use_data(COBRE_0040071_func_AAL)
tools::resaveRdaFiles("data/COBRE_0040071_func_AAL.rda", compress = "auto")

