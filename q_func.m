function [q] = q_func(n,h,z,dx)
%quantify mass water flux

h_avg = havg_func(h);
slope = slope_func(z,dx);
u=(1/n).*(h_avg.^(2/3)).*((abs(slope)).^(1/2));
q=u.*h_avg;
q=[q(1),q,q(end)];

end

