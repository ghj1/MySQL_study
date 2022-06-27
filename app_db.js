var express = require('express');
var mysql = require('mysql');
var app = express();

var connection = mysql.createConnection({
    host : 'localhost',
    user : 'root',
    password : '9812@',
    database  : 'join_us'

});

// Find count of users in DB 
// Respond with that count 
app.get("/", function(req, res){
	var q= "SELECT COUNT(*) AS count FROM users";
	connection.query(q, function(error,results){
		if(error) throw error;
		var count = results[0].count;
		res.send("We have" + count + "users in our db");
	});
});
	

app.listen(3000, function(){
    console.log("Server running on 3000!");
});
