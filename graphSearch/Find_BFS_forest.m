function forest = Find_BFS_forest(filename)
    edgeList = Find_edge_list(filename);
    size = Size(filename);
    visited = []; % show the nodes have been expanded
    forest = zeros(2, size);
    count = 0; % accumulator of total traverse nodes
    cur = nan; % pointer for current node to be expand
    queue = []; % queue for nodes going to be expand, FIFO
    iter = 1;
    % pop root into queue to start iteration
    while (count < size)
        if isempty(queue)
            while iter <= size
                if ~ismember(iter, visited)
                    queue = [queue iter];
                    visited = [visited iter];
                    count = count + 1;
                    forest(1, count) = iter;
                    forest(2, count) = 0;
                    iter = iter + 1;
                    break;
                end
                iter = iter + 1;
            end
        end
        cur = queue(1);
        queue = queue(2:length(queue));
        if ~isempty(edgeList{cur})
            conn_nodes = edgeList{cur};
            for k = 1:length(conn_nodes)
                if ~ismember(conn_nodes(k), visited)
                    count = count + 1;
                    queue = [queue conn_nodes(k)];
                    visited = [visited conn_nodes(k)];
                    forest(1,count) = conn_nodes(k);
                    forest(2, count) = cur;
                end
            end
        end
    end
end
