FROM wordpress

ENV WORDPRESS_DB_HOST mydbinstance.cfrtxetqlrkd.ap-northeast-1.rds.amazonaws.com:3306
ENV WORDPRESS_DB_USER=root
ENV WORDPRESS_DB_PASSWORD=password
ENV WORDPRESS_DB_NAME=tech_blog

# Install tools
RUN apt-get update
RUN apt-get -y install wget curl unzip python python-pip
RUN pip install awscli

# Install plugins
WORKDIR /tmp/wp-plugins
RUN wget https://downloads.wordpress.org/plugin/svg-support.2.1.7.zip
RUN wget https://downloads.wordpress.org/plugin/crayon-syntax-highlighter.zip
RUN wget https://downloads.wordpress.org/plugin/crazy-bone.0.5.5.zip
RUN wget https://downloads.wordpress.org/plugin/easy-fancybox.1.5.7.zip
RUN wget https://downloads.wordpress.org/plugin/google-analytics-for-wordpress.5.4.2.zip
RUN wget https://downloads.wordpress.org/plugin/google-sitemap-generator.4.0.8.zip
RUN wget https://downloads.wordpress.org/plugin/php-text-widget.zip
RUN wget https://downloads.wordpress.org/plugin/tinymce-advanced.4.1.9.zip
RUN wget https://downloads.wordpress.org/plugin/wp-multibyte-patch.2.3.1.zip
RUN wget http://blog.openmedialabo.net/wp_plugin/wp-tmkm-amazon1.5.2.zip

RUN unzip './*.zip' -d /usr/src/wordpress/wp-content/plugins

# Install themes
WORKDIR /tmp/themes
RUN wget https://s3-ap-northeast-1.amazonaws.com/tsukaby/stinger5ver20150505b.zip
RUN unzip './*.zip' -d /usr/src/wordpress/wp-content/themes


# Download image files
WORKDIR /usr/src/wordpress/wp-content/
RUN mkdir uploads
RUN aws s3 sync s3://tsukaby.techblog/uploads ./uploads/

# Download lang files
WORKDIR /usr/src/wordpress/wp-content/
RUN mkdir languages
RUN aws s3 sync s3://tsukaby.techblog/languages ./languages/

# Set default lang ja_JP
# RUN echo "define('WPLANG', 'ja_JP');" >> /usr/src/wordpress/wp-config.php

# Change owner
RUN chown -R www-data:www-data /usr/src/wordpress/wp-content

WORKDIR /var/www/html
