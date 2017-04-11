classdef fuzzy
  properties
    vec
  end
  methods
    function obj = fuzzy(val)
      obj.vec = val;
    end
    function res = mtimes(obj1, obj2)
      [n, m] = size(obj2.vec);
      tmp = ones(1, n);
      res = ones(1, m);
      for j = 1:m
	for i = 1:n
	  tmp(i) = min(obj1.vec(i), obj2.vec(i+n*(j-1)));
	end
	res(j) = max(tmp);
      end
      res = res./sum(res);
    end
  end
end
