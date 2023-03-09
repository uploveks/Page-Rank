function y = Apartenenta(x, val1, val2)
	% The function that takes as parameters x, val1, val2
	%and calculates the value of the membership function at point x.
    % We know that 0 <= x <= 1

  % A function is continuous if the right limit is equal to the
  % left limit and it is equal to the function itself

	if x < val1
    y = 0;
  elseif x <= val2

    % Here we equate ax + b = 0 and x will be val1,
    %after which ax + b = 1 and x will be val2

    a = 1 / (val2 - val1);
    b = - a * val1;
    y = a * x + b;
  elseif x <= 1
    y = 1;
  endif
endfunction
  