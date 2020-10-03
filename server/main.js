const express = require("express");
const mysql = require("mysql2/promise");
const userRout = express.Router();
 

let db = null;
const app = express();

app.use('/test',userRout);
app.use(express.json());

userRout.route('/test1').post(function (req,res){
  console.log("working pa");

})




app.post('/tom', async(req, res, next)=>{
//   console.log("inside the function");
//   console.log(req.body);
//   const name = req.body.name;
//   const email = req.body.email;
//   const location = req.body.location;
//   const mobile = req.body.mobile;
//   const certifiednumber = req.body.certifiednumber;
  
//   console.log(name);
//   var sql = `INSERT INTO salon (name,email,location,mobile,certifiednumber,password) VALUES ('${name}','${email}','${location}','${mobile}','${certifiednumber}','qwerty123')`;
//   // var connection = connection.query(sql, function(err,rows,fields) {});
//  await db.query(sql,function(err,rows,fields) {});
  console.log("Getting tom");

  res.send({status:"OK"});
  next();
});


app.post('/makereservation', async(req, res, next)=>{
    console.log(`Making Reservation for ${req.body.customerId} at ${req.body.shopId}`);
    //console.log(req.body);

    var sql=`INSERT INTO reservation(salon_id,customer_id,payment_id,	total,date,start_time,duration,end_time,status,note) VALUES('${req.body.shopId}','${req.body.customerId}','${req.body.paymentId}','${req.body.total}','${req.body.year}-${req.body.month}-${req.body.day}','${req.body.startTime}','${req.body.duration}','11:00:00',0,'${req.body.note}')`;
    const row=await db.query(sql);     //sending the request
    console.log(row);
  
    res.send({status:"OK"});
    next();
  });

app.get('/tom', function (req, res) {
  console.log(req)
  res.send({name:'this is domiyan barath domiyan'})
});


//get shop details from database for main
app.get('/customerupcomingreservation',async(req,res,next)=>{
  console.log(`Getting reservation data for customer ${req.body.customerId} `);
  //const [rows]=await db.query("SELECT * FROM salon;");

  res.send({status:"OK"});
  next();
}
)


//get shop details from database for main
app.get('/shoplist',async(req,res,next)=>{
  console.log("getting shop details");
  const [rows]=await db.query("SELECT * FROM salon;");

  res.json(rows);
  next();
}
)

//get the availble time of a date fo the reservation
app.get('/availabletime',async(req,res,next)=>{
  var obj=JSON.parse(req.query.data);    //obj has all the values

  console.log(`getting avalable time for ${obj.shopId} at ${obj.day}/${obj.month}/${obj.year}`);    

  var sql=`SELECT end_time FROM reservation WHERE salon_id='${obj.shopId}' AND date='${obj.year}-${obj.month}-${obj.day}'`;
 // var sql=`SELECT end_time FROM reservation WHERE salon_id='ax3' AND date='2020-08-18'`;
  
  const [rows]=await db.query(sql);     //sending the request

  var len=rows.length;
  var availabletime;

  //this is getting the time 
  if(len>0)   //if there is a time 
  {
    var i;    //this is for loop
    var max;
    for(i=0;i<len;i++)
    {
      if(i==0)
      {
        max=rows[i].end_time;
      }
      else{
        if(rows[i].end_time>max)
        {
          max=rows[i].end_time;
        }
      }
      // console.log(max);
      // console.log(rows[0])
      
    }
    availabletime=max;    //setting the max finising time as a available time
    

  }
  else    //if their is no time in a day or previes reservation
  {
    var sql2=`SELECT open_time,is_open   FROM time WHERE salon_id='${obj.shopId}' AND day=${obj.week}`;
    const [row2]=await db.query(sql2);     //sending the request
    //console.log(row2[0].is_open);

    if(row2[0].is_open==1)
    {
      availabletime=row2[0].open_time;
    }
    else
    {
      availabletime=0;
    }
    
  }

  res.send({time:availabletime});
  next();
}
)






app.get('/servicelist',async(req,res,next)=>{
   var obj=JSON.parse(req.query.data);    //obj has all the values
   console.log(`getting shoplist for shop'${obj.shopId}'`);  
  var sql=`SELECT * FROM service WHERE salon_id='${obj.shopId}'`;
  
  const [rows]=await db.query(sql);

  res.json(rows);
  next();
}
)


// app.get('/getuser', async (req, res, next) => {

//   // const email = req.body.email;
//   // const password  = req.body.password;

//   const [rows] = await db.query("SELECT * FROM salon;");
  

//   //console.log(rows[0]);
//   res.json(rows);
//    next();
// });

// app.post('/t2',function(req,res){
//   let testing=req.body;
//   var querye = "INSERT INTO testdb (name,email,age) VALUES ('pruthi', 'pruthi@gmail.com',12)";
//   db.query(querye,function (err, result) {
//     if (err) throw err;
//         console.log(result.affectedRows + " record inserted");
//   });
// });

// app.post('/learners', (req, res) => {
//   let learner = req.body;
//   var sql = "INSERT INTO users (name) VALUES learner.name"; 
//  // CALL learnerAddOrEdit(@learner_id,@learner_name,@learner_email,@course_Id);";
//   db.query(sql, [learner.name], (err, rows, fields) => {
//   if (!err)
//   rows.forEach(element => {
//   if(element.constructor == Array)
//   res.send('New Learner ID : '+ element[0].id);
//   });
//   else
//   console.log(err);
//   })
//   });
async function main(){
  db = await mysql.createConnection({
    host:'localhost',
    user: 'root',
    password: '',
    database: 'groomar',
        
    // localAddress:'http://localhost:80'
    
   });

  db.connect((err)=> {
    
    if(!err)
    console.log('Connection Established Successfully');
    else
    console.log('Connection Failed!'+ JSON.stringify(err,undefined,2));
    });
    const port = process.env.PORT || 3000;
    app.listen(port, () => console.log(`Listening on port ${port}..`));

   


}

main();