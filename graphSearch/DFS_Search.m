function groups = DFS_Search(edgeList, traverse)
    root = traverse(length(traverse));
    start = traverse(length(traverse) - 1);
    groups = [];
    stack = [start]; %simulate a stack data structure, FILO, use 0 to denote different layer
    while true
        if ismember(root, groups) && mod(length(groups), 2) == 0
            groups = groups(1:length(groups)-1);
        end
        cur = stack(1);
        stack = stack(2:length(stack));
        groups = [groups cur];
        if (ismember(root, groups) && mod(length(groups), 2) == 1)
            break;
        end
        while cur == 0
            cur = stack(1);
            stack = stack(2:length(stack));
            groups = groups(1:length(groups)-1);
        end
        conn_nodes = edgeList{cur};
        flag = bitand(ismember(conn_nodes, traverse), ~ismember(conn_nodes, groups));
        if sum(flag) == 0
            groups = groups(1:length(groups)-1);
            continue;
        end
        ind = find(flag == 1);
        if isempty(stack)
             stack = [conn_nodes(ind)];
        else
            stack = [conn_nodes(ind) 0 stack];
        end
    end
end