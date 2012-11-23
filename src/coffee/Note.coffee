class Note
    constructor: (@name, @tags, @description, @created = new Date(), @modified = []) ->

    asJson: ->
        name: @name
        tags: @tags
        description: @description
        created: @created
        modified: @modified

module.exports = Note
