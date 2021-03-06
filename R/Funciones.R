#' @import graphics
#' @import stats
#'
NULL

#' Datasets List
#' @return Returns a vector of strings with the data sets included
#' @export
getDataSetList = function(){
  return(unique(basic_dataframe[,"Dataset"]))
}


#' Cell Types in Dataset
#' @return Returns the cell types considered in the data set identified by the string in dataset
#' @export
getCellTypesInDataSet <- function(dataset){
  if (dataset == "Zeisel"){
    return(unique(basic_dataframe[,"CellType"]))
  }
  else
    print("There are not available cell types for this dataset")
}

#' Brain Regions in Dataset
#' @return Returns the brain regions considered in the data set identified by the string in dataset
#' @export
getBrainRegionsInDataSet <- function(dataset){
  if (dataset == "Zeisel"){
    return(unique(basic_dataframe[,"BrainRegion"]))
  }
  else
    print("There are not brain regions for this dataset")
}

#' Dataset Properties
#' @return Returns a data frame of properties describing the dataset
#' @export
getDataSetInfo <- function(dataset){
  if (dataset == "Zeisel"){
    dataset_info <- basic_dataframe[]
    return(dataset_info)
  }
  else
    print("There are not information for this dataset")
}


#' Active Gene Methods
#' @return Returns the available methods data for availability
#' @export
getActiveGeneMethod <- function(dataset){
  methods= c("rawexpression", "variationcoefficient")
  if (dataset == "Zeisel"){
    return(unique(basic_dataframe[,"Methods"]))
  }
  else
    print("There are not available methods for this dataset")
}

#' Active Genes by Brain Region And Cell Type
#' @return Returns the gene ids of active genes in the brain region, cell type, for a given calculus method. In rawexpression method, visibility jumps from 0 to 10
#' @export
getActiveGenesInBrainRegionInCellType <- function(dataset,brainregion,celltype,method,visibility){
  if (dataset == "Zeisel"){
    if (method == "rawexpression"){
      dataset <- get(paste0("ActiveGenes_",method,"_",visibility))
    }
    else {dataset <- get(paste0("ActiveGenes_",method))}
    datos_filtrados <-  dataset[dataset$BrainRegion == brainregion & dataset$CellType == celltype,] #Escoger la fila que te solicita
    genes_activos <-grep("TRUE",datos_filtrados[,])
    return(names(datos_filtrados)[genes_activos])
  }
}

#' Active and Inactive Genes In All Brain Region For Cell Type
#' @return Returns a matrix with the active/inactive genes in all brain region for a cell type, for a given cell type and calculus method. In rawexpression method, visibility jumps from 0 to 10.
#' @export
getActiveInactiveGenesInCellType <- function(dataset,celltype,method,visibility){
  if (dataset == "Zeisel"){
    if (method == "rawexpression"){
      dataset <- get(paste0("ActiveGenes_",method,"_",visibility))
    }
    else {dataset <- get(paste0("ActiveGenes_",method))}
    assign(paste0(celltype,method), dataset[dataset$CellType == celltype,])
    return(get(paste0(celltype,method)))
  }
}

