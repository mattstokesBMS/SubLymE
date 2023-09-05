SubLymE.R can be run in R, and has been tested in version 4.1.0. The code file may be sourced, and the classifier called using the SubLymE_classifier() function. The code is released under GPLv2.

The function requires standardized log-scale expression data as input (gene symbols as row names and sample IDs as column names), and optionally accepts a file path for the coefficient file directory. all genes present in the coefficient table must be present in the expression data, or the function will throw an error.

The output is a list with two elements - the first element, SubLymE_class, is an N-length vector of class label per sample, and the second, SubLymE_scores, is an Nx7 array of class scores per sample. The expected runtime is negligible.
