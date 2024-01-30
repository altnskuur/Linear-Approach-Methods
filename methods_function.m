function x_vector = methods_function(A_matrix, b_vector, method_number)
    tic %time start
    %Ax=b parameters
    lengthB = length(b_vector);
    x_vector = zeros(lengthB, 1); %initialize x matrix
    if(method_number < 1 || method_number > 3)
        message = 'Your method_number input parameter is not in [1,3] range.';
        error(message);
    end
    switch method_number
        case 1 %Cholesky Method
            symmetry_test = issymmetric(A_matrix);
            if 1 ~= symmetry_test
                message = 'Given A matrix is not symmetric. Cholesky Method cannot be used.';
                error(message);
            end
            L = zeros(lengthB, lengthB);
			sumofL = 0;
            for j = 1 : lengthB
                for i = j : lengthB
                    if(i==j)
            		    for k = 1 : (j-1)
                		    sumofL = L(j,k)*L(j,k) + sumofL;
            		    end
            		    L(i,j) = sqrt(A_matrix(i,j) - sumofL);
        			else
                        for k = 1 : (j-1)
                		    sumofL = L(i,k)*L(j,k) + sumofL;
                        end
                        L(i,j) = (A_matrix(i,j) - sumofL) / L(j,j);
                    end
                    sumofL = 0;
                end
            end				 		
            %L*L_T*x=b -> L_T*x=y and L*y=b
            %L*y=b 
            y_vector = zeros(lengthB, 1);
            sumofY = 0;
            for i = 1 : lengthB
                for j = 1 : (i-1)
                    sumofY = L(i,j) * y_vector(j) + sumofY;
                end
                y_vector(i) = (b_vector(i) - sumofY) / L(i, i);
                sumofY = 0;
            end

            %L_T*x=y
            L_T = L.'; %transpose of  matrix
            sumofX = 0;
            for j = 1: lengthB
                j_T = lengthB - j + 1;
                for i = (j_T+1) : lengthB
                    sumofX = L_T(i, j_T)*x_vector(i) + sumofX;
                end
    			x_vector(j_T) = (y_vector(j_T) - sumofX) / L_T(j_T,j_T);
				sumofX = 0;
            end
        case 2 %Gauss Seidel Method
            %check matrix is diagonally dominant matrix or not?
            sumofX = zeros(lengthB, 1);
            for iteration = 1 : 300 %CHANGE: iteration can be dynamic. if change percentage of result is under of a number, iteration can be stop.
                for t = 1 : lengthB
                    for k = 1 : lengthB
                        sumofX(t) = sumofX(t) + A_matrix(t, k) * x_vector(k);
                    end
                    x_vector(t) = (b_vector(t) + A_matrix(t, t) * x_vector(t) - sumofX(t)) / A_matrix(t, t);
                    sumofX(t) = 0;
                end
            end

        case 3 %CGM
            s = b_vector(:,1) - A_matrix * x_vector(:,1);
            a = (s.' * (b_vector - A_matrix * x_vector(:,1))) * pinv(s.' * A_matrix * s);
            x_vector(:,1) = x_vector(:,1) + a * s;
            for j = 1 : 150
                r = b_vector(:,1) - A_matrix * x_vector(:,1);
                B = (-r.' * A_matrix * r) * pinv(s.' * A_matrix * s);
                s = r + B * s;
                a = (s.' * (b_vector - A_matrix * x_vector(:,1))) * pinv(s.' * A_matrix * s); 
                x_vector(:,1) = x_vector(:,1) + a * s;
            end
    end
    toc %time stop
end