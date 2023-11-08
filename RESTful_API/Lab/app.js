var express = require("express");
var app = express();
app.listen(3000);
// 以 body-parser 模組協助 Express 解析表單與JSON資料
var bodyParser = require('body-parser');
app.use( bodyParser.json() );
app.use( bodyParser.urlencoded({extended: false}) );

// 以 express-session 管理狀態資訊
var session = require('express-session');
app.use(session({
    secret: 'secretKey',
    resave: false,
    saveUninitialized: true
}));


app.get('/', function (req, res) {
    var who = req.session.who || "Guest";
    res.render('index.ejs',{userName:who});
})

app.get('/login', function(req, res){
    res.render('login.ejs',{});
})

app.get('/logout', function(req, res){
    // req.session.who = "Guest";
    delete req.session.who;
    res.redirect("/");
})

app.post('/loginCheck',function(req,res){
    // res.render('index.ejs',{userName:req.body.who});
    req.session.who = req.body.who;
    // res.send('OK, Get '+req.session.who);
    res.redirect("/");
})




