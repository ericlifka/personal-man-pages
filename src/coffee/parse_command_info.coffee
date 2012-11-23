is_a_command = (command) ->
    command.substr(0, 2) == "--"

break_into_groups = (args) ->
    results = []

    while args.length > 0
        current = args.shift()
        if is_a_command current
            results.push []

        results[results.length - 1].push current

    results

command_info_parser = (argv) ->
    descriptor = {}

    add_command = (command) ->
        command_name = command.shift()
        descriptor[command_name] = command.join ' '

    descriptor.engine = argv.shift()
    descriptor.script = argv.shift()
    descriptor.command = argv.shift()

    command_groups = break_into_groups argv

    add_command command for command in command_groups

    descriptor

module.exports = command_info_parser
