library(data.table)
library(dplyr)
library(tidyr)
norm = fread("GSE166648_snATAC_normdata.csv")
dim(norm)
norm[1]
sub = norm[c(1:5),c(1,3,5)]
sub
sub2 = norm[c(1:10), c(1, 5:15)]
sub2
sub3 = norm[c(101:110), c(1, 21990:22000)]
sub3

unnorm = fread("GSE166648_snRNA_unnormdata.csv")
meta = fread("GSE166648_snRNA_metadata.csv")

norm_barcode = norm[1,]
norm_barcode

meta_corr = meta %>% 
  separate(barcode, c("sample", "bar"), sep = "_") %>%
  unite("barcod", bar:sample, sep = '-')
meta_corr

meta_corr[[1]]
meta_barcode = data.frame(meta_corr[[1]])
meta_barcode
norm[1]

#result: no elements in common
intersect(t(norm[1]), meta_barcode)

#TTTGGTTGTTCTGAGT-40S is flipped
#result: not in
itisin = "AAACACACATGGCCGA-40S" %in% norm[1]
itisin

