var pool = require ("./pool")

class User{
   constructor(){}
   //用户注册的数据库操作
   getregdata(req,callback){
     const {username,passwrod} =req.body
     pool.getConnection((err,conn)=>{
       if(err) throw err
       var str=`select * from diancan_user where uname='${username}'`
       conn.query(str,(err,data)=>{
           if(err) throw err
           if(data){
              callback(0)
              conn.release()
           }else{
             var str2=`insert into diancan_user (uname,pasword) valus ('${username}','${password}')`
             conn.query(str2,(err)=>{
                 if(err) throw err
                 callback(1)
                 conn.release()
             })
           }
       })
     })  
   }

   //获取用户登录数据方法
   getlogindata(req,callback){
     const {username,password} = req.query
     console.log(username)
     pool.getConnection((err,conn)=>{
       if(err) throw err
       var str=`select * from diancan_user where uname='${username}'`
       conn.query(str,(err,data)=>{
         console.log(data,"haha")
         if(err) throw err
         if(data.length){
            if(data[0].upassword==password){
              callback(1,data)
              conn.release()
            }else{
              callback(2)
              conn.release()
            }
         }else{
            callback(0)
            conn.release()
         }
       })
     })
   }
//修改账号密码的方法
changpwd(req,callback){
   const{username,password,newpassword} =req.query
   pool.getConnection((err,conn)=>{
     if(err) throw err
     var str=`select * from diancan_user where uname='${username}' and upassword='${password}'`
     conn.query(str,(err,data)=>{
       if(err) throw err
       if(data.length){
         //callback("ok")
         var str1=`update diancan_user set upassword='${newpassword}' where uname='${username}' `
         conn.query(str1,(err)=>{
           if(err){
             callback(0,err)
             conn.release()
           }else{
             callback(1,err)
             conn.release()
           }
         })
       }else{
         callback(2,"账号密码不正确")
         conn.release()
       }
     })
   })
}

   //实验用的方法
   getdata(req,callback){
       const {a,b}=req.query
       console.log(a)
       pool.getConnection((err,conn)=>{
           if(err) throw err
           conn.query(`select * from diancan_user`,(err,data)=>{
               if(err) throw err
               if(data.length){
                   callback(data)
                   conn.release()
               }
           })
       })

   }
   
}
 module.exports = User