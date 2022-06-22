var mysql = require('mysql');
var faker = require('faker');

var connection = mysql.createConnection({
    host : 'localhost',
    user : 'root',
    password : '65673877a@',
    port : 3306,
    database  : 'join_us'

})

connection.connect();

// INSERTING DATA TAKE 2
// var person = {
//     email: faker.internet.email(),
//     created_at: faker.date.past()         
// };

// connection.query('INSERT INTO users SET ?', person, function(error, result) {
//  if (error) throw error;
//  console.log(result);
// });

// connection.end()

// console.log(faker.date.past());
//2021-08-14T16:15:02.817Z

// INSERTING LOST OF DATA
var data = [];

for(var i = 0; i < 500; i++){
    data.push([
        faker.internet.email(),
        faker.date.past()
    ])
    
}

// console.log(data);

var q = 'INSERT INTO users (email, created_at) VALUES ?';

connection.query(q, [data], function(err, result) {
  console.log(err);
  console.log(result);
});

connection.end()
