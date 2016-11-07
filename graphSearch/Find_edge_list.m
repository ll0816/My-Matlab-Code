function edges = Find_edge_list(filename)
    [data, n] = Load_txt(filename);
    m = Create_sparse(data, n);
    edges = cell(n, 1);
    [i, j, k] = find(m);
    for v = 1:length(i)
        tmp = edges{i(v)};
        edges{i(v)} = [tmp j(v)];
    end
    flag = cellfun(@(x) isempty(x), edges);
    edges(flag) = {zeros(1, 0)};
end