#Subtypes of Large B-Cell Lymphoma Expression (SubLymE)
#Copyright 2023, Bristol Myers Squibb

#Input
#exprs - a matrix of gene expression values (M features x N samples), log2 scaled and standardized on a gene-wise basis
#path (optional) - directory where coefficient table is stored

#Output
#A list with two elements:
#SubLymE_class - an N-length vector of class label per sample
#SubLymE_scores - an Nx7 matrix of class scores per sample, the maximum of which is selected as the class label



#Apply SubLymE classifier to log2-scaled, standardized expression data (features x samples)
SubLymE_classifier = function(exprs, path = "")
{
  #Load coefficient matrix and instantiate score/class matrices
  coef = read.table(file = paste0(path,"SubLymE_coefficients.txt"))
  classScores = array(NA, c(ncol(exprs),7))
  classLabels = rep(NA, ncol(exprs))

  #Subset expression data to model features and compute class scores as a weighted sum of expression
  exprs = rbind("Intercept" = 1,exprs[rownames(coef)[-1],])
  for (i in c(1:7))
  {
    classScores[,i] = colSums(coef[,i] * exprs)
  }
  
  #Assign class label with the highest scores
  classLabels = apply(classScores,1,which.max)
  
  return(list("SubLymE_class" = classLabels, "SubLymE_scores" = classScores))
}


