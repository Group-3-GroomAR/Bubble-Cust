var express=require("express")
var cors= require("cors")
var bodyParser = require("body-parser")
var app=express()
var port=process.env.port || 3000

app.use(bodyParser.json())
app.use(cors())
app.use(
    bodyParser.urlencoded({extended:false})
)

var Users = require("./routes/Users")

app.use("/users",Users)

Users.post('/ishu',(req,res)=>{
    console.log("mudiyala");
})

app.listen(port,function(){
    console.log("Server is running on port"+ port)
})