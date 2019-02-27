function [y, z] = vectorblock(x, m, k) 

% VECTORBLOCK Makes data vector into (possibly overlapping) blocks 
% y = block(x, m, k) blocks vector x into columns of length m 
% each offset by k from previous column. Z returns the unused 
% elements of x (ie. residual). 
% Ola Fredin, 2005-12-14; ola.fredin@ngu.no

[U,V] = meshgrid(1:k:length(x)-m+1, 1:m); 
x = x(:); 
y = x(U+V-1); 
z = x(U(end)+V(end):end); 

