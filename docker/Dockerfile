FROM ubuntu:20.04

# Install nginx and PHP 7.3
RUN apt-get update && apt-get install -y \
    nginx \
    php7.3 \
    php7.3-fpm \
    php7.3-mysql \
  && rm -rf /var/lib/apt/lists/*

# Copy the WordPress files
COPY . /opt/webapps/site/

# Update permissions on WordPress files
RUN chown -R www-data:www-data /opt/webapps/site/

# Configure nginx
COPY sample.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]

