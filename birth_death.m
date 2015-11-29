function f = birth_death(p, k) 
    birth_rate = p;
    init_state = k;
    rep = 10000;
    n_jump = 100;
    
    fin_state = zeros(1, rep);
   
    for i = 1:rep
        r = unifrnd(0,1, 1, n_jump);
        state = init_state;
        for j = 1:n_jump
            if birth_rate >= r(j)
                state = state + 1;
            else
                if state == 0 
                    state = state;
                else
                    state = state - 1;
                end
            end
        end
        fin_state(1,i) = state;
    end
    unique_list = unique(fin_state);
    hist = zeros(1, max(unique_list)+1);
    for m = 0:max(unique_list)
        if ~ismember(m, unique_list)
            hist(m+1) = 0;
        else
            hist(m+1) = length(find(m == fin_state));
        end
    end
    possible_state = 0:max(unique_list);
    probablity = hist/sum(hist);
    [possible_state; probablity]
end