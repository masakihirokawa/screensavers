var a:Number = 0;
var i:Number = 0;
var r:Number = 1;
var t:Number = 1;
var rmin:Number = 1500;
var rmax:Number = 2500;
var max:Number = randRange(rmin, rmax);
onEnterFrame = function () {
	a++;
	i++;
	a>max ? c=0 : c++;
	var unit:MovieClip = attachMovie("unit", "unit"+a, i);
	unit._y = Math.sin(i)*Stage.height/r;
	unit._x = Math.cos(i)*(Stage.width/r)+(Stage.width/4);
	unit._xscale = i/100;
	unit._yscale = Math.tan(i);
	unit._rotation = i/20;
	eval("unit"+(c-max)).removeMovieClip();
	if (a>max/r) {
		a = i=0;
		max = randRange(rmin*2, rmax*2);
		r = randRange(1, 4);
		r == t ? r++ : r;
		t = r;
	}
};
function randRange(min:Number, max:Number):Number {
	var randomNum:Number = Math.floor(Math.random()*(max-min+1))+min;
	return randomNum;
}