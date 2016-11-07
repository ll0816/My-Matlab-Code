function groups = Is_bipartite(filename)
    edgeList = Find_edge_list(filename);
    size = Size(filename);
    groups = NaN(1, size);
    traverse = [];
    ISODD = false;
    for i = 1:size
        if ISODD
            break;
        end
        if ~isnan(groups(i))
            continue;
        end
        queue = [i];
        groups(i) = 0;
        while ~isempty(queue)
            if ISODD
                break;
            end
            cur = queue(1);
            queue = queue(2:length(queue));
            traverse =[traverse cur];
            conn_nodes = edgeList{cur};
            if sum(isnan(groups(conn_nodes))) == 0
                if groups(cur) == 0
                    groups(conn_nodes) = 1;
                else
                    groups(conn_nodes) = 0;
                end
            else
                for j = 1:length(conn_nodes)
                    if isnan(groups(conn_nodes(j))) && groups(cur) == 0
                        groups(conn_nodes(j)) = 1;
                        queue = [queue conn_nodes(j)];
                    elseif isnan(groups(conn_nodes(j))) && groups(cur) == 1
                        groups(conn_nodes(j)) = 0;
                        queue = [queue conn_nodes(j)];
                    elseif ~isnan(groups(conn_nodes(j))) && groups(cur) ~= groups(conn_nodes(j))
                        continue;
                    else
                        ISODD = true;
                        traverse = [traverse conn_nodes(j)];
                        break;
                    end
                end
            end
        end
    end
    if sum(isnan(groups)) > 0
        groups = DFS_Search(edgeList, traverse);
        disp('not bipartite');
    else
        disp('bipartite');
    end
end