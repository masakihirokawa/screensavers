fscommand("showmenu", "false");
Stage.scaleMode = "noScale";
_quality = "HIGH";
var sw:Number = Stage.width;
var sh:Number = Stage.height;
var interval:Number = 1000;
var scl:Number = 20;
var as:Number = 10;
var generate:Number = 120;
var randmax:Number = 6;
var loopmax:Number = 50;
var dead:Number = 15;
var depth:Number = 0;
var n:Number = 0;
var v:Number = 0;
var theta:Number = 0;
var v:Number = 0;
var rot:Number;
var intervalID = setInterval(makenew, interval);
onEnterFrame = function () {
	init();
	setVariables();
};
function init() {
	if (Math.random()<.4 && n<5) {
		makenew();
	}
}
function setVariables() {
	rot = -30*Math.sin(Math.PI/180*theta);
	theta += v;
	v += Math.random()*3-1.5;
	v = Math.max(v, -5);
	v = Math.min(v, 5);
}
function makenew() {
	var newmc:MovieClip = attachMovie("nug", "newmc"+n, n++);
	newmc._x = randRange(0, randmax)*sw/6;
	newmc._y = randRange(0, randmax)*sh/6;
	newmc._xscale = scl;
	newmc._yscale = scl;
	newmc._rotation = 180;
	newmc.depth = depth;
	newmc.frame = 0;
	if (Math.random()>.1) {
		newmc.icon.petal._visible = false;
	}
	newmc.onEnterFrame = iterate;
	n<loopmax ? deleter("newmc", n) : n=0;
}
function iterate() {
	if (this.depth<generate) {
		var newnug:MovieClip = this.attachMovie("nug", "newnug", 2);
		newnug._y = -100;
		newnug._xscale = 98.7;
		newnug._yscale = 98.7;
		newnug._rotation = rot+Math.random()*10-5;
		newnug.depth = this.depth+1;
		newnug.frame = 0;
		if (Math.random()>.1) {
			newnug.icon.petal._visible = false;
		}
		newnug.onEnterFrame = iterate;
		delete this.onEnterFrame;
	}
}
function deleter(obj:String, id:Number) {
	eval(obj+(id-dead)).onEnterFrame = function() {
		this._alpha>0 ? this._alpha -= as : this.removeMovieClip();
	};
}
function randRange(min:Number, max:Number):Number {
	var randomNum:Number = Math.floor(Math.random()*(max-min+1))+min;
	return randomNum;
}
resizeListener = new Object();
resizeListener.onResize = function() {
	sw = Stage.width;
	sh = Stage.height;
};
Stage.addListener(resizeListener);
resizeListener.onResize();
stop();