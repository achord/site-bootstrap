'use strict'

$ = require 'jquery'
loader = require './modules/loader'
popup = require './modules/popup'
popups = document.getElementsByClassName('popup')

for link in popups
    link.addEventListener 'click', (event) ->
        event.preventDefault()
        popup link.href, link.title

#EOF
