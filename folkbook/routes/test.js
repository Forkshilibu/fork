var express = require('express');
var test = express();

test.get('/getUserInfo',function(req,res,next){
  res.send('hello world!');
});

module.exports = test;
