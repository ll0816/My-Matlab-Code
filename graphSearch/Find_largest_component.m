function comp = Find_largest_component(filename)
    forest = Find_BFS_forest(filename);
    roots = forest(1,:);
    parents = forest(2,:);
    parents = [parents 0];
    flag = (parents == 0);
    if sum(flag) == 2
        comp = roots;
    else
        ind = find(flag == 1);
        comp = [];
        for i = 2:length(ind)
            if (ind(i) - ind(i - 1)) > length(comp)
               comp = roots(ind(i - 1) : ind(i) - 1); 
            end
        end
    end
    comp = sort(comp);
end