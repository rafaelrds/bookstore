const express = require('express');
const app = express();
const bodyParser = require('body-parser');

app.use(express.static(__dirname+'/client'));
app.use(bodyParser.json());

app.get('/', (req, res) => {
	res.send('Please use /api/books or /api/genres');
});


var server = app.listen(3000);
console.log('Running on port 3000...');

var mysql = require('mysql');
var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: 'defaultpassword',
	database: 'bookstore'
});


connection.connect();
console.log("Conected to MySQL...");

app.get('/api/genres', (req, res) => {
	connection.query('SELECT * FROM genre', function(err,results) {
		if(err) throw err;
		res.json(results);

	})
	
});

app.post('/api/genres', (req, res) => {
	var genre = req.body;
	connection.query('INSERT INTO genre (name) VALUES (?)', [genre.name], function(err, result) {
	res.json(result);
	})
});





