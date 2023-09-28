function [] = q8()
    flags = {[1, 'Fat'] , [0, 'Thin']};

    for i = 1:length(flags) 
        tuple = flags{i};
        fatFlag = tuple(1);
        type = tuple(2:end);
        lambda = 0.01;
        conts = 0:0.02:1;
    
        figure;
    
        iter_arr=   {[1 , "r"], [5,"g"] ,[10,"b"] ,[100,"k"]} ;
        for j = 1:length(iter_arr)
            tuple2 = iter_arr{j};
            num_iterations = str2num(tuple2(1));
            color = tuple2(2);
            res_x = [];
            res_y = [];
    
            for cont = conts
                [rhomb1, rhomb2] = rhombusMovie(fatFlag, cont);        
                v = Full_LK_alg(rhomb1, rhomb2, lambda, ones(size(rhomb1)), num_iterations);
                res_x = [res_x v(1)];
                res_y = [res_y v(2)];        
            end
    
            plot(conts, res_x, color, 'Marker', '*', 'MarkerSize', 3, 'LineStyle', '--');
            hold on;
            plot(conts, res_y, color, 'Marker', '^', 'MarkerSize', 3);    
            
            % Label axis
           
            title(['Velocity per Contrast per # Iterations Rhombus:', type]);
            
            xlabel('Contrast');
            ylabel('Estimated Velocity');
            
            legend('v_x, 1 iterations', 'v_y, 1 iterations', ...
                    'v_x, 5 iterations', 'v_y, 5 iterations', ...
                    'v_x, 10 iterations', 'v_y, 10 iterations', ...
                    'v_x, 100 iterations', 'v_y, 100 iterations');
        end
    end
end