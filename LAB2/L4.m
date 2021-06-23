function mix = L4()
[x, Fs] = audioread('flute_E5.wav');
[y, Fs] = audioread('piano_C5.wav');
[z, Fs] = audioread('violin_G5.wav');

a = numel(x);
b = numel(y);
c = numel(z);

minOne = 0;
minTwo = 0;
minThree = 0;


if(a > b & a > c)
    max = x;
else
    minOne = a;
end
    
if(b > a & b > c)
    max = y;
else
    minTwo = b;
end
    
if(c > b & c > a)
    max = z;
else
    minThree = c;
end
if minOne == a
    d = [ 1 : 1 : (numel(max)-numel(x))];
    d = d.*0;
    e = [ x ; d' ];
else
    e = x;
end
    
if minTwo == b
    f = [ 1 : 1 : (numel(max)-numel(y))];
    f = f.*0;
    g = [ y ; f' ];
else
    g = y;
end

if minThree == c
    h = [ 1 : 1 : (numel(max)-numel(z))];
    h = h.*0;
    i = [ z ; h' ];
else
    i = z;
end

n = i + g + e;

soundsc(n, Fs);
   L4 = 'L4.wav'
   audiowrite(L4, n , Fs)
end