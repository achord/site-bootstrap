'use strict'

$ = require 'jquery'


# A class-based template for jQuery plugins in Coffeescript
#
#     $('.target').myPlugin({ paramA: 'not-foo' });
#     $('.target').myPlugin('myMethod', 'Hello, world');
#
# Check out Alan Hogan's original jQuery plugin template:
# https://github.com/alanhogan/Coffeescript-jQuery-Plugin-Template

jPop = do($) ->
  class jPop

    settings =
      title : 'Popup'
      width : 750
      height : 500
      toolbar : 0
      menubar : 0
      location : 0
      status : 0
      scrollbars : 0
      resizable : 1
      top : screen.width/2 - 375;
      left : screen.height/2 - 250;

    constructor: (el, options) ->
      @options = $.extend({}, @defaults, options)
      @$el = $(el)

    # Additional plugin methods go here
    myMethod: (echo) ->
      @$el.html(@options.paramA + ': ' + echo)

  # Define the plugin
  $.fn.extend myPopup: (option, args...) ->
    @each ->
      $this = $(this)
      data = $this.data('myPopup')

      if !data
        $this.data 'myPopup', (data = new myPopup(this, option))
      if typeof option == 'string'
        data[option].apply(data, args)


module.exports = jPop

#EOF
