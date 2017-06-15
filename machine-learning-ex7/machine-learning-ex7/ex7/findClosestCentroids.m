function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);
no_X = size(X,1);
% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% for-loop version:
% for datapoint=1:size(X,1)
%     X_row = X(datapoint,:);
%     dist = norm(X_row-centroids(1,:));
%     idx(datapoint) = 1;
%     for i=2:K
%        if norm(X_row-centroids(i,:)) < dist
%            idx(datapoint) = i;
%            dist = norm(X_row-centroids(i,:));
%            %disp([datapoint,i])
%        end 
%     end 
% end


% vectorized version
A = zeros(no_X,K);
for i=1:K
    A(:,i)=sum((X - centroids(i,:)).^2, 2);
end
[M,idx] = min(A,[],2);



% =============================================================

end

