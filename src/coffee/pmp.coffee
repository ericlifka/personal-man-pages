command_info_parser = require './parse_command_info.coffee'

commands =
    add: require './commands/add.coffee'

print_usage = (error) ->
    console.log "not the right usage dummy: #{error}"

run_command = (command_description) ->
    commands[command_description.command]?(command_description.arguments)

module.exports = (argv) ->
    try
        command_description = command_info_parser argv
        run_command command_description
    catch error
        print_usage error


