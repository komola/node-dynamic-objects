
d = require "dynamicobject"
[Model, Dictionary] = [d.Model, d.Dictionary]

testModel = () =>
  m = new Model { firstName: "Henning" }

  m.bind "firstName", (value, args) ->
    if args.oldValue?
      console.log "New Value"
    console.log value

  m.set "firstName", "Henning2"


testDictionary = () =>
  m = new Dictionary { "de": "Deutschland", "en": "England" }

  m.bind "de", (value, args) ->
    console.log "#{args.name}: #{args.oldValue} -> #{value}"

  m.set "it", "Italien"
  m.set "it", "Italien2"
  m.set "it", undefined




testDictionary()