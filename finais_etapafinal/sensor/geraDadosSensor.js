$("#clientConnectButton").click();
$("#publishTopicInput").val("sid23_lab_2018");

setInterval(function(){ 

	var hour = getHourString();
	var date = getDateString();
	var humidity = getRandomValue(69.5,70.5); 
	var temperature = getRandomValue(19.5,20.5);
   
   $("#publishMessageInput").text('{"temperature":"' + temperature + '", "humidity": "' + humidity + '", "date": "' + date + '", "time": "' + hour + '"}');
   
   $("#publishButton").click();
   
},5000);

setInterval(function(){ 

	console.log("Reloading page...");
	location.reload();
	console.log("Page reloaded");
   
},300000);

function addZero(i) {
    if (i < 10) {
        i = "0" + i;
    }
    return i;
}

function getHourString() {
    var date = new Date();
	
    var h = addZero(date.getHours());
    var m = addZero(date.getMinutes());
    var s = addZero(date.getSeconds());
	
	return h + ":" + m + ":" + s;
}

function getDateString() {
    var date = new Date();
	
    var d = addZero(date.getDate());
    var m = addZero(date.getMonth()+1);
    var a = addZero(date.getFullYear());
	
	return d + "/" + m + "/" + a;
}

function getRandomValue(min, max) {
	
	var randomNumber = Math.floor((Math.random()*(max-min)+min)*100)/100;

	if (Math.random() < 0.005) {
		randomNumber = randomNumber + 50;
	}

	if (Math.random() < 0.03) {
		randomNumber = null;
	}

	return randomNumber;
}
	