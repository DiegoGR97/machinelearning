%% Machine Learning Online Class - Exercise 3 | Part 1: One-vs-all

%  Instructions
%  ------------
%
%  This file contains code that helps you get started on the
%  linear exercise. You will need to complete the following functions
%  in this exericse:
%
%     lrCostFunction.m (logistic regression cost function)
%     oneVsAll.m
%     predictOneVsAll.m
%     predict.m
%
%  For this exercise, you will not need to change any code in this file,
%  or any other files other than those mentioned above.
%

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this part of the exercise
input_layer_size  = 400;  % 20x20 Input Images of Digits
num_labels = 10;          % 10 labels, from 1 to 10
                          % (note that we have mapped "0" to label 10)

%% =========== Part 1: Loading and Visualizing Data =============
%  We start the exercise by first loading and visualizing the dataset.
%  You will be working with a dataset that contains handwritten digits.
%

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

load('ex3data1.mat'); % training data stored in arrays X, y
%X
m = size(X, 1);
m
sizex = size(X);
sizex
sizey = size(y);
sizey

% Randomly select 100 data points to display
rand_indices = randperm(m);
sel = X(rand_indices(1:100), :);
%sel

displayData(sel);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============ Part 2a: Vectorize Logistic Regression ============
%  In this part of the exercise, you will reuse your logistic regression
%  code from the last exercise. You task here is to make sure that your
%  regularized logistic regression implementation is vectorized. After
%  that, you will implement one-vs-all classification for the handwritten
%  digit dataset.
%

% Test case for lrCostFunction
fprintf('\nTesting lrCostFunction() with regularization. \n');

fprintf('\n4 valores de theta, desde Theta 0 hasta Theta 3. \n');

theta_t = [-2; -1; 1; 2];
theta_t
fprintf('\n4 valores de X, desde X 0 para Theta 0 hasta X 3 para Theta 3. \n');
fprintf('\nSon 5 training examples. Vamos a predecir un vector "y" de 5x1. \n');


X_t = [ones(5,1) reshape(1:15,5,3)/10];
X_t
y_t = ([1;0;1;0;1] >= 0.5);
y_t
lambda_t = 3;
[J grad] = lrCostFunction(theta_t, X_t, y_t, lambda_t);

fprintf('\nCost: %f\n', J);
fprintf('Expected cost: 2.534819\n');
fprintf('Gradients:\n');
fprintf(' %f \n', grad);
fprintf('Expected gradients:\n');
fprintf(' 0.146561\n -0.548558\n 0.724722\n 1.398003\n');

fprintf('Program paused. Press enter to continue.\n');
pause;
%% ============ Part 2b: One-vs-All Training ============
fprintf('\nTraining One-vs-All Logistic Regression...\n')

lambda = 0.1;
[all_theta] = oneVsAll(X, y, num_labels, lambda);

fprintf('\nMatrix thetha con todos los classifier parameters:\n')
%all_theta
fprintf('\nDimensiones matrix thetha con todos los classifier parameters:\n')
sizeAllThetaResult = size(all_theta);
sizeAllThetaResult
fprintf('\nA la anterior matriz se le llama "Multi-class Classifier".\n')


fprintf('\n Program paused. Press enter to continue.\n');
pause;


%% ================ Part 3: Predict for One-Vs-All ================
fprintf('\n ==== Part 3: Predict for One-Vs-All ==== \n');
fprintf('\n Dimensiones de training data matrix X: (Se le va a agregar una columna de unos)\n');
size(X)
fprintf('\n Dimensiones de Multi-class Classifier transpuesta:\n');

size(all_theta')
pred = predictOneVsAll(all_theta, X);

%Matriz de 5000 x 1 donde es 1 cuando se predijo bien, y 0 cuando no.
accuracy = (pred == y);
%accuracy

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

