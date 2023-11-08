var express = require("express");
const { get } = require("http");
var app = express();
var host = '127.0.0.1';
var port = 3000;

app.listen(port, host);
app.use(express.static("./public"));

app.get("/C8763/:star",function(req,res){
    res.send("C8763"+req.params.star);
})

app.get("/C8763/:min/:max",function(req,res){
    res.send(`C8763 from ${req.params.min} to ${req.params.max} hit`)
})