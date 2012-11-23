parse_command_info = require '../src/coffee/parse_command_info.coffee'

make_argv_from_command = (command) ->
    command.split(' ')

describe 'parse_command_info', ->
    it 'should break the argument list into a descriptor object', ->
        descriptor = parse_command_info make_argv_from_command 'node src/main.js add'
        descriptor.should.be.a 'object'

    it 'should provide the node command used to run the program', ->
        descriptor = parse_command_info make_argv_from_command 'node src/main.js add'
        descriptor.engine.should.equal 'node'

    it 'should provide the location of the program file', ->
        descriptor = parse_command_info make_argv_from_command 'node src/main.js add'
        descriptor.script.should.equal 'src/main.js'

    it 'should provide the command to be executed', ->
        descriptor = parse_command_info make_argv_from_command 'node src/main.js add'
        descriptor.command.should.equal 'add'

    it 'should provide any arguments as fields on the descriptor', ->
        descriptor = parse_command_info make_argv_from_command 'node src/main.js add --Name Test note name'
        descriptor.arguments.should.have.property 'Name', 'Test note name'

    it 'should handle multiple arguments', ->
        descriptor = parse_command_info make_argv_from_command 'node src/main.js add --Name Test note name --Tags tagA tagB tagC'
        descriptor.arguments.should.have.property 'Name', 'Test note name'
        descriptor.arguments.should.have.property 'Tags', 'tagA tagB tagC'

    it 'should require a command to be specified', ->
        (-> parse_command_info make_argv_from_command 'node src/main.js').should.throw()
