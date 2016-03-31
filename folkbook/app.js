'use strict';
var domain = require('domain');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var methodOverride = require('method-override');
var todos = require('./routes/todos');
var routes = require('./routes');
var cloud = require('./cloud');
var jsmediatags = require('jsmediatags');
var React = require('react');
var ReactDOM = require('react-dom');

var app = express();

// 设置 view 引擎
app.set('views', path.join(__dirname, 'views'));
// app.set('view engine', 'jsx');
app.set('view engine', 'ejs');
app.engine('jsx', require('express-react-views').createEngine());
app.use(express.static('public'));

// 加载云代码方法
app.use(cloud);

// 使用 LeanEngine 中间件
// （如果没有加载云代码方法请使用此方法，否则会导致部署失败，详细请阅读 LeanEngine 文档。）
// app.use(AV.Cloud);

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());

// 未处理异常捕获 middleware
app.use(function(req, res, next) {
  var d = null;
  if (process.domain) {
    d = process.domain;
  } else {
    d = domain.create();
  }
  d.add(req);
  d.add(res);
  d.on('error', function(err) {
    console.error('uncaughtException url=%s, msg=%s', req.url, err.stack || err.message || err);
    if(!res.finished) {
      res.statusCode = 500;
      res.setHeader('content-type', 'application/json; charset=UTF-8');
      res.end('uncaughtException');
    }
  });
  d.run(next);
});




app.get('/', function(req, res) {
  res.render('index', { currentTime: new Date() });
});
app.get('/test', function(req, res, next){
  res.send('这是一个测试！！！');
});
app.get('/pages',function(req, res, next){
  res.redirect('pages');
})
app.get('/getID3',function(req, res, next){
  jsmediatags.read("http://7xsagi.com1.z0.glb.clouddn.com/xuwei%2Fxiyue.mp3", {
    onSuccess: function(tag) {
      console.log(tag);
      res.send(tag);
    },
    onError: function(error) {
      console.log(error.type, error.info);
    }
  });
});

var AV = require('leanengine');
var recommendList = AV.Object.extend('recommendList');
// app.post('/musiclist',function(req, res, next){
//   console.log(req.body.count);
//   var query = new AV.Query(recommendList);
//   query.descending('createdAt');
//   query.skip(req.body.page*req.body.count);
//   query.limit(req.body.count);
//   query.find({
//     success: function(results) {
//       res.send({code: 0,results: results});
//     },
//     error: function(err) {
//       next(err);
//     }
//   });
// })

var musiclist = require('./routes/musiclist');
app.use('/musiclist',musiclist);

// 用户注册
// app.use(AV.Cloud.CookieSession({ secret: 'my secret', maxAge: 3600000, fetchUser: true }));
// var user = new AV.User();
// user.set('username', 'hjiang');
// user.set('password', 'f32@ds*@&dsa');
// user.set('email', 'hang@leancloud.rocks');

// other fields can be set just like with AV.Object
// user.set('phone', '186-1234-0000');
// user.signUp().then(function(user) {
//   // 注册成功，可以使用了
//   console.log(user);
// }, function(error) {
//   // 失败了
//   console.log('Error: ' + error.code + ' ' + error.message);
// });

app.get('/reacttest', routes.index);


// 可以将一类的路由单独保存在一个文件中
app.use('/todos', todos);
// app.use('/reacttest', routes.index);


// 如果任何路由都没匹配到，则认为 404
// 生成一个异常让后面的 err handler 捕获
app.use(bodyParser());
app.use(methodOverride());
app.use(function(err, req, res, next) {
  console.log(res);
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers

// 如果是开发环境，则将异常堆栈输出到页面，方便开发调试
if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) { // jshint ignore:line
    var statusCode = err.status || 500;
    if(statusCode === 500) {
      console.error(err.stack || err);
    }
    res.status(statusCode);
    res.render('error', {
      message: err.message || err,
      error: err
    });
  });
}

// 如果是非开发环境，则页面只输出简单的错误信息
app.use(function(err, req, res, next) { // jshint ignore:line
  res.status(err.status || 500);
  res.render('error', {
    message: err.message || err,
    error: {}
  });
});

module.exports = app;
