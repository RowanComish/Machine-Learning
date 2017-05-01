function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

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
%creating vectors of ones to add the bias terms in order to match dimensions
o1 = ones(size(X,1),1);
%adding the bias factor to the matrix X
x1 = [o1 X];
%calculating the a2 values which will be fed into the next level
a2 = sigmoid(x1*Theta1');

%same thing as above except these are calculating the a3 values
o2 = ones(size(a2,1),1);
a2 = [o2 a2];
a3 = sigmoid(a2*Theta2');
%as a3 values are our final values, get the index of the max predictions
%this will be the highest probability
[w,p] = max(a3,[],2);










% =========================================================================


end
