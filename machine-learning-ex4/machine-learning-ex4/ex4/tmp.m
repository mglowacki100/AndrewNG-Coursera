load('ex4weights.mat');

% Unroll parameters 
nn_params = [Theta1(:) ; Theta2(:)];

load('ex4data1.mat');
m = size(X, 1);
X = [ones(m, 1) X];
num_labels = 10;

Y = zeros(m,num_labels); %one-hot encoding
for i=1:num_labels
    rows = (y == i);
    Y( rows, i ) = 1;
end


acc2 = zeros(size(Theta2)); 
acc1 = zeros(size(Theta1));

%%%%%%%%%
t=1
%for t=1:m 
% 1 
  a1 = X(t,:);
  z2 = a1*Theta1';
  a2 = sigmoid(z2);
  z3 = [1 a2]*Theta2';
  a3 = sigmoid(z3);
  %a3 = max(a3,[],2)
% 2
  d3 = a3 - Y(t) ;
% 3
  d2 = (d3 * Theta2) .* sigmoidGradient([1 z2]); % 1x10 * 10x26 .* 1x26 = 1x26
% 4  
  acc2 = acc2 + d3'*[1 a2]; % ok -Theta2
  d2 = d2(2:end) % 1x26 -> 1x25
  acc1 = acc1 + d2'*a1; % Theta1 25x401 = 25x1 * 1x401 
  
%end
% 5  
  D2 = 1/m * acc2;
  D1 = 1/m * acc1;




