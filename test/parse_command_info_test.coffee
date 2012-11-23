assert = require 'assert'
parse_command_info = require '../src/coffee/parse_command_info.coffee'

make_argv_from_command = (command) ->
    command.split(' ')

describe 'parse_command_info', ->
    it 'should break the argument list into a descriptor object', ->
        descriptor = parse_command_info make_argv_from_command 'node src/main.js'
        assert.equal 'object', typeof descriptor

    it 'should provide the node command used to run the program', ->
        descriptor = parse_command_info make_argv_from_command 'node src/main.js'
        assert.equal 'node', descriptor.engine

    it 'should provide the location of the program file', ->
        descriptor = parse_command_info make_argv_from_command 'node src/main.js'
        assert.equal 'src/main.js', descriptor.script

    it 'should provide the command to be executed', ->
        descriptor = parse_command_info make_argv_from_command 'node src/main.js add'
        assert.equal 'add', descriptor.command

    it 'should provide any arguments as fields on the descriptor', ->
        descriptor = parse_command_info make_argv_from_command 'node src/main.js add --Name '
