## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
FROM rocker/hadleyverse
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Refresh package list and upgrade
RUN apt-get update && apt-get install -y --no-install-recommends \
    libxslt1-dev \
    libgeos-dev \
    libgeos-c1 \
    gdal-bin \
    libgdal1h \
    libgdal1-dev \
    netcdf-bin \
    libproj-dev


## Install Omegahat dependencies 
RUN install2.r --error --repos http://www.omegahat.org/R \
    Rcompression \
    RHTMLForms \
    ROOXML \
    RWordXML \
    SSOAP \
    Sxslt \
    XMLSchema \
|| installGithub.r --deps TRUE \
    omegahat/Rcompression \
    omegahat/RHTMLForms \
    duncantl/ROOXML \
    duncantl/RWordXML \
    omegahat/XMLSchema \
    omegahat/SSOAP/Install \
    omegahat/Sxslt \
&& rm -rf /tmp/downloaded_packages/


## Install Github dependencies
RUN installGuthub.r \
  DataONEorg/rdataone/dataonelibs \
  ropensci/rdataone/dataone \
  egonw/rrdf/rrdflibs \
  egonw/rrdf/rrdf \
&& rm -rf /tmp/downloaded_packages/


## Install build dependencies (not avaialble for Debian)
#RUN apt-get build-dep -y r-cran-rgeos r-cran-rgdal

## Install the rOpenSci R packages that are currently on CRAN
RUN install2.r --error --deps TRUE \
  alm \
  AntWeb \
  aRxiv \
  bold \
  dvn \
  ecoengine \
  paleobioDB \
  rAltmetric \
  rAvis \
  rbhl \
  rbison \
  rdryad \
  rebird \
  rentrez \
  Reol \
  rfigshare \
  rfishbase \
  rfisheries \
  rgbif \
  rinat \
  RNeXML \
  rnoaa \
  rplos \
  RSelenium \
  rsnps \
  rWBclimate \
  solr \
  spocc \
  taxize \
  treebase \
&& rm -rf /tmp/downloaded_packages/

