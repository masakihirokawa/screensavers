var a:Number = 0;
var i:Number = 0;
var c:Number = 0;
var r:Number = 1;
var t:Number = 1;
var max:Number = 700;
onEnterFrame = function () {
	a++;
	i++;
	a>max ? c=0 : c++;
	var unit:MovieClip = attachMovie("unit", "unit"+a, i);
	unit._y = Math.sin(i)*(Stage.height/r);
	unit._x = Math.cos(i)*(Stage.width/r);
	unit._rotation = Math.sin(i)*600;
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