function [] = test(z)
%test to see if -dqdx is negative, i.e. more is flowing out than in

f={'z out of range', 'model works!'};

if any(z>=50 | z<=0)
    disp(f(1))
end


if z<50 & z>0
    disp(f(2))
end

end
