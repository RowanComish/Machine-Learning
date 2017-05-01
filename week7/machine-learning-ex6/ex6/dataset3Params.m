function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%set of values to determine best numbers
Cvals = [0.01;0.03;0.1;0.3;1;3;10;30];
sigmaVals = [0.01;0.03;0.1;0.3;1;3;10;30];
m = size(Cvals)(1);

%set up initial values
model = svmTrain(X, y, Cvals(1), @(X, y) gaussianKernel(X, y, sigmaVals(1)));
predictions = svmPredict(model, Xval);
preError = mean(double(predictions ~= yval));
min = preError; 
C = Cvals(1);
sigma = sigmaVals(1);

%loop over all possible combinations for values of C and sigma
for i = 2:m
  for j = 2:m
    model = svmTrain(X, y, Cvals(i), @(X, y) gaussianKernel(X, y, sigmaVals(j)));
    predictions = svmPredict(model, Xval);
    preError = mean(double(predictions ~= yval));
    if preError < min
      fprintf('changing min ...\n')
      min = preError
      C = Cvals(i)
      sigma = sigmaVals(j)
     end
  end
end
     
C
sigma




% =========================================================================

end
