var a:Number = 0;
var i:Number = 0;
var c:Number = 0;
var r:Number = 2;
var t:Number = 2;
var max:Number = 500;
onEnterFrame = function () {
	a++;
	i++;
	a>max ? c=0 : c++;
	var unit:MovieClip = attachMovie("unit", "unit"+a, i);
	unit._y = Math.cos(a)*(200-Math.sqrt(a)*30)+Math.cos(a)+(Stage.height/r);
	unit._x = Math.sin(a)*(100-Math.sqrt(a)*30)+Math.sin(a)+(Stage.width/r);
	eval("unit"+(c-max)).removeMovieClip();
	if (a>max/r) {
		a = i=0;
		r = randRange(1, 5);
		r == t ? r++ : r;
		t = r;
	}
};
function randRange(min:Number, max:Number):Number {
	var randomNum:Number = Math.floor(Math.random()*(max-min+1))+min;
	return randomNum;
}