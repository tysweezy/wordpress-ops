#!/bin/sh

cd ~

# install php from source

curl -L https://php.net/distributions/php-7.4.33.tar.gz > php-7.4.33.tar.gz

tar -xvzf php-7.4.33.tar.gz && cd php-7.4.33.tar.gz

./configure
make
sudo make install


# sudo service apache2 restart
