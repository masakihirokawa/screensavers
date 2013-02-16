function duplicateObj() {
	max = 200;
	limit = 4;
	a++;
	i++;
	_root.attachMovie("unit","unit"+a,i);
	_root["unit"+a]._y = Math.cos(a)*(200-Math.sqrt(a)*30)+Math.cos(a)+Stage.height/2;
	_root["unit"+a]._x = Math.sin(a)*(200-Math.sqrt(a)*30)+Math.sin(a)+Stage.width/2;
	_root["unit"+a]._rotation = i/times*2;
	_root["unit"+a]._yscale = i/2;
	_root["unit"+a]._xscale = i/2;
	_root["unit"+(a-max)].removeMovieClip();
	if (a>max*times) {
		a = i=0;
		times<limit ? times++ : times=0;
		duplicateObj();
	}
}