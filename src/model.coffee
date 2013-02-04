
events = require "events"


class Model extends events.EventEmitter
  constructor: (values) ->
    @_values = values

  get: (id, resultCallback, options) =>
    resultCallback @_values[id], name: id, owner: @

  set: (id, value, options) =>
    [@_values[id], oldValue] = [value, @_values[id]]
    @emit "change:" + id, value, name: id, owner: @, oldValue: oldValue
      
    @emit "change", value, name: id, owner: @, oldValue: oldValue

  bind: (id, bindCallback) =>
    if arguments.length == 1
      [bindCallback, id] = [id, undefined]
      
      for key, value of @_values
        bindCallback value, name: key, owner: @

      @on "change", bindCallback

    else
      bindCallback @_values[id], name: id, owner: @
      @on "change:" + id, bindCallback


module.exports = Model