var koa = require('koa');
var app = koa();
var router = require('koa-router');
var request = require('koa-request');
var api = router();

api.get('/:vinnumber', function*(){
	var options = {
		url: 'https://api.edmunds.com/api/v1/vehicle/vin/' + this.params.vinnumber + '/configuration?api_key=cdkjvqtqc6w8ucn569q5cwjm',
			//headers: { 'User-Agent': 'request' }
	};
	var response = yield request(options); //Yay, HTTP requests with no callbacks!
	var info = JSON.parse(response.body);
	this.body = {Make: info.make.name, Model: info.model.name, Year: info.year};
});

app
  .use(api.routes())
  .use(api.allowedMethods());

app.listen(3000);