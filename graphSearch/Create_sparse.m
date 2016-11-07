function m = Create_sparse(data, n)
    m = sparse(data(1,:), data(2,:), 1, n, n);
    m = m + m';
    m(m>1) = 1;
end