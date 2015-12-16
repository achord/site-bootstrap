# module.exports = do ->
#     this.Person = (options)->
#         defaults =
#             fname: 'jon'
#             lname: 'doe'
#             age: 1
#             sex: "m"
#         if options and typeof options == 'object'
#             for own key, value of options
#                  defaults[key] = options[key]
#             defaults
#         else
#             defaults

#     this.Person

class Person
  constructor: (@options) ->
    @defaults =
      fname: 'jon'
      lname: 'doe'
      age: 1
      sex: "m"
    if @options and typeof @options == 'object'
      for own key, value of @options
         @defaults[key] = @options[key]
      @defaults
    else
      @defaults

  sayHello: ->
      "Hi im #{@defaults.fname}"


Person::sayAge = ->
  @defaults.age

module.exports = Person

#EOF
