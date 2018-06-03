$("#clientConnectButton").click();
$("#publishTopicInput").val("sid23_lab_2018");

setInterval(function(){ 

	var hour = getHourString();
	var date = getDateString();
	var humidity = getRandomValue(68,72); 
	var temperature = getRandomValue(19,21);
   
   $("#publishMessageInput").text('{"temperature":"' + temperature + '", "humidity": "' + humidity + '", "date": "' + date + '", "time": "' + hour + '"}');
   
   console.log($("#publishMessageInput").val());
   
   $("#publishButton").click();
   
},5000);

setInterval(function(){ 

	console.log("Reloading page...");
	location.reload();
   
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
	
	var randomNumber = Math.floor((Math.random()*(max-min+1)+min)*100)/100;

	if (Math.random() < 0.03) {
		randomNumber = randomNumber + 50;
	}

	if (Math.random() < 0.03) {
		randomNumber = null;
	}

	return randomNumber;
}
	