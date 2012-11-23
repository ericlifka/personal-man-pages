command_info_parser = require './parse_command_info.coffee'

print_usage = (error) ->
    console.log "not the right usage dummy: #{error}"

module.exports = (argv) ->
    try
        command_description = command_info_parser argv
    catch error
        print_usage error

