FROM  fedora:20

RUN   yum install npm nodejs redis which gcc-c++ make openssl-devel libicu-devel -y 
RUN   npm install coffee-script hubot -g
RUN   hubot --create .
RUN   npm install --save hubot-hipchat
RUN   chmod 755 bin/hubot 

RUN   yum -y install supervisor
RUN   mkdir -p /var/log/supervisor

ADD   hubot-scripts.json hubot-scripts.json
ADD   ./supervisord.conf /etc/supervisord.d/hubot.ini

RUN   npm install xml2js underscore underscore.string soupselect htmlparser
RUN   mkdir /scripts; cd /scripts;curl -O https://raw.githubusercontent.com/github/hubot-scripts/master/src/scripts/tvshow.coffee -O https://raw.githubusercontent.com/github/hubot-scripts/master/src/scripts/update.coffee -O https://raw.githubusercontent.com/github/hubot-scripts/master/src/scripts/reddit-jokes.coffee -O https://raw.githubusercontent.com/github/hubot-scripts/master/src/scripts/jenkins.coffee -O https://raw.githubusercontent.com/github/hubot-scripts/master/src/scripts/wikipedia.coffee -O https://raw.githubusercontent.com/github/hubot-scripts/master/src/scripts/futurama.coffee -O https://raw.githubusercontent.com/github/hubot-scripts/master/src/scripts/beerme.coffee

CMD   supervisord -n
