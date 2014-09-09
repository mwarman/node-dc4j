log4js = require 'log4js'

logger = log4js.getLogger()

# Add logger configuration here...
# Console is default
# File logging configuration may be added

trace = (msg) ->
  logger.trace msg

debug = (msg) ->
  logger.debug msg

info = (msg) ->
  logger.info msg

warn = (msg) ->
  logger.warn msg

error = (msg) ->
  logger.error msg

fatal = (msg) ->
  logger.fatal msg

exports.trace = trace
exports.debug = debug
exports.info = info
exports.warn = warn
exports.error = error
exports.fatal = fatal
