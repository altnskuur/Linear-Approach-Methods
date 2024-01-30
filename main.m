% A_matrix_35 = readmatrix("A_Data35.xlsx");
% b_vector_35 = readmatrix("B_Data35.xlsx");
% 
% %methods_function(A_matrix_35, b_vector_35, 1);
% methods_function(A_matrix_35, b_vector_35, 2);
% methods_function(A_matrix_35, b_vector_35, 3);
% %%
% A_matrix_64 = readmatrix("A_Data51.xlsx");
% b_vector_64 = readmatrix("B_Data51.xlsx");
% 
% %methods_function(A_matrix_51, b_vector_51, 1);
% methods_function(A_matrix_64, b_vector_64, 2);
% methods_function(A_matrix_64, b_vector_64, 3);
% %%
% A_matrix_200 = readmatrix("A_Data200.xlsx");
% b_vector_200 = readmatrix("B_Data200.xlsx");

A_matrix = [8 2 3; 2 8 5; 3 5 8];
b_vector = [1; 2; 5];
x_vector = methods_function(A_matrix_35, b_vector_35, 3)

