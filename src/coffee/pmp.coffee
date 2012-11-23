command_info_parser = require('./command_info_parser.coffee')

module.exports = (argv) ->
    command_description = command_info_parser argv
