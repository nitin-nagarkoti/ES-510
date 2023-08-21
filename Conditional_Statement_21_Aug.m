val = rand(1,1);
if (val>0.5)
    d =val*0.5
    fprintf('val*0.5 = %.2f\n',d)
 else
d= val/0.5
fprintf('val/0.5 = %.2f\n',d)
end

mat = rand(2)
if (mat>0.5)
    d = [mat].*0.5
     fprintf('mat*0.5 = %.2f\n',[d])
else
     d = [mat]./0.5
     fprintf('mat*0.5 = %.2f\n',[d])
end
 
a = 5;
b = 6;
if ((a>b)||(a == 5))
    c =  2*a+b;
    fprintf('c= %.2f\n',c)
else
     c =  a+2*b;
      fprintf('c= %.2f\n',c)
end


rating = randi([0,10],1,1)
if (rating<=3)
      disp("poor")
elseif(5<=rating<=3)
      disp("average")
elseif(8<=rating<=5)
      disp("good")
else 
      disp("excelent")
end