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

  res.send({status:"OK"});
  next();
});

app.get('/tom', function (req, res) {
  console.log(req)
  res.send({name:'this is domiyan barath domiyan'})
});


//get shop details from database for main
app.get('/shoplist',async(req,res,next)=>{
  console.log("getting shop details");
  const [rows]=await db.query("SELECT * FROM salon;");

  res.json(rows);
  next();
}
)


app.get('/servicelist',async(req,res,next)=>{
   var obj=JSON.parse(req.query.data);
  
  var sql=`SELECT * FROM service WHERE salon_id='${obj.shopId}'`;
  console.log(sql);
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