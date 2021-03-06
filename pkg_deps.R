#!/usr/bin/env Rscript

# Set deafult CRAN URL
r <- getOption("repos")
r["CRAN"] <- "https://cran.rstudio.com/"
options(repos = r)

# Read input file packages
pkgs_input <- readLines("packages.txt")

# Get all deps
pkgs_deps <- unlist(tools::package_dependencies(pkgs_input, recursive = TRUE))

# Add the input files back on
pkgs_all_unsorted <- c(pkgs_input, pkgs_deps)

# only include unique names
pkgs_all <- sort(unique(pkgs_all_unsorted))

# Get all the base packages
pkgs_base <- rownames(installed.packages(priority="base"))

# Remove base packages from the final output
pkgs_no_base <- setdiff(pkgs_all, pkgs_base)

# Write the final list of packages
writeLines(pkgs_no_base, "baufabrik_packages.txt")
