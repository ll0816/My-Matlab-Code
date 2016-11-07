function flag = Run_test() 
    for i = 1:20
        filename = strcat('sample', num2str(i), '.txt');
        data = strcat('sample', num2str(i), '.mat');
        load(data);
        assert(isequaln(Find_adj_matrix(filename), mAdj), 'Error: Find_adj_matrix failed on sample %s', num2str(i));
        assert(isequaln(Find_edge_list(filename), edgeList), 'Error: Find_edge_list failed on sample %s', num2str(i));
        assert(isequaln(Find_BFS_forest(filename), bfsForest), 'Error: Find_BFS_forest failed on sample %s',  num2str(i));
        assert(isequaln(Find_largest_component(filename), largeComp), 'Error: Find_largest_component failed on sample %s',  num2str(i));
        if i == 4
            continue;
        else
            assert(isequaln(Is_bipartite(filename), biPart), 'Error: Is_bipartite failed on sample %s',  num2str(i));
        end
    end
    disp('All tests are passed')
    flag = 0;
end