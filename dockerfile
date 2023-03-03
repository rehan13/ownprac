FROM rocker/rstudio:4.1.3

WORKDIR /home/rstudio

# you can use remotes::install_version() as well instead of using renv

COPY --chown=rstudio:rstudio renv.lock .
COPY --chown=rstudio:rstudio renv renv
COPY --chown=rstudio:rstudio .Rprofile .

RUN ls -alh

USER rstudio
RUN Rscript -e "renv::repair()"
RUN Rscript -e "renv::restore()"
USER root