function B = PR_Inv(A)
  % The function that calculates the inverse of matrix A using Gram-Schmidt factorization.
  % We perform the Q R decomposition of matrix A using the Gram-Schmidt algorithm, where each r(i,j) is q(i) transposed times a(j) and using an auxiliary
  % we find the diagonal elements of R. Q will contain the elements equal to the division of the auxiliary to the diagonal elements of R. If we need the inverse of A,
  % we write it as a row vector of column vectors. A*A^(-1) is the identity matrix. But, finding QR, we substitute in the equation. Q is orthonormal, and when multiplied with
  % its transpose gives an identity matrix that does not change another matrix if multiplied to it. Then we have the equation R * A^(-1) = Q(T) * I. As we said, the inverse
  % of A is written as column vectors. We are left to solve a triangular system, where R is an upper triangular matrix and is multiplied with each column of the inverse of A.
  % The formula for each x is from lab number 2. And we put all these columns in matrix B which is the output.

  N = rows(A);
  Q = zeros(N);
  R = zeros(N);
  for j = 1 : N
    for i = 1 : j - 1
      R(i, j) = Q(:, i)' * A(:, j);
    endfor
    v = zeros(N, 1);
    for i = 1 : j-1
      v = v + R(i,j) * Q(:,i);
    endfor
    aux = A(:, j) - v;
    R(j, j) = norm(aux, 2);
    Q(:, j) = aux/R(j, j);
  endfor
  B = zeros(N);
  I = eye(N);
  for i = 1 : N
    x = zeros(N, 1);

    % b is each vector in turn that is a solution to each equation.
    b = Q' * I(:, i);
    for j = N : -1 : 1
      x(j) = b(j) / R(j, j);
      b(1 : j - 1) = b(1 : j - 1) - R(1 : j - 1, j) * x(j);
    endfor
    B(:,i) = x;
  endfor
endfunction