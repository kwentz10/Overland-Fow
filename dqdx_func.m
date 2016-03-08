function [dqdx] = dqdx_func(dx,n,h,z)
%change of q over change in space

q = q_func(n,h,z,dx);
dqdx= (diff(q)/dx);

end

