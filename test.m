0;
function result = myResize(vector, newLength)
 out = 1:newLength;
 for i = 1:newLength
  out(i) = vector(i);
 endfor
 result = out;
endfunction

huhu = 1:0.5:10;

result = myResize(huhu, 5)