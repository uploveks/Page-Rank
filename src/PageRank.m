function [R1 R2] = PageRank(nume, d, eps)
	% Calculates the PageRank indices for the 3 requirements
    % Writes the output file nume.out

  % Opens the input file and checks for errors
  fid = 0;
  [fid, eroare] = fopen(nume, 'r');
  if fid == -1
    disp(eroare);
  endif
  N = fscanf(fid, "%d", 1);

  % Reads the first value from the input file, then reads and discards the next N+1 lines
  for i = 1 : N + 2
    val1 = fgets(fid);
  endfor

  % Reads the next value from the input file and converts val1 and val2 to doubles
  val2 = fgets(fid);

    % Calls the Iterative and Algebraic functions to calculate the PageRank indices
  val1 = str2double(val1);
  val2 = str2double(val2);
  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d);
  fclose(fid);

  % Renames the output file to nume.out and opens it for writing
  nume = [nume ".out"];
  fid_output = 0;
  [fid_output, eroare] = fopen(nume, 'w');
  if fid_output == -1
    disp(eroare);
  endif

  % Write the value of N to the output file
  fprintf(fid_output, "%d\n", N);

  % Write the values of R1 (Iterative) to the output file, one per line
  for i = 1 : N
    fprintf(fid_output, "%f\n", R1(i));
  endfor

  % Writes a blank line to the output file
  fprintf(fid_output, "\n");

  % Writes the values of R2 (Algebraic) to the output file, one per line
  for i = 1 : N
    fprintf(fid_output, "%f\n", R2(i));
  endfor
  fprintf(fid_output, "\n");

  % To determine membership, the first column of PR1 will range from 1 to N, representing the node number, and the second column will be R2.
  PR1 = zeros(N, 2);
  PR1(:, 1) = (1 : N)';
  PR1(:, 2) = R2;

  % sort PR1 in descending order by rows, thus sorting the nodes as well
  PR1 = sortrows(PR1, -2);

  % Write the values of PR1 to the output file, one per line
  for i = 1 : N
    x = PR1(i, 2);
    fprintf(fid_output, "%d %d %f\n", i, PR1(i, 1), Apartenenta(x, val1, val2));
  endfor
  fclose(fid_output);
endfunction