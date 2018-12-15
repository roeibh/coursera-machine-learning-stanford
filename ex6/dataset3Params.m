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

minError = intmax;
counter = 0; % counter to see which round we are
for i = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]
  for j = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]
    counter += 1 % no semicolon so we can see the result
    i % no semicolon so we can see the result
    j % no semicolon so we can see the result
    model= svmTrain(X, y, i, @(x1, x2) gaussianKernel(x1, x2, j));
    predictions = svmPredict(model, Xval);
    error_margin = mean(predictions != yval);
    if (error_margin < minError)
      C = i % no semicolon so we can see the result
      sigma = j % no semicolon so we can see the result
      minError = error_margin;
    endif
  endfor
endfor






% =========================================================================

end
