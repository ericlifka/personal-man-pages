fs = require('fs')

console.log "Contents of README.md:"
fs.readFile './README.md', 'utf-8', (err, data) ->
	console.log data
