function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% Subtracting the mean value of each feature from the dataset.
mu = mean(X);
X_norm = bsxfun(@minus, X, mu);
%X_norm

% Scaling each dimension so that they are in the same range.
sigma = std(X_norm);
X_norm = bsxfun(@rdivide, X_norm, sigma);
%X_norm


% ============================================================

end
