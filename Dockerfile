FROM xvrdm/ubuntu-16.04
MAINTAINER Xavier Adam <xaad@protonmail.com>

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
RUN echo 'deb http://stat.ethz.ch/CRAN/bin/linux/ubuntu xenial/' | \
    tee -a /etc/apt/sources.list
RUN apt-get install -y --no-install-recommends \
    r-base r-base-dev
RUN R -e "install.packages(c('packrat','shiny'), repos='https://cran.rstudio.com/')"

RUN wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.5.1.834-amd64.deb
RUN dpkg -i shiny-server-1.5.1.834-amd64.deb
