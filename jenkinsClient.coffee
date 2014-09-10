logger = require './logger'
request = require 'request'

class JenkinsEntity
  constructor: (@model) ->
  
  get: (path) ->
    value = undefined
    nodes = path.split '.'
    if nodes.length is 1 and @model[nodes[0]]?
      value = @model[nodes[0]]
    else
      parent = @model
      for child in nodes
        if parent[child]?
          value = parent[child]
          parent = value
        else
          value = undefined
          break
    value
  
  toString: () ->
    JSON.stringify @model


class JenkinsBuild extends JenkinsEntity
  

class JenkinsJob extends JenkinsEntity
  

class JenkinsClient
  constructor: (@baseUrl, @credentials) ->
  
  getJob: (jobname, callback) ->
    logger.debug "Get Jenkins Job #{ jobname }"
    url = @baseUrl + 'job/' + jobname + '/api/json'
    request.get url, @credentials, (err, resp, body) ->
      if err || resp.statusCode isnt 200
        logger.warn "Unable to communicate with Jenkins."
        throw err
      jobdata = JSON.parse body
      jenkinsJob = new JenkinsJob jobdata
      callback jenkinsJob

  getBuild: (jobname, buildNumber, callback) ->
    logger.debug "Get Jenkins Build #{ buildNumber }"
    url = @baseUrl + 'job/' + jobname + '/' + buildNumber + '/api/json'
    request.get url, @credentials, (err, resp, body) ->
      if err || resp.statusCode isnt 200
        logger.warn "Unable to communicate with Jenkins."
        throw err
      buildData = JSON.parse body
      jenkinsBuild = new JenkinsBuild buildData
      callback jenkinsBuild


getInstance = (baseUrl, credentials) ->
  new JenkinsClient baseUrl, credentials
  
exports.getInstance = getInstance