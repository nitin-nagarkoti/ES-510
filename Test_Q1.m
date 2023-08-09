A = [1 2 3; 2 5 1; 4 2 3];
b = A'
c = inv(A)
filename = 'iit-roorkee-logo.png'
[y,z]=imread(filename);
figure, imshow(y)
colormap(z)