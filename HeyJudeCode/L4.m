x = midiInfo(readmidi('outThree.mid'));
fs = 44100;
notes = numel(x(:,1));
vector = zeros(round(x(notes,5)*fs*2), 1);
for i = 1 : 1 : notes
    a = zeros(round(x(i,5)*fs), 1);
    b = generate_note_two(midi2freq(x(i,3)), x(i,6)-x(i,5), fs, 0);
    a = [ a ; b ];
    for n = 1 : 1 : numel(a)
        vector(n) = vector(n) + a(n);
    end
end