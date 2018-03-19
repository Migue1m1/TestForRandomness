function h = kolmogorovSmirnovTest
	load datos.txt;
	x = datos;

	x = sort(x);
	Z = (x-mean(x))/std(x);
	[hipotesis,p,k,c] = kstest(Z,[],.05,0);
	h = hipotesis;
end