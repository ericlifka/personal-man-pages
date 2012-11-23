command_info_parser = require './parse_command_info.coffee'

module.exports = (argv) ->
    command_description = command_info_parser argv

