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