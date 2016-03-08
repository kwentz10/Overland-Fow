function [ timearray, spacearray, zb, h, z ] = starting_conds(t_min, t_max, dt, x_min, x_max, dx, z_max, s, h0)
%setup intial overland flow conditions

timearray=t_min:dt:t_max;
spacearray=x_min:dx:x_max;
zb=z_max-s*(spacearray);
h=zeros(1,length(zb))+h0;
z=zb+h;

end

