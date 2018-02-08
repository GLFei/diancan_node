var pool = require ("./pool")

class Spefood{
    constructor(){}
    gethotfood(req,callback){
      pool.getConnection((err,conn)=>{
        if(err) throw err
        var str=`select * from fooddetail where hotfood=2`
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

     getnewfood(req,callback){
      pool.getConnection((err,conn)=>{
        if(err) throw err
        var str=`select * from fooddetail where hotfood=1`
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
}

  module.exports=Spefood