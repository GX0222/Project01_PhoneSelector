// 以 Express 建立 Web 伺服器
var express = require("express");
var app = express();

// 以 body-parser 模組協助 Express 解析表單與JSON資料
var bodyParser = require('body-parser');
app.use( bodyParser.json() );
app.use( bodyParser.urlencoded({extended: false}) );

// Web 伺服器的靜態檔案置於 public 資料夾
app.use( express.static( "public" ) );

// 以 express-session 管理狀態資訊
var session = require('express-session');
app.use(session({
    secret: 'secretKey',
    resave: false,
    saveUninitialized: true
}));

// 指定 esj 為 Express 的畫面處理引擎
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);
app.set('views', __dirname + '/view');

// 一切就緒，開始接受用戶端連線
app.listen(8000);
console.log("Web伺服器就緒，開始接受用戶端連線.");
console.log("「Ctrl + C」可結束伺服器程式.");

// 連接資料庫
var mysql = require("mysql");
var connection = mysql.createConnection({
    user: 'root',
    password: 'root',
    host: 'localhost',    // 127.0.0.1
    port: 3306,
    database: 'labdb'
})

connection.connect(function(info){
    console.log(info);
})

app.get('/home/news',function(req,res){
    // connection.query('aql', [params],function);
    connection.query('select * from news', 
    [], 
    function(err,result){
        if(err){
            res.send(JSON.stringify(err));
        }
        else{
            res.send(JSON.stringify(result));
        }
        
    })
})

app.get('/home/news/:id',function(req,res){
    // connection.query('aql', [params],function);
    connection.query('select * from news where newsid=?', 
    [req.params.id], 
    function(err,result){
        if(err){
            res.send(JSON.stringify(err));
        }
        else if (result.length <= 0){
            console.log('nope');
            console.log(result.length);
        }
        else{
            res.send(JSON.stringify(result));
        }
        
    })
})


app.post('/home/news',function(req,res){
    connection.query(
        'insert into news (title, ymd) values (?, ?)',
        [req.body.title, req.body.ymd],
        function (err,result) {
            console.log(result);
            res.send('ok, row(s) inserted');
        }
    )
})

app.put('/home/news',function(req,res){
    connection.query(
        'update news set title = ?, ymd = ? where newsId = ?',
        [
            req.body.title,
            req.body.ymd,
            req.body.newsId
        ],
        function(err,result) {
            console.log('updated')
        }
    );
    res.send('row update');
})

app.delete('/home/news',function(req,res){
    connection.query(
        'delete from news where newsId = ?',
        [req.body.newsId]
    );
    res.send('row deleted');
})



// =====================================================

// 範例：
// var mysql = require('mysql');
// var connection = mysql.createConnection({
// 	host : '127.0.0.1',
// 	user : 'root',
// 	password : 'root',
// 	database : 'labDB'
// });

// connection.connect(function(err) {
// 	// if (err) throw err;
// 	if (err) {
// 		console.log(JSON.stringify(err));
// 		return;
// 	}
// });

// app.get("/home/news", function (request, response) {

// 	connection.query('select * from news', 
// 		'',
// 		function(err, rows) {
// 			if (err)	{
// 				console.log(JSON.stringify(err));
// 				return;
// 			}
			
// 			response.send(JSON.stringify(rows));
// 		}
// 	);
    
// })