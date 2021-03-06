#!/usr/bin/env Rscript

source("config.R")

# Helper functions

create_dir_if_not_exist <- function(dirname){
    if (dir.exists(dirname)){
        cat("Directory exists:", dirname, "\n")
    } else {
        dir.create(dirname)
    }
}

# create the custom install dir
create_dir_if_not_exist("~/R/r4pi/")

# create pkgbin
create_dir_if_not_exist(conf_binrepo_dir)

# create pkgsrc
create_dir_if_not_exist("pkgsrc")

# create pkgarchive
create_dir_if_not_exist("pkgarchive")

