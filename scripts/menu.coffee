showMenu = (robot, res, restaurant, day) ->
    robot.http("https://r1d2.herokuapp.com/#{restaurant}/#{day}")
        .get() (err, resp, body) ->
            if err
                res.send "Encountered and error!"
                return
            output = JSON.parse body
            menu = output["menu"]

            if menu
              result = "This is the #{restaurant} menu for #{day}\n"
              for dish, i in menu
                type = dish["type"]
                name = dish["name"]
                price = dish["price"]
                result += "_#{type}_: *#{name}* (_CHF #{price}_)\n"

            res.reply result

module.exports = (robot) ->
    robot.respond /^What's (?:the menu|for lunch)( in R2)? *(?:for|on)? *(tomorrow|Monday|Tuesday|Wednesday|Thursday|Friday)?\?$/i, (res) ->
        restaurant = res.match[1] || 'r1'
        day = res.match[2] || 'today'
        showMenu(robot, res, restaurant, day)
        return
