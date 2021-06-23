function HW3L2 ()
 x = midiInfo(readmidi('out.mid'));
 x(:, 3) = x(:,3) + 3;
 midiTwo = matrix2midi(x);
 writemidi(midiTwo, 'outTwo.mid');