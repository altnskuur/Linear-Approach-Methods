% A_matrix_35 = readmatrix("A_Data35.xlsx");
% b_vector_35 = readmatrix("B_Data35.xlsx");
% 
% %x_vector_35Cho = methods_function(A_matrix_35, b_vector_35, 1);
% x_vector_35GS = methods_function(A_matrix_35, b_vector_35, 2);
% x_vector_35CGM = methods_function(A_matrix_35, b_vector_35, 3);
% %%
% A_matrix_64 = readmatrix("A_Data51.xlsx");
% b_vector_64 = readmatrix("B_Data51.xlsx");
% 
% %x_vector_64Cho = methods_function(A_matrix_64, b_vector_64, 1);
% x_vector_64GS = methods_function(A_matrix_64, b_vector_64, 2);
% x_vector_64CGM = methods_function(A_matrix_64, b_vector_64, 3);
% %%
% A_matrix_200 = readmatrix("A_Data200.xlsx");
% b_vector_200 = readmatrix("B_Data200.xlsx");
% 
% %x_vector_200Cho = methods_function(A_matrix_200, b_vector_200, 1);
% x_vector_200GS = methods_function(A_matrix_200, b_vector_200, 2);
% x_vector_200CGM = methods_function(A_matrix_200, b_vector_200, 3);

A_matrix = [1 2 3; 1 2 2; 3 5 4];
b_vector = [1 2 5];
x_vector = methods_function(A_matrix, b_vector, 2);