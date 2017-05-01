function p = predict(theta, X)
%PREDICT Predict whether the label is 0 or 1 using learned logistic 
%regression parameters theta
%   p = PREDICT(theta, X) computes the predictions for X using a 
%   threshold at 0.5 (i.e., if sigmoid(theta'*x) >= 0.5, predict 1)

m = size(X, 1); % Number of training examples

% You need to return the following variables correctly
p = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters. 
%               You should set p to a vector of 0's and 1's
%
th = 0.5;
%calculate values for the sigma function
g = sigmoid(X*theta);
%find all the indices in the sigma function array
%that we are going to change based on threshold
down = find(g<th);
up = find(g>=th);
%change the indices in the p array
%we are assuming that the g and p arrays have the same size
p(up) = 1;
p(down) = 0;






% =========================================================================


end
