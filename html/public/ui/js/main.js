'use strict';

// import sayName from "./modules/alert";

var sayName = function sayName() {
  var name = arguments.length <= 0 || arguments[0] === undefined ? 'allan' : arguments[0];

  var greeting = 'hello ' + name;
  alert(greeting);
};

sayName('allan');
console.log('asdfds.asdfads');