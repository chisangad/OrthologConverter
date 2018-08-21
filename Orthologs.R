setwd(dirname(sys.frame(1)$ofile))
map.orthologs=function(genes=NULL,from.tax_id,to.tax_id)
{
  if(!file.exists("gene_orthologs.gz"))
  {
    download.file("ftp://ftp.ncbi.nlm.nih.gov/gene/DATA/gene_orthologs.gz",
                  destfile = "gene_orthologs.gz")
  }
  data=read.table(gzfile("gene_orthologs.gz"),header=F,sep = "\t",stringsAsFactors = F)
  data=data[data$V1==as.integer(from.tax_id) & data$V4==as.integer(to.tax_id),]
  if(!is.null(genes))
  {
    data=data[data$V2 %in% as.numeric(genes),]
  }
  colnames(data)=c("from.tax_id","from_GeneID","relationship","to.tax_id","to_GeneID")
  return(data)
}



