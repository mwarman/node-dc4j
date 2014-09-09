class Jenkins
  constructor: (@model) ->
  
  get: (attr) ->
    if @model[attr]?
      @model[attr]
    
  toString: () ->
    JSON.stringify @model
    
getInstance = (model) ->
  new Jenkins model
  
exports.getInstance = getInstance