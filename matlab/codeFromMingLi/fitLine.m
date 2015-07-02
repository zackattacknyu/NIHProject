function [m b] = fitLine(x, y)
    A = [];
    A = x;
    A1 = ones(size(x));
    A=[A;A1]
    res = pinv(A')*y';
    m = res(1);
    b = res(2);
end