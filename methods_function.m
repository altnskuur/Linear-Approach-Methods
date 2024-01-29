function x_vector = methods_function(A_matrix, b_vector, method_number)
    tic %time start
    %Ax=b parameters
    detA = det(A_matrix); %detA != 0 means linear independent system
    lengthB = length(b_vector);
    %AB_matrix = [A_matrix b_vector]; %ERROR
    x_vector = zeros(lengthB, 1); %initialize x matrix
    if(method_number < 1 || method_number > 3)
        message = 'Your method_number input parameter is not in [1,3] range.';
        error(message);
    end
    switch method_number
        case 1 %Cholesky Method
								L = zeros(lengthB, lengthB);
								sumofL = 0;
								for j = 1 : lengthB
    								 for i = j : lengthB
        					     if(i==j)
            					      for k = 1 : (j-1);
                						    sumofL = L(j,k)*L(j,k) + sumofL;
            						     end
            						 L(i,j) = sqrt(A_matrix(i,j) - sumofL);
        								 else
            									for k = 1 : (j-1)
                						    sumofL = L(i,k)*L(j,k);
                         end
                         L(i,j) = (A_matrix(i,j) - sumofL) / L(j,j);
                     end
                     sumofL = 0;
              		end
             	end
							 		
									L_T = L.'; %transpose of  matrix
									%L*y=b and L_T*x=y
									y_vector = zeros(lengthB, 1);
									sumofY = 0;
									for i = 1 : lengthB
    									for j = 1 : (i-1)
        								sumofY = L(i,j) * y_vector(j, 1) + sumofY;
    									end
    									y_vector(i) = (b_vector(i) - sumofY) / L(i, i);
    									sumofY = 0;
									end

									sumofX = 0;
									for j = 1: lengthB
    									j_T = lengthB - j + 1;
    									for i = (j_T+1) : lengthB
        								sumofX = L(i, j_T)*x_vector(i);
    									end
    									x_vector(j_T) = (b_vector(j_T) - sumofX) / L(j_T,j_T);
											sumofX = 0;
									end
        case 2 %Gauss Seidel Method
            sumofX = zeros(lengthB, 1);
            for iteration = 1 : 10 %CHANGE: iteration can be dynamic. if change percentage of result is under of a number, iteration can be stop.
                for t = 1 : lengthB
                    for k = 1 : lengthB
                        sumofX(t) = sumofX(t) + A_matrix(t, k) * x_vector(k);
                    end
                    x_vector(t) = (b_vector(t) + A_matrix(t, t) * x_vector(t) - sumofX(t)) / A_matrix(t, t);
                    sumofX(t) = 0;
                end
            end

        case 3 %CGM
            s = b_vector - A_matrix * x_vector;
            r = b_vector - A_matrix * x_vector;
            a = (s.' * r) / (s.' * A_matrix * s); %Warning: Matrix is singular, close to singular or badly scaled. Results may be inaccurate. RCOND = NaN.
            b = 0;
            x_vector = x_vector + a * s;
            for j = 1 : 13
                r = b_vector - A_matrix * x_vector;
                b = (r.' * A_matrix * s) / (s.' * A_matrix * s); %Warning: Matrix is singular, close to singular or badly scaled. Results may be inaccurate. RCOND = NaN.
                s = r + b * s;
                a = (s.' * r) / (s.' * A_matrix * s); %Warning: Matrix is singular, close to singular or badly scaled. Results may be inaccurate. RCOND = NaN.
                x_vector = x_vector + a * s; %out x_vector = [NaN NaN NaN; NaN NaN NaN; NaN NaN NaN]
            end
    end
    toc %time stop

end