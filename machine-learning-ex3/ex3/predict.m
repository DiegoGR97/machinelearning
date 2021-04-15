function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)


% Useful values
fprintf('\nTraining examples: (One column of 1s will be added on forward propagation to make a1)\n');
size(X)
m = size(X, 1);
%m

fprintf('\nNetwork Parameter Theta 1, for a second layer of 25 units:\n');
size(Theta1)

fprintf('\nNetwork parameter Theta 2, for an output of 10 units/classes:\n');
size(Theta2)

fprintf('\nNetwork Parameter Theta 1 transposed:\n');
size(Theta1')



num_labels = size(Theta2, 1);
%num_labels

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%


a1 = [ones(m,1) X];
fprintf('\nDimensions of a1 = X with an additional column of ones:\n');
size(a1)

z2 = a1 *Theta1';
fprintf('\nDimensions of z2 = a1 *Theta1_Transposed:\n');
size(z2)

a2 = [ones(size(z2),1) sigmoid(z2)];
fprintf('\nDimensions of a2 = [ones(size(z2),1) sigmoid(z2)]:\n');
size(a2)

z3 = a2*Theta2';
fprintf('\nDimensions of z3 = a2*Theta2_Transposed:\n');
size(z3)

a3 = sigmoid(z3);
fprintf('\nDimensions of a3 = sigmoid(z3)]:\n');
size(a3)

fprintf('\n Matriz con valor maximo de las 10 columnas, y el indice de la columna con ese valor maximo: \n ');
[predict_max, index_max] = max(a3, [], 2);
size([predict_max, index_max])


p = index_max;





% =========================================================================


end
