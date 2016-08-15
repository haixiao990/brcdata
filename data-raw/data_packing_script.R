install_github("cdgreenidge/brcbase", ref = "kevin")

library(oro.nifti)
library(brcbase)
source("data-raw/repackaging_source.R")

MNI_2mm <- .template_repackaging("data-raw/data/MNI152_T1_2mm_brain.nii.gz", 
  id = "MNI_2mm")
devtools::use_data(MNI_2mm, overwrite = T)

MNI_3mm <- .template_repackaging("data-raw/data/MNI152_T1_3mm_brain.nii.gz", 
  id = "MNI_3mm")
devtools::use_data(MNI_3mm, overwrite = T)

#####################

Harvard_Oxford <- .template_repackaging("data-raw/data/HarvardOxford-lateral-ventricles-thr25-2mm.nii.gz", 
  id = "HarvardOxford")
devtools::use_data(Harvard_Oxford, overwrite = T)

######################

AAL_2mm <- .parcellation_repackaging("data-raw/data/AAL_2mm_116parcel.nii.gz")
devtools::use_data(AAL_2mm, overwrite = T)

AAL_2mm <- .parcellation_repackaging("data-raw/data/AAL_2mm_116parcel.nii.gz")
devtools::use_data(AAL_2mm, overwrite = T)

AAL_3mm <- .parcellation_repackaging("data-raw/data/AAL_3mm_90parcel.nii.gz")
devtools::use_data(AAL_3mm, overwrite = T)

###################3

ABIDE_0050002_anat <- .template_repackaging("data-raw/data/0050002_ABIDE_2mm_anatomical.nii.gz",
                                            id = "ABIDE_0050002")
devtools::use_data(ABIDE_0050002_anat, overwrite = T)

ABIDE_0050003_anat <- .template_repackaging("data-raw/data/0050003_ABIDE_2mm_anatomical.nii.gz",
                                            id = "ABIDE_0050003")
devtools::use_data(ABIDE_0050003_anat, overwrite = T)

COBRE_0040071_anat <- .template_repackaging("data-raw/data/0040071_COBRE_3mm_anatomical.nii.gz",
                                            id = "COBRE_0040071")
devtools::use_data(COBRE_0040071_anat, overwrite = T)

####################

ABIDE_0050002_funcSeg <- .func_repackaging("data-raw/data/0050002_ABIDE_2mm_functional_segment.nii.gz",
                                            id = "ABIDE_0050002")
devtools::use_data(ABIDE_0050002_funcSeg, overwrite = T)

ABIDE_0050003_funcSeg <- .func_repackaging("data-raw/data/0050003_ABIDE_2mm_functional_segment.nii.gz",
                                           id = "ABIDE_0050003")
devtools::use_data(ABIDE_0050003_funcSeg, overwrite = T)

COBRE_0040071_funcSeg <- .func_repackaging("data-raw/data/0040071_COBRE_3mm_functional_segment.nii.gz",
                                           id = "COBRE_0040071")
devtools::use_data(COBRE_0040071_funcSeg, overwrite = T)

#####################

AAL_tab <- read.csv("data-raw/data/AAL_116_RegionList.txt", sep = " ", header = F)
AAL_tab <- AAL_tab[,c(1,3)]
fullname <- read.csv("data-raw/data/AALregion_fullname.csv", sep = "\n", header = F)
fullname.vec <- numeric(nrow(AAL_tab))
fullname.vec[1:nrow(fullname)] <- as.character(fullname[,1])
fullname.vec[(nrow(fullname)+1):length(fullname.vec)] = ""
AAL_tab <- cbind(AAL_tab, fullname.vec)
colnames(AAL_tab) <- c("Index", "Short.Name", "Full.Name")
devtools::use_data(AAL_tab, overwrite = T)

########################

paths <- sort(Sys.glob(c("data/*.rda", "data/*.RData")))
for(i in paths){
  tools::resaveRdaFiles(i, compress = "auto")
  print("*")
}
