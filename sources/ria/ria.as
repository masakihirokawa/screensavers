fscommand("showmenu", "false");
Stage.scaleMode = "noScale";
Stage.align = "TL";
_quality = "HIGH";

var sw:Number = Stage.width;
var sh:Number = Stage.height;
var c:Number = 0;
mID = setInterval(init, 3000);
function init() {
	if(c>0) {
		rscale = Math.random()*5+94;
		rrot = 137.5;
		attachMovie("nug","mothernug",0);
		mothernug._x = sw/2;
		mothernug._y = sh/2;
		mothernug._xscale = 150;
		mothernug._yscale = 150;
		mothernug._rotation = Math.random()*360;
		mothernug.depth = 0;
		mothernug.onEnterFrame = iterate;
	}
	c++;
}
function iterate() {
	if (this.depth<50) {
		var newnug:MovieClip = this.attachMovie("nug", "newnug", 1);
		var rot:Number = this._rotation+rrot;
		var scale:Number = rscale;
		newnug._x = (100-scale)*Math.cos(Math.PI/180*rot);
		newnug._y = (100-scale)*Math.sin(Math.PI/180*rot);
		newnug._xscale = scale;
		newnug._yscale = scale;
		newnug._rotation = rot;
		newnug.depth = this.depth+1;
		newnug.onEnterFrame = iterate;
	}
	delete this.onEnterFrame;
}
