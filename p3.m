function p3()
    Qu = input('Enter a number:');
   [x, fs] = audioread('numbers-english.wav'); 
   [y, fs] = audioread('numbers-french.wav'); 
   [u, fs] = audioread('numbers-german.wav'); 
   z = 1;
   a = -1;
   k = 1;
   while z < numel(x)-.2*fs 
        j = 0;
        while 20*log10(abs(x(z+j))) < -30
              j = j + 1;
              if z + j == numel(x)
                   break;
              end
        end
        if j > .2*fs
             a = a + 1;
             if a == 1
                   h = [r : 1 : z];
                   h = h.*0;
                   for o = r : 1 : z
                       h(k) = x(o);
                       k = k + 1;
                   end
             end
              if a == 2
                   hO = [r : 1 : z];
                   hO = hO.*0;
                   for o = r : 1 : z
                       hO(k) = x(o);
                       k = k + 1;
                   end
              end
              if a == 3
                   hF = [r : 1 : z];
                   hF = hF.*0;
                   for o = r : 1 : z
                       hF(k) = x(o);
                       k = k + 1;
                   end
              end
              if a == 4
                   hT = [r : 1 : z];
                   hT = hT.*0;
                   for o = r : 1 : z
                       hT(k) = x(o);
                       k = k + 1;
                   end
              end
              if a == 5
                   hY = [r : 1 : z];
                   hY = hY.*0;
                   for o = r : 1 : z
                       hY(k) = x(o);
                       k = k + 1;
                   end
              end
              if a == 6
                   hS = [r : 1 : z];
                   hS = hS.*0;
                   for o = r : 1 : z
                       hS(k) = x(o);
                       k = k + 1;
                   end
              end
              if a == 7
                   hE = [r : 1 : z];
                   hE = hE.*0;
                   for o = r : 1 : z
                       hE(k) = x(o);
                       k = k + 1;
                   end
              end
              if a == 8
                   hW = [r : 1 : z];
                   hW = hW.*0;
                   for o = r : 1 : z
                       hW(k) = x(o);
                       k = k + 1;
                   end
              end
              if a == 9
                   hJ = [r : 1 : z];
                   hJ = hJ.*0;
                   for o = r : 1 : z
                       hJ(k) = x(o);
                       k = k + 1;
                   end
              end
              if a == 10
                   hZ = [r : 1 : z];
                   hZ = hZ.*0;
                   for o = r : 1 : z
                       hZ(k) = x(o);
                       k = k + 1;
                   end
             end
             r = z + j;
             z = z + j;
        else
             if j > 0
                  z = z + j;
             else
                  z = z + 1;
             end
        end        
   end 
   zO = 1;
   aO = -1;
   kO = 1;
   while zO < numel(y)-.2*fs 
        jO = 0;
        while 20*log10(abs(y(zO+jO))) < -30
              jO = jO + 1;
              if zO + jO == numel(y)
                   break;
              end
        end
        if jO > .2*fs
             aO = aO + 1;
             if aO == 1
                   hL = [rO : 1 : zO];
                   hL = hL.*0;
                   for o = rO : 1 : zO
                       hL(kO) = y(o);
                       kO = kO + 1;
                   end
             end
              if aO == 2
                   hOO = [rO : 1 : zO];
                   hOO = hOO.*0;
                   for o = rO : 1 : zO
                       hOO(kO) = y(o);
                       kO = kO + 1;
                   end
              end
              if aO == 3
                   hOF = [rO : 1 : zO];
                   hOF = hOF.*0;
                   for o = rO : 1 : zO
                       hOF(kO) = y(o);
                       kO = kO + 1;
                   end
              end
              if aO == 4
                   hOT = [rO : 1 : zO];
                   hOT = hOT.*0;
                   for o = rO : 1 : zO
                       hOT(kO) = y(o);
                       kO = kO + 1;
                   end
              end
              if aO == 5
                   hOY = [rO : 1 : zO];
                   hOY = hOY.*0;
                   for o = rO : 1 : zO
                       hOY(kO) = y(o);
                       kO = kO + 1;
                   end
              end
              if aO == 6
                   hOS = [rO : 1 : zO];
                   hOS = hOS.*0;
                   for o = rO : 1 : zO
                       hOS(kO) = y(o);
                       kO = kO + 1;
                   end
              end
              if aO == 7
                   hOE = [rO : 1 : zO];
                   hOE = hOE.*0;
                   for o = rO : 1 : zO
                       hOE(kO) = y(o);
                       kO = kO + 1;
                   end
              end
              if aO == 8
                   hOW = [rO : 1 : zO];
                   hOW = hOW.*0;
                   for o = rO : 1 : zO
                       hOW(kO) = y(o);
                       kO = kO + 1;
                   end
              end
              if aO == 9
                   hOjO = [rO : 1 : zO];
                   hOjO = hOjO.*0;
                   for o = rO : 1 : zO
                       hOjO(kO) = y(o);
                       kO = kO + 1;
                   end
              end
              if aO == 10
                   hOzO = [rO : 1 : zO];
                   hOzO = hOzO.*0;
                   for o = rO : 1 : zO
                       hOzO(kO) = y(o);
                       kO = kO + 1;
                   end
             end
             rO = zO + jO;
             zO = zO + jO;
        else
             if jO > 0
                  zO = zO + jO;
             else
                  zO = zO + 1;
             end
        end        
   end 
   ki = 1;
   ai = -1;
   uf = 1;
   while ki < numel(u)-.2*fs 
        xu = 0;
        while 20*log10(abs(u(ki+xu))) < -30
              xu = xu + 1;
              if ki + xu == numel(u)
                   break;
              end
        end
        if xu > .2*fs
             ai = ai + 1;
             if ai == 1
                   ui = [oP : 1 : ki];
                   ui = ui.*0;
                   for o = oP : 1 : ki
                       ui(uf) = u(o);
                       uf = uf + 1;
                   end
             end
              if ai == 2
                   uiO = [oP : 1 : ki];
                   uiO = uiO.*0;
                   for o = oP : 1 : ki
                       uiO(uf) = u(o);
                       uf = uf + 1;
                   end
              end
              if ai == 3
                   uiF = [oP : 1 : ki];
                   uiF = uiF.*0;
                   for o = oP : 1 : ki
                       uiF(uf) = u(o);
                       uf = uf + 1;
                   end
              end
              if ai == 4
                   uiT = [oP : 1 : ki];
                   uiT = uiT.*0;
                   for o = oP : 1 : ki
                       uiT(uf) = u(o);
                       uf = uf + 1;
                   end
              end
              if ai == 5
                   uiu = [oP : 1 : ki];
                   uiu = uiu.*0;
                   for o = oP : 1 : ki
                       uiu(uf) = u(o);
                       uf = uf + 1;
                   end
              end
              if ai == 6
                   uiS = [oP : 1 : ki];
                   uiS = uiS.*0;
                   for o = oP : 1 : ki
                       uiS(uf) = u(o);
                       uf = uf + 1;
                   end
              end
              if ai == 7
                   uiE = [oP : 1 : ki];
                   uiE = uiE.*0;
                   for o = oP : 1 : ki
                       uiE(uf) = u(o);
                       uf = uf + 1;
                   end
              end
              if ai == 8
                   uiW = [oP : 1 : ki];
                   uiW = uiW.*0;
                   for o = oP : 1 : ki
                       uiW(uf) = u(o);
                       uf = uf + 1;
                   end
              end
              if ai == 9
                   uixu = [oP : 1 : ki];
                   uixu = uixu.*0;
                   for o = oP : 1 : ki
                       uixu(uf) = u(o);
                       uf = uf + 1;
                   end
              end
              if ai == 10
                   uiki = [oP : 1 : ki];
                   uiki = uiki.*0;
                   for o = oP : 1 : ki
                       uiki(uf) = u(o);
                       uf = uf + 1;
                   end
             end
             oP = ki + xu;
             ki = ki + xu;
        else
             if xu > 0
                  ki = ki + xu;
             else
                  ki = ki + 1;
             end
        end        
   end 
   sOne = [1 : 1 : 1*fs];
   sOne = sOne.*0;
   one = [ h' ; sOne'; hL' ; sOne'; ui' ];
   two = [ hO' ; sOne'; hOO' ; sOne'; uiO' ];
   three = [ hF' ; sOne'; hOF' ; sOne'; uiF' ];
   four = [ hT' ; sOne'; hOT' ; sOne'; uiT' ];
   five = [ hY' ; sOne'; hOY' ; sOne'; uiu' ];
   six = [ hS' ; sOne'; hOS' ; sOne'; uiS' ];
   seven = [ hE' ; sOne'; hOE' ; sOne'; uiE' ];
   eight = [ hW' ; sOne'; hOW' ; sOne'; uiW' ];
   nine = [ hJ' ; sOne'; hOjO' ; sOne'; uixu' ];
   ten = [ hZ' ; sOne'; hOzO' ; sOne'; uiki' ];
   
   if Qu == 1
      soundsc(one,fs);
   end
   if Qu == 2
      soundsc(two,fs);
   end
   if Qu == 3
      soundsc(three,fs);
   end
   if Qu == 4
      soundsc(four,fs);
   end
   if Qu == 5
      soundsc(five,fs);
   end
   if Qu == 6
      soundsc(six,fs);
   end
   if Qu == 7
      soundsc(seven,fs);
   end
   if Qu == 8
      soundsc(eight,fs);
   end
   if Qu == 9
      soundsc(nine,fs);
   end
   if Qu == 10
      soundsc(ten,fs);
   end
   