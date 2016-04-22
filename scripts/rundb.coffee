showMenu = (robot, res, runnumber) ->
  robot.http("http://lbrundb.cern.ch/api/run/#{runnumber}/").get() (err, resp, body) ->
    if err
      res.send "Encountered an error!"
      return
    output 	= JSON.parse body
    energy	= output["beamenergy"]
    fillid	= output["fillid"]
    velopos	= output["veloPosition"]
    mag		= output["magnetState"]
    dddbTag	= output["dddbTag"]
    condTag	= output["conddbTag"]
    avlumi	= output["avLumi"]
    endlumi	= output["endlumi"]
    betast	= output["betaStar"]
    avMu	= output["avMu"]
    state	= output["state"]
    runtype	= output["runtype"]
    activity= output["activity"]
    LHCstate= output["LHCState"]
    dest	= output["destination"]
    tck		= output["tck"]
    
    
    result = "Information for Run Number: #{runnumber}\n"
    
    result += "_*Beam Energy*_: #{energy} GeV\n"
    result += "_*Fill ID*_: #{fillid}\n"
    result += "_*VELO Position*_: #{velopos}\n"
    result += "_*Magnet Polarity*_: #{mag}\n"
    result += "_*dddbTag*_: #{dddbTag}\n"
    result += "_*conddbTag*_: #{condTag}\n"
    result += "_*Average Luminosity*_: #{avlumi}\n"
    result += "_*Run Luminosity*_: #{endlumi}\n"
    result += "_*Beta Star*_: #{betast}\n"
    result += "_*Average Mu*_: #{avMu}\n"
    result += "_*State*_: #{state}\n"
    result += "_*LHC State*_: #{LHCstate}\n"
    result += "_*Run Type*_: #{runtype}\n"
    result += "_*Activity*_: #{activity}\n"
    result += "_*Destination*_: #{dest}\n"
    result += "_*TCK*_: #{tck}\n"
    
    
    
    res.reply result

module.exports = (robot) ->
  robot.respond /rundb (.*)/i, (res) ->
    runnumber = res.match[1]
    showMenu robot, res, runnumber
    return

