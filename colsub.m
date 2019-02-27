function [B] = colsub(A)

%% function colsub

% Columnwise subtraction in a matrix
% Ola Fredin 2009-04-15; ola.fredin@ngu.no

[m,n] = size(A);

for j=2:n,
    B(:,j) = A(:,j) - A(:,j-1);
end
