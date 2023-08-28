% sum all output values for n =1,2,3
for  n = 1:3
    x(n) = 2*n^2+n+1;
    sum(x);
    disp(x)
    disp(sum(x))
end

% sum all output values for n =1,2,3
Y=0;
for  n = 1:3
    x = 2*n^2+n+1;
    Y = Y+x;
end
disp(Y)

% Disp number greater than 3
for  n = 1:5
    if (n >3)
        disp(n)
    end
end