var pool =require ("./pool")

class Order{
    constructor(){}
    //生成订单号 
    createtem(req,callback){
      var {ordertable,foodId,foodnum}=req.query
      var ordernum = req.query.ordernum;
        //	console.log(req.query);
      pool.getConnection((err,conn)=>{
       
      	if(err) throw err
       
      	conn.query(`select * from diancan_order where ordernum=${req.query.ordernum}`,function(err,data){
          //console.log(ordertable,foodId,foodnum,ordernum);
      		if(err) throw err
          
      		if(!data.length){//当前桌子还没有下单
            function fdouble(num){
              if(num<10){num="0"+num}
              return num
            }
            var oDate=new Date()
            ordernum=oDate.getFullYear()+fdouble(oDate.getMonth()+1)+fdouble(oDate.getDate())+
            fdouble(oDate.getHours())+fdouble(oDate.getMinutes())+fdouble(oDate.getSeconds())

      		
           
      		  var tablestate=1
      		 var str=`insert into diancan_order (ordernum,ordertable,ordertablestate)
              values('${ordernum}','${ordertable}','${tablestate}')`
      		 conn.query(str,(err)=>{
      		 	if(err) throw err
      		 	conn.query(`insert into order_fushu (ordertable,ordernum,foodid,foodnum) 
      		 	values ('${ordertable}','${ordernum}','${foodId}','${foodnum}')`,(err)=>{
      		 	  if(err) throw err
      		 	  callback(1,ordernum)
      		 	  conn.release()
      		 	})
      		 })
      		}else{//如果已经有订单了
           //console.log(ordertable,foodId,foodnum)
      		  var str3=`select * from order_fushu where foodid='${foodId}' and ordernum='${req.query.ordernum}'`
           
            conn.query(str3,(err,data)=>{
              if(err) throw err
              
              if(data.length){//如果有数据删除数据
                conn.query(`delete from order_fushu where foodid=${foodId} and ordernum=${req.query.ordernum}`,(err)=>{
                  if(err) throw err
                  
                  callback(1,req.query.ordernum)
                  conn.release()
                })
              }else{
               
                conn.query(`insert into order_fushu (ordertable,ordernum,foodid,foodnum) 
                  values ('${ordertable}','${req.query.ordernum}','${foodId}','${foodnum}')`,(err)=>{
                  if(err) throw err
                  callback(1,req.query.ordernum)
                  conn.release()
      		      })
              }
            })
      
      		}
      			
      	})
      })
    }
    //显示订单
     showorder(req,callback){
        const {ordernum} =req.query
      pool.getConnection((err,conn)=>{
          if(err) throw err
          var str=`select * from order_fushu,fooddetail where ordernum='${ordernum}'and order_fushu.foodid=fooddetail.foodid`
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
    //数据库菜品附表的商品个数改变函数
    orderchange(req,callback){
      console.log(req.query)
      const {ordernum,foodid,foodnum} = req.query
      pool.getConnection((err,conn)=>{
        if(err) throw err
         var str=`update order_fushu set foodnum='${foodnum}'
         where ordernum='${ordernum}'and foodid='${foodid}'`
         conn.query(str,(err)=>{
           if(err){
             callback(0,err)
             conn.release()
           }else{
             callback(1,err)
             conn.release()
           }
         })
      })
    }
    //订单中某个菜品的删除
    del(req,callback){
      const {ordernum,foodid} = req.query
      pool.getConnection((err,conn)=>{
        if(err){throw err}
        var str=`delete from order_fushu where ordernum='${ordernum}' and foodid='${foodid}'`
        conn.query(str,(err)=>{
          if(err){
            callback(0,err)
            conn.release()
          }else{
            callback(1,err)
            conn.release()
          }
        })
      })
    }


   //生成订单(没有用到这个函数)
   createorder(req,callback){
     const{uname,uworknum,ordertable,ordertime,ordernum,orderstate}=req.query
     var {foodids,foodnums}=req.query
     console.log(foodids,typeof(foodids))
     pool.getConnection((err,conn)=>{
       if(err) throw err
       var str=`insert into diancan_order (uname,uworknum,ordertable,ordertime,ordernum,orderstate)
              values('${uname}','${uworknum}','${ordertable}','${ordertime}','${ordernum}','${orderstate}')`      
       conn.query(str,(err)=>{
         if(err) throw  err
         //第一句sql语句成功执行后,订单附表
          foodids=eval(foodids)
         console.log(foodids,typeof(foodids))
         foodnums=eval(foodnums)
         foodids.forEach((ele,index)=>{
           var str1 =`insert into order_fushu (ordertable,ordernum,foodid,foodnum) values
                     ('${ordertable}','${ordernum}','${ele}','${foodnums[index]}')`
          conn.query(str1,(err)=>{
            if(err) throw err
          })
         })
          
         callback(1)
         conn.release()
       })
       
     })
   }

   createorderfushu(req,callback){//此函数赞没有使用
     const {foodids}=req.query
     pool.getConnection((err,conn)=>{
       if(err) throw err
       console.log(typeof(foodids))
            
       eval(foodids).forEach((ele)=>{
          conn.query(`insert into order_fushu (foodid) values ('${ele}')`,(err)=>{
            if(err) throw err
            
          })
       })
       conn.release()
       callback("ok")
     })
   }
}

module.exports=Order