var express = require('express');
var router = express.Router();

async function sleep(timeCount) {
  var p = new Promise(function (resolve, reject) {
      setTimeout(function () {
          resolve();
      }, timeCount)
  });
  await p;
}

/* GET users listing. */
//   /ticket/buy
router.get('/buy', function (req, res, next) {
  req.mysql.query("select * from concert where concertId = 1",
    [],
    function (err, data) {
      res.render("ticket", { count: data[0].count });
    })
});

router.post('/buy', async function (req, res, next) {
  req.mysql.query("select * from concert where concertId = 1",
    [],
    async function (err, data) {
      var count = data[0].count;
      count = count - 1;
      await sleep(3000);
      req.mysql.query("update concert set count = ? where concertId = 1",
        [count], function (err, data) {
          res.send("Ticket remain: " + count);
        })
    })
});

module.exports = router;
