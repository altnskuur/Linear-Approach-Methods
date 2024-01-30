A_matrix_35 = randi([0, 15], [35,35]);
b_vector_35 = randi([0, 15], [35,1]);
for i = 1:35
    A_matrix_35(i,i) = 20;
end

A_matrix = [8 2 3; 2 8 5; 3 5 8];
b_vector = [1; 2; 5];
x_vector = methods_function(A_matrix_35, b_vector_35, 3)

