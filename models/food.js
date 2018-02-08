var pool = require ("./pool")

class Food{
    constructor(){}
    //获取主分类的方法
    getmainclass(req,callback){
      pool.getConnection((err,conn)=>{
          if(err) throw err
          var str=`select * from mainclass`
          conn.query(str,(err,data)=>{
            if(err) throw err
            if(data.length){
              callback(1,data)
              conn.release()
            }else{
              callback(0)
              conn.release()
            }
          })
      })
    }
    //获取菜系下面主食分类的方法
    geteatclass(req,callback){
      const {classtype}=req.query
      console.log(classtype)
      pool.getConnection((err,conn)=>{
         if(err) throw err
         var str=`select * from eatfood where classtype='${classtype}'`
         conn.query(str,(err,data)=>{
           if(err) throw err
           if(data.length){
              callback(1,data)
              conn.release()
           }else{
            callback(0)
           conn.release()
           }
         })
      })
    }

    //获取菜品的方法
    getsingelfood(req,callback){
       let {classtype,eattype} = req.query
            console.log("heelo",classtype,eattype)
       pool.getConnection((err,conn)=>{
         if(err) throw err
         var str=`select * from fooddetail where classtype='${classtype}' and eattype='${eattype}'`
         conn.query(str,(err,data)=>{
           if(err) throw err
           console.log(data)
           if(data.length){
           callback(1,data)
           conn.release()
          }else{
            callback(0)
           conn.release()
           }
         })
       })
       
    }


}
 module.exports=Food