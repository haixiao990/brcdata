.template_repackaging <- function(path, id){
  dat <- readNIfTI(path)
  data <- dat@.Data
  dim.vec <- dim(data)
  vec <- which(data != 0)
  
  mat <- matrix(vec, ncol = length(vec), nrow = 1)
  partition <- rep(0, prod(dim.vec))
  partition[vec] = 1:length(vec)
  
  parcellation <- brcbase::BrcParcellation(dim3d = dim.vec, 
                                           partition = partition)
  brcbase::BrcFmri(data2d = mat, id = id, 
                   parcellation = parcellation)
}

.parcellation_repackaging <- function(path){
  dat <- readNIfTI(path)
  data <- dat@.Data
  dim.vec <- dim(data)
  partition <- as.numeric(data)
  
  brcbase::BrcParcellation(dim3d = dim.vec, partition = partition)
}

.func_repackaging <- function(path, id){
  dat <- readNIfTI(path)
  data <- dat@.Data
  dim.vec <- dim(data)
  vec <- which(data[,,,1] != 0)
  
  mat <- matrix(NA, ncol = length(vec), nrow = dim.vec[4])
  for(i in 1:nrow(mat)){
    mat[i,] <- data[,,,i][vec]
  }
  
  partition <- rep(0, prod(dim.vec[1:3]))
  partition[vec] = 1:length(vec)
  
  parcellation <- brcbase::BrcParcellation(dim3d = dim.vec[1:3], 
                                           partition = partition)
  brcbase::BrcFmri(data2d = mat, id = id, 
                   parcellation = parcellation)
}