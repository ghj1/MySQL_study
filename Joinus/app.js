var express = require('express');
var app = express();

app.get("/", function(req, res){
    res.send("You've Reached The Home Page!");
});

app.get("/joke", function(req, res){
    var joke = "What do you call a dog that does magic tricks? A labracadabrador. ";
    res.send(joke);
});

app.get("/random_num" ,function(req, res){
    var num = Math.floor(Math.Random() * 10) + 1;
    res.send("Your lucky number is" + num);
});

app.listen(5502, function(){
    console.log("Server running on 5501!");
});
