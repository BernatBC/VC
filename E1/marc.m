function [J] = marc(I, N, ndg)
J= uint8(zeros(2*N + size(I)));
J(:,:) = ndg;
J(N:(N + size(I, 1) - 1), N:(N + size(I, 2) - 1)) = I(:,:);
end