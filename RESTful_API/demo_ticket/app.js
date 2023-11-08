var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var ticketRouter = require('./routes/ticket');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use(function (req, res, next) {
  var mysql = require("mysql");
  var conn = mysql.createConnection({
    host: "127.0.0.1",
    user: "root",
    password: "root",
    database: "ticketdb"
  });

  conn.connect();
  req.mysql = conn;
  req.mysql.queryAsync = function (cmd, params) {
    return new Promise(function (resolve, reject) {
      req.mysql.query(cmd, params, function (err, data) {
        resolve(data);
      })
    });
  }

  next();
})


app.use('/', indexRouter);
app.use('/ticket', ticketRouter);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
