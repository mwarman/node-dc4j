loader = require './loader'

console.log "Starting..."

# Load Configuration
configFile = __dirname + '/config.json'
console.log "load configuration from file: #{ configFile }"
configuration = loader.load configFile
console.log JSON.stringify configuration

