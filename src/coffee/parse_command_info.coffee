is_an_argument = (command) ->
    command[0..1] == '--'

strip_argument_marker = (command) ->
    command[2..]

break_into_argument_groups = (args) ->
    results = []

    while args.length > 0
        current = args.shift()
        if is_an_argument current
            results.push []

        results[results.length - 1].push current

    results

create_arguments_descriptor = (args) ->
    argument_descriptor = {}
    argument_groups = break_into_argument_groups args

    for arg_group in argument_groups
        argument_name = strip_argument_marker arg_group.shift()
        argument_descriptor[argument_name] = arg_group.join ' '

    argument_descriptor

command_info_parser = (args) ->
    engine = args.shift()
    script = args.shift()
    command = args.shift()
    throw 'incorrect usage' unless engine? and script? and command?

    return descriptor =
        engine: engine
        script: script
        command: command
        arguments: create_arguments_descriptor args

module.exports = command_info_parser
