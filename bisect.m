function r = bisect(f, a, b, varargin)
    % f is a function handle
    % a & b are the bounds on the range where a < b
    % (Optional) eps is tolerance value for the correct answer
    % (Optional) max_iterations is the number of iterations before stopping
    % (Optional) depth is the current number of iterations
    i_p = InputParser;
    i_p.FunctionName = 'bisect'; 
    i_p.addRequired('f'); i_p.addRequired('a'); i_p.addRequired('b');
    i_p.addOptional('eps',0.9e-10); i_p.addOptional('max_iterations',30); 
    i_p.addOptional('depth',0); i_p.parse(f, a, b, varargin{:});
    eps = i_p.Results.eps; max_iterations = i_p.Results.max_iterations;
    depth = i_p.Results.depth;

    c = (b-a)/2+a;
    
    if depth == max_iterations || abs(f(c)) < eps
        r = c;
        return
    elseif sign(f(a)) ~= sign(f(c)) % there is a root between a and c
        r = bisect(f, a, c, eps, max_iterations, depth+1);
        return
    else % there is a root between c and b
        r = bisect(f, c, b, eps, max_iterations, depth+1);
        return
    end
end