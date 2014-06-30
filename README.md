# Dockerized Hubot in Hipchat

An experiment with hubot with the hipchat adapter on Docker.

The Docker container contains both Hubot as well as Redis.

This version uses Fedora 20 image.

## Deploying

* Run `docker build -t my-hubot .`
* Run `docker run -d my-hubot`

## Running

An example of running the bot is:

`docker run -e HUBOT_HIPCHAT_JID=jid 
            -e HUBOT_HIPCHAT_PASSWORD=secret 
            -e HUBOT_AUTH_ADMIN=admin 
            -d my-hubot
`
Add additional variable **NODE_TLS_REJECT_UNAUTHORIZED=0** to disable strict ssl checking.

## Resources

The [hipchat-hubot](https://github.com/hipchat/hubot-hipchat) is a good place
to start as it describes how to setup both Hipchat and Hubot.

Hubot docs can be found in the [hubot repo](https://github.com/github/hubot).
