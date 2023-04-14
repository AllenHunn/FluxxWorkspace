#!/bin/bash --login
rvm install 2.7.4 
rvm use 2.7.4 --default
sudo apt-add-repository -y -s "deb http://security.ubuntu.com/ubuntu bionic-security main"
sudo apt-get update --allow-insecure-repositories
apt-cache policy libssl1.0-dev
sudo apt-get install --allow-unauthenticated -y libssl1.0-dev
rvm install 2.2
curl https://www.openssl.org/source/openssl-1.0.2l.tar.gz | tar xz && cd openssl-1.0.2l && sudo ./config && sudo make && sudo make install
sudo ln -sf /usr/local/ssl/bin/openssl `which openssl`
openssl version -v
rvm install 2.3.8 --with-openssl-dir=/usr/bin/openssl
gem install bundler -v=1.17.3
sudo apt-get -y install redis
sudo service redis-server start
sudo apt-get -y install build-essential
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/home/linuxbrew/.linuxbrew/bin/brew install mysql@5.7
/home/linuxbrew/.linuxbrew/bin/brew services start mysql@5.7
sudo apt-get -y install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update --allow-insecure-repositories
sudo apt-get install --allow-unauthenticated -y elasticsearch=7.10.0
# TODO: add github pull logic to actually have the gem file.
# bundle _1.17.3_ install