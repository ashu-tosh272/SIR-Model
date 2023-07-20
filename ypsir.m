function ypsir =ypsir(t,y)
a = 0.2550 ;%b value obtained from main code
b = 0.1160 ;%k value obtained from main code
ypsir(1) =-a*y(1)*y(2);
ypsir(2) = a*y(1)*y(2)-b*y(2);
ypsir(3) = b*y(2);
ypsir = [ypsir(1) ypsir(2) ypsir(3)]';
