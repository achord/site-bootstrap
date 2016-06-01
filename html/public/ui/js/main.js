(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
'use strict';
var i, len, link, loader, popup, popups;

loader = require('./modules/loader');

popup = require('./modules/popup');

popups = document.getElementsByClassName('popup');

for (i = 0, len = popups.length; i < len; i++) {
  link = popups[i];
  link.addEventListener('click', function(event) {
    event.preventDefault();
    return popup(link.href, link.title);
  });
}


},{"./modules/loader":2,"./modules/popup":3}],2:[function(require,module,exports){
'use strict';
var Loader;

Loader = {
  init: (function() {
    return console.log('Bootstrap Start!');
  })()
};

module.exports = Loader;


},{}],3:[function(require,module,exports){
'use strict';
var popupWindow;

popupWindow = function(link, title, options) {
  if (link != null) {
    return window.open(link, title != null ? title : title = 'Share', options != null ? options : options = 'width=750,height=500,toolbar=0,menubar=0,location=0,status=0,scrollbars=0,resizable=1');
  } else {
    return false;
  }
};

module.exports = popupWindow;


},{}]},{},[1])