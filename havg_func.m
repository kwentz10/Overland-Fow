function [h_avg] = havg_func(h)
%create average of h for q flux

h_avg=(h(1:end-1)+h(2:end))/2;

end

