
module.exports = (robot) ->
    robot.respond /bad robot/i, (res) ->
        res.emote "hides in a corner"

    robot.respond /open the pod bay doors/i, (res) ->
        res.reply "Sorry, " + res.message.user.name + ". I'm a afraid I can't let you do that"
