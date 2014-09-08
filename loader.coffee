fs = require 'fs'

load = (filename, callback) ->
  obj = {}
  options = { encoding: 'utf8' }
  
  fs.readFile filename, options, (err, data) ->
    if err
      console.warn err
      return
    obj = JSON.parse data
    callback obj

exports.load = load
