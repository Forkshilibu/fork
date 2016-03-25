var express = require('express');
// var router = express.Router();
var router = express();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.post('/test', function(req, res, next) {
  res.send({
    name: 'chengzheng',
    age: '18'
  })
});
router.all('/testall', function(req, res, next) {
  res.send({
    name: 'chengzhengall',
    age: '18all'
  })
});

router.all('/muxiansen', function(req, res, next) {
  res.redirect('http://www.muxiansen.com');
});

module.exports = router;
