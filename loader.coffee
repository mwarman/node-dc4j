fs = require 'fs'

load = (filename) ->
  obj = {}
  options = { encoding: 'utf8' }
  
  data = fs.readFileSync filename, options
  obj = JSON.parse data
  obj

exports.load = load
