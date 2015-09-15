FROM wordpress

ENV WORDPRESS_DB_HOST mydbinstance.cfrtxetqlrkd.ap-northeast-1.rds.amazonaws.com:3306
ENV WORDPRESS_DB_USER root
ENV WORDPRESS_DB_PASSWORD mypassword
ENV WORDPRESS_DB_NAME blog

# Install tools
RUN apt-get update
RUN apt-get -y --force-yes -o Dpkg::Options::="--force-confdef" install wget curl unzip python python-pip libapache2-mod-php5 php5-mysql php5-curl
RUN pip install awscli

# Install plugins
WORKDIR /tmp/wp-plugins
RUN wget https://downloads.wordpress.org/plugin/svg-support.2.2.2.zip
RUN wget https://downloads.wordpress.org/plugin/crayon-syntax-highlighter.zip
RUN wget https://downloads.wordpress.org/plugin/easy-fancybox.1.5.7.zip
RUN wget https://downloads.wordpress.org/plugin/google-analytics-for-wordpress.5.4.6.zip
RUN wget https://downloads.wordpress.org/plugin/google-sitemap-generator.4.0.8.zip
RUN wget https://downloads.wordpress.org/plugin/php-text-widget.zip
RUN wget https://downloads.wordpress.org/plugin/tinymce-advanced.4.2.3.1.zip
RUN wget https://downloads.wordpress.org/plugin/wp-multibyte-patch.2.3.1.zip
RUN wget https://downloads.wordpress.org/plugin/amazon-web-services.zip
RUN wget https://downloads.wordpress.org/plugin/amazon-s3-and-cloudfront.0.9.5.zip
RUN wget https://downloads.wordpress.org/plugin/jetpack.3.5.3.zip
RUN wget http://blog.openmedialabo.net/wp_plugin/wp-tmkm-amazon1.5.2.zip

RUN unzip './*.zip' -d /usr/src/wordpress/wp-content/plugins

# Download lang files
WORKDIR /usr/src/wordpress/wp-content/
RUN wget https://s3-ap-northeast-1.amazonaws.com/tsukaby.blog/languages.zip
RUN unzip languages.zip && rm languages.zip


# Change owner
RUN chown -R www-data:www-data /usr/src/wordpress/wp-content

WORKDIR /var/www/html
