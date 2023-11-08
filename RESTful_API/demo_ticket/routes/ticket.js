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
router.get('/buy', async function (req, res, next) {
  var data = await req.mysql.queryAsync("select * from concert where concertId = 1", []);
  res.render("ticket", { count: data[0].count });
});

router.post('/buy', async function (req, res, next) {
  await req.mysql.queryAsync("start transaction", []);
  var data = await req.mysql.queryAsync("select * from concert where concertId = 1 for update", []);
  var count = data[0].count;
  count -= 1;
  await sleep(10000);
  await req.mysql.queryAsync(
    "update concert set count = ? where concertId = 1",
    [count]);
  await req.mysql.queryAsync("commit", []);
  res.send("Ticket remain: " + count);
});

module.exports = router;
