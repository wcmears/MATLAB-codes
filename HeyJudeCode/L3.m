function HW3L3 ()
 x = midiInfo(readmidi('out.mid'));
 
 orig_time = x(:,5);
 for i = 1 : length(orig_time)
     x(i, 5) = x(i,5) * (4/3);
     x(i, 6) = x(i,6) * (4/3);
 end
 
 thr = 67;
 for i = 1 : 1 : numel(x(:,3))
     if x(i,3) > 0
         x(i,3) = x(i,3)-1;
     end
     if x(i,3) < thr
         x(i,4) = x(i,4)*.75;
     end
 end