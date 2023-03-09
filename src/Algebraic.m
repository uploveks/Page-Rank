function R = Algebraic(nume, d)
	% Function that calculates the PageRank vector using the algebraic method.
    % Inputs:
    % -> nume: the name of the file to write;
    % -> d: the probability that a user will continue browsing to another page.
    % Outputs:
    % -> R: the vector of PageRanks assigned to each page.

  fid = 0;
  [fid, eroare] = fopen(nume, 'r');
  if fid == -1
    disp(eroare);
  endif

  % read N and the matrix A
  N = fscanf(fid, "%d", 1);
  A = zeros(N);
  for i = 1 : N
    idx = fscanf(fid, "%d", 1);
    nr_vecini = fscanf(fid, "%d", 1);
    for j = 1 : nr_vecini
      vecin = fscanf(fid, "%d", 1);
      if idx ~= vecin
        A(idx, vecin) = 1;
      endif
    endfor
  endfor

  % Links_in represents a vector that shows how many links each node has
  Links_in = zeros(N, 1);

  % K is a diagonal matrix that has 1/Links_in on the diagonal because that is already
  % the inverse we need
  K = zeros(N);
  for i = 1 : N
    Links_in(i) = sum(A(i, :));
    K(i, i) = 1 / Links_in(i);
  endfor
  M = zeros(N);

  % M is the stochastic matrix
  M = (K * A)';
  I = eye(N);
  R = zeros(N, 1);
  e = ones(N, 1);
  % using the function that finds the inverse, we calculate R
  R = PR_Inv(I - d * M) * ((1 - d) / N) * e;
  fclose(fid);
endfunction