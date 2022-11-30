ARG PHP_VERSION=""
FROM php:${PHP_VERSION}-apache

RUN apt-get update && dpkg --configure -a \
    && apt-get install -y --no-install-recommends git zlib1g-dev libzip-dev zip unzip cron iproute2 

RUN docker-php-ext-install exif 

RUN groupadd dev -g 999
RUN useradd dev -g dev -d /var/www -m
RUN chown -R dev:dev /var/www

RUN rm -rf /var/lib/apt/lists/*


RUN a2enmod rewrite
#COPY apache-site.conf /etc/apache2/sites-available/000-default.conf

########################################################################
# node (for running frontend inside the container, needed for sessions)
########################################################################
SHELL ["/bin/bash", "--login", "-i", "-c"]
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
RUN source /root/.bashrc && nvm install v14.15.4
SHELL ["/bin/bash", "--login", "-c"]

#make node available for all users
#https://stackoverflow.com/a/25368620/4360433
RUN n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; cp -r $n/{bin,lib,share} /usr/local

RUN apt-get update \
    && apt-get install -y gnupg \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install yarn -y


RUN echo "alias ll='ls -lrta'" >> /root/.bashrc

ADD run.sh /run.sh
RUN chmod 755 /run.sh
CMD ["/run.sh"]
