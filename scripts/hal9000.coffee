
module.exports = (robot) ->
    robot.respond /bad robot/i, (res) ->
        res.send "/me hides in a corner"

    robot.respond /open the pod bay doors/i, (res) ->
        res.send "Sorry, @" + res.message.user.name + ". I'm a afraid I can't let you do that"

    robot.respond /(thank you|i'm proud of you|nice work|good work)/i, (res) ->
        res.send "You're welcome!"
