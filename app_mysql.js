var mysql = require('mysql');

var connection = mysql.createConnection({
    host : 'localhost',
    user : 'root',
    password : '65673877a@',
    port : 3306,
    database  : 'join_us'

})

connection.connect();


// MySQL Node 패키지 사용하기 
// connection.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
//   if (error) throw error;
//   console.log('The solution is: ', results[0].solution);
// });

// var q = 'SELECT CURDATE()';

// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results);
// });

// connection.end();

// 다른 샘플 쿼리 이번에는 3개 선택하기 

// var q = 'SELECT CURDATE() AS time, CURDATE as date, NOW() as now';

// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results[0].time);
//   console.log(results[0].date);
//   console.log(results[0].now);
// });

// connection.end();

// 위와 대등한 SQL 쿼리 
// SELECT CURTIME() as time, CURDATE() as date, NOW() as now;

// 데이터베이스에서 모든 사용자 선택하기 
// var q = 'SELECT * FROM users';

// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results[1].email);
// });

// connection.end();

// 데이터베이스 사용자 수 세기
// var q = 'SELECT COUNT(*) AS total FROM users ';
// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results[0].total);
// });

// connection.end();

// INSERTING DATA 
var q = 'INSERT INTO users (email) VALUES("rusty_the_dog@gmal.com")';

connection.query(q, function(error, results, fields) {
  if (error) throw error; 
  console.log(results);
});

connection.end();

