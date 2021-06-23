N = 21;  % number of notes
tempo = 60/74;
Notes = zeros(N,8);
score_melody = [ 72 1 0; 69 1 1; 0 1 2 ; 0 .5 3; 69 .5 3.5; 72 .5 4; 74 .5 4.5; 67 2 5; 0 1 7; 67 .5 8; 69 .5 8.5; 70 1 9; 77 1.5 10; 77 .5 11.5; 76 .5 12; 72 .5 12.5; 74 .5 13; 72 .25 13.5; 70 .25 13.75; 69 2 14; 0 1 16 ];
Notes(:,1) = 1;             % track 1
Notes(:,2) = 0;             % channel 1
Notes(:,3) = score_melody(:,1);      % note numbers: chromatic scale starting at middle C (60)
Notes(:,4) = 127;           % FULL VOLUME
Notes(:,5) = score_melody(:,3);       % note on:  note 1 second apart
Notes(:,6) = Notes(:,5) + score_melody(:,2);    % note off: duration 1 second

orig_time = Notes(:,5);
for i = 1 : length(orig_time)
    Notes(i, 5) = Notes(i,5) * tempo;
    Notes(i, 6) = Notes(i,6) * tempo;
end

Ntwo = 76;  % number of notes
NotesTwo = zeros(Ntwo,8);
score_accom = [ 0 1 0; 65 1 1; 50 1 1; 57 1 1; 65 1 2; 50 1 2; 57 1 2; 65 1 3; 50 1 3; 57 1 3; 65 1 4; 50 1 4; 57 1 4; 60 1 5; 55 1 5; 52 1 5; 60 1 6; 55 1 6; 52 1 6; 60 1 7; 55 1 7; 52 1 7; 60 .5 8; 55 .5 8; 52 .5 8; 60 .5 8.5; 57 .5 8.5; 53 .5 8.5; 60 1 9; 58 1 9; 55 1 9; 65 1 10; 58 1 10; 55 1 10; 65 1 11; 58 1 11; 55 1 11; 65 1 12; 58 1 12; 55 1 12; 65 1 13; 60 1 13; 57 1 13; 65 1 14; 60 1 14; 57 1 14; 65 1 15; 60 1 15; 57 1 15; 65 1 16; 60 1 16; 57 1 16; 0 1 0; 0 .5 1; 31 4 1; 41 1 1.5; 41 1 2.5; 41 1 3.5; 41 .5 4.5;  0 .5 5; 38 4 5; 48 1 5.5; 48 1 6.5; 48 1 7.5; 48 .5 8.5; 0 .5 9; 38 4 9; 48 1 9.5; 48 1 10.5; 48 1 11.5; 48 .5 12.5; 0 .5 13; 31 4 13; 41 1 13.5; 41 1 14.5; 41 1.5 15.5 ]; 
NotesTwo(:,1) = 1;             % track 1
NotesTwo(:,2) = 0;             % channel 1
NotesTwo(:,3) = score_accom(:,1);      % note numbers: chromatic scale starting at middle C (60)
NotesTwo(:,4) = 127;           % FULL VOLUME
NotesTwo(:,5) = score_accom(:,3);       % note on:  note 1 second apart
NotesTwo(:,6) = NotesTwo(:,5) + score_accom(:,2); 

orig_timeO = NotesTwo(:,5);
for i = 1 : length(orig_timeO)
    NotesTwo(i, 5) = NotesTwo(i,5) * tempo;
    NotesTwo(i, 6) = NotesTwo(i,6) * tempo;
end

Notes = [Notes ; NotesTwo];
midi = matrix2midi(Notes);
[y,Fs] = midi2audio(midi);    
soundsc(y, Fs);
writemidi(midi, 'out.mid');

