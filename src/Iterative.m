function R = Iterative(nume, d, eps)
	% Function that calculates the matrix R using the iterative algorithm.
    % Inputs:
    % -> nume: the name of the file to be read from;
    % -> d: the damping coefficient, representing the probability that a certain navigator continues browsing (usually 0.85)
    % -> eps: the error that occurs in the algorithm.
    % Outputs:
    % -> R: the vector of PageRanks assigned to each page.
  
  fid = 0;
  [fid, eroare] = fopen(nume, 'r');
  if fid == -1
    disp(eroare);
  endif

  % read N and matrix A that represents the links
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

  % Links_in is the vector that represents the number of links each node has
  Links_in = zeros(N, 1);
  % K is the diagonal matrix with 1/Links_in on the diagonal which is already the inverse needed
  K = zeros(N);
  for i = 1 : N
    Links_in(i) = sum(A(i, :));
    K(i, i) = 1 / Links_in(i);
  endfor
  M = zeros(N);
  % M is the stochastic matrix
  M = (K * A)';
  e = ones(N, 1);
  R = ones(N, 1);

  % initially, R has all elements 1/N
  R = R * 1/N;

  % until R - previous R has error smaller than eps
  while 1
    Temp = R;
    R = d * M * R + ((1 - d)/N) * e;
    if norm(R - Temp) < eps
        break;
    endif
  endwhile
  fclose(fid);
 endfunction
  
