var express = require('express');
var router = express.Router();
var Spefood = require ("../models/spefood")

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with specil');
});

//获取店长推荐（hot)商品的路由
router.get("/api/hotfood",function(req,res,next){
  var myspefood= new Spefood
  myspefood.gethotfood(req,function(msgCode,result){
    var data={
      msgCode,
      result
    }
    res.send(data)
  })
})

//获取店新品（new)的路由
router.get("/api/newfood",function(req,res,next){
  var myspefood= new Spefood
  myspefood.getnewfood(req,function(msgCode,result){
    var data={
      msgCode,
      result
    }
    res.send(data)
  })
})

module.exports = router;
