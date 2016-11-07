function m = Find_adj_matrix(filename) 
    [data, n] = Load_txt(filename);
    m = Create_sparse(data, n);
end
