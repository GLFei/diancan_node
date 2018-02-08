var express = require('express');
var router = express.Router();
var User = require ("../models/user");//引入models里登录注册的数据模块
var Food = require ("../models/food");//引入关于食品的数据模块
var Order = require ("../models/order") //订单数据模块
var jwt = require("jsonwebtoken")
/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: '123home' });
});

router.post("/api/reg",function(req,res,next){
  var myuser=new User;
  myuser.getregdata(req,function(msgCode){
    console.log(msgCode)
  })
})

//登录验证

router.get('/api/login', function(req, res, next) {
  var myuser=new User
  console.log(req.query)
  myuser.getlogindata(req,function(msgCode,result){
    //判断，如果登录成功，设置token
    if(msgCode==1){
      var secret="abc"
      var token=jwt.sign({result},secret,{expiresIn:60*60*24})
      res.send({
        msgCode,
        token
      })
    }else{
      res.send({
        msgCode,
        result:result || {}
      })
    }
   
  })
})
//更改密码
router.get("/api/changepwd",function(req,res,next){
  var myuser=new User
  myuser.changpwd(req,function(msgCode,result){
    if(msgCode==1){
      var secret="abc"
      var token=jwt.sign({result},secret,{expiresIn:60*60*24})
      res.send({
        msgCode,
        token
      })
    }else{
      res.send({
        msgCode,
        result
      })
    }
  })
})

//获取食品菜系的函数
router.get("/api/food/mainclass",function(req,res,next){
  var myfood=new Food
  myfood.getmainclass(req,function(msgCode,results){
    var msg={
      msgCode,
      results
    }
    res.send(msg)
  })  
})

//获取菜系下主食、菜品的函数
router.get("/api/food/eatclass",function(req,res,next){
  var myfood=new Food
  myfood.geteatclass(req,function(msgCode,result){
    var msg={
      msgCode,
      result
    }
    res.send(msg)
  })
})
//获取单个菜的函数
router.get("/api/food/singelfood",function(req,res,next){
  var myfood=new Food
  myfood.getsingelfood(req,function(msgCode,result){
    console.log(req.query)
    res.send(JSON.stringify(result))
  })
})

//显示订单函数
router.get("/api/order/show",function(req,res,next){
   var myorder=new Order
   myorder.showorder(req,function(msgCode,result){
     var data={
       msgCode,
       result :result || {}
     }
     res.send(data)
   })
})
//添加订单
router.get("/api/order/create",function(req,res,next){
  
  var myorder=new Order
  myorder.createorder(req,function(msgCode){
    res.send(JSON.stringify(msgCode))
  })
})
//订单附表，菜品个数的更改
router.get("/api/order/change",function(req,res,next){
  var myorder=new Order
  myorder.orderchange(req,function(msgCode,result){
    res.send({
      msgCode,
      result
    })
  })
})
//删除订单中的每个菜品
router.get("/api/order/del",function(req,res,next){
  var myorder=new Order
  myorder.del(req,function(msgCode,result){
    res.send({
      msgCode,
      result
    })
  })
})

//实验订单附表
router.get("/api/fushu",function(req,res,next){
  var myorder=new Order
  myorder.createorderfushu(req,function(Msg){
    res.send(JSON.stringify(Msg))
  })
})
//订单号的生成
router.get("/api/order/template",function(req,res,next){
	var myorder=new Order
	myorder.createtem(req,function(msgCode,result){
		
		var data={
			msgCode,
			result
		}
		res.send(data)
	})
})
//验证token的路由
router.get("/api/requireAuth",function(req,res,next){
  var token=req.query.token || ""
  var secret="abc"
  jwt.verify(token,secret,(err,decode)=>{
    if(err){
      res.send({result:err,msgCode:0})
    }else{
      res.send({msgCode:1})
    }
  })

})
module.exports = router;
