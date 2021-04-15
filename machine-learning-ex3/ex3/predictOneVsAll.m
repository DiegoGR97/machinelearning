function p = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 
%  p = PREDICTONEVSALL(all_theta, X) will return a vector of predictions
%  for each example in the matrix X. Note that X contains the examples in
%  rows. all_theta is a matrix where the i-th row is a trained logistic
%  regression theta vector for the i-th class. You should set p to a vector
%  of values from 1..K (e.g., p = [1; 3; 1; 2] predicts classes 1, 3, 1, 2
%  for 4 examples) 

m = size(X, 1);
% m = 5000
num_labels = size(all_theta, 1);
% num_labels = 10

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               You should set p to a vector of predictions (from 1 to
%               num_labels).
%
% Hint: This code can be done all vectorized using the max function.
%       In particular, the max function can also return the index of the 
%       max element, for more information see 'help max'. If your examples 
%       are in rows, then, you can use max(A, [], 2) to obtain the max 
%       for each row.
%       
X_all_theta = X*all_theta';
%X_all_theta
fprintf('\n Dimensiones de X * all_theta transpuesta:\n');
sizeX_all_theta = size(X_all_theta);
sizeX_all_theta


predict = sigmoid(X*all_theta');
fprintf('\n Dimensiones de sigmoid(X*all_theta_transpuesta):\n');
%predict
size(predict)

fprintf('\n La matriz de prediccion sigmoid(X*all_theta_transpuesta) presenta, para cada training example, una fila de 10 \n ');
fprintf('columnas que se predijeron, una por cada clase. La columna con valor mas alto, es la clase que se predijo.\n');


%Obtenemos una matriz de 5000 x 2 donde, para cada training example,
%obtenemos el valor maximo de las 10 columnas, y en cual de las 10 columnas se encuentra.
%De esta manera, podemos saber que clase fue la que se predijo.
fprintf('\n Matriz con valor maximo de las 10 columnas, y el indice de la columna con ese valor maximo: \n ');

[predict_max, index_max] = max(predict, [], 2);
%[predict_max, index_max]
size([predict_max, index_max])
%Exportamos una matriz de 5000 x 1 con todos los valores predichos.
p = index_max;







% =========================================================================


end
