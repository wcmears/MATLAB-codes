function p2()
   [x, fs] = audioread('remove_silence_test.wav'); 
   z = 1;
   while z < numel(x) 
        j = 0;
            while 20*log10(abs(x(z+j))) < -30
                 j = j + 1;
                 if z + j == numel(x)
                      x = [x(1:z); x(z+j:end)];
                      break;
                 end
            end
            if j > .2*fs
                x = [x(1:z); x(z+j:end)];
                z = z + j;
            else
                if j > 0
                    z = z + j;
                else
                    z = z + 1;
                end
            end
   end
   audiowrite('out.wav', x, fs)

