#' Montreal Neurological Institute brain with 2mm voxels
#'
#' @name MNI_2mm
#' @docType data
#' @format A BrcFmri object of size 91 x 109 x 91 voxels, of which
#' there are 228,453 voxels in representing the brain (25.3%). The MNI image is
#' not symmetric.
#' \describe{
#'   \item{data2d}{1 x 228453 matrix, values representing the anatomical structure}
#'   \item{id}{The id, here "MNI_2mm"}
#'   \item{parcellation}{The singleton parcellation}
#' }
#' @author Kevin Lin \email{kevinl1@andrew.cmu.edu}
#' @source Taken from the FSL dataset.
#' @keywords data
NULL

#' Montreal Neurological Institute brain with 3mm voxels
#'
#' @name MNI_3mm
#' @docType data
#' @format A BrcFmri object of size 61 x 73 x 61 voxels, of which
#' there are 67,749 voxels in representing the brain (24.9%). The MNI image is
#' not symmetric.
#' \describe{
#'   \item{data2d}{1 x 67749 matrix, values representing the anatomical structure}
#'   \item{id}{The id, here "MNI_3mm"}
#'   \item{parcellation}{The singleton parcellation}
#' }
#' @author Kevin Lin \email{kevinl1@andrew.cmu.edu}
#' @source Taken from the FSL dataset.
#' @keywords data
NULL