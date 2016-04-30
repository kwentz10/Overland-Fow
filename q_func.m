function [q] = q_func(n,h,z,dx)
%quantify mass water flux

h_avg = havg_func(h);
slope = slope_func(z,dx);
u=(1/n).*(h_avg.^(2/3)).*((abs(slope)).^(1/2));
q=u.*h_avg;
q=[0,q,q(end)]; %no water flux into the top, boundary condition

end

