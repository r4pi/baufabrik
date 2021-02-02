#!/usr/bin/env Rscript

pkgs_available_cran <- available.packages(repos = "https://cran.rstudio.com")


current_dir <- getwd()
contrib_path <- paste0("file://", current_dir, "/pkgbin")
pkgs_available_local <- available.packages(contriburl = contrib_path)

pkgs_input <- readLines("baufabrik_packages.txt")


pkg_update_available <- function(package_name, available_cran, available_local){
  cran_version <- available_cran[which(available_cran[,"Package"] == package_name),]["Version"]
  local_version <- available_local[which(available_local[,"Package"] == package_name),]["Version"]
  if (is.na(local_version)){
    return(TRUE)
  }
  if (cran_version == local_version){
    TRUE
  } else {
    FALSE
  }
}

for (pkg in pkgs_input){
  if (pkg_update_available(pkg, pkgs_available_cran, pkgs_available_local)){
    download.packages(pkg, repos = "https://cran.rstudio.com", destdir = "pkgsrc")    
  }
}