function x = generate_note_two( f, t, fs, N)                   
     ft = 1/fs;
     s = (0 : ft : t)'; 
     if N == 0
         x = sin(2*pi*f*s);
     else
         x = sin(2*pi*f*s);
         for i = 1 : 1 : N
             f = f*N;
             k = sin(2*pi*f*s)*(1/N);
             x =  x + k ;
         end
     end
     env = (0 : 1/(.25*fs) : 1);
     a = numel(x) - .25*fs;
     envO = ones(1, a-1);
     envF = [ env' ; envO' ];
     x = envF .* x;
     envT = (1 : 1/(.25*fs)*-1 : 0);
     envB = [ envO' ; envT' ];
     x = envB .* x;
