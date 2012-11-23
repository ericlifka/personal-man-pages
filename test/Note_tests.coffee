Note = require '../src/coffee/Note.coffee'

describe 'Note', ->
    describe '#asJson', ->
        it 'should return an object describing the Note', ->
            now = new Date()
            note = new Note 'name', ['tag'], 'description', now, [now]
            note.should.eql
                name: 'name'
                tags: ['tag']
                description: 'description'
                created: now
                modified: [now]
