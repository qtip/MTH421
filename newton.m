function r = newton(f, c, varargin)
    % f is a function handle
    % c is the initial guess
    % (Optional) eps is tolerance value for the correct answer
    % (Optional) max_iterations is the number of iterations before stopping
    % Example: newton(@(x)x^3-3*x-5, 1)
    i_p = inputParser;
    i_p.FunctionName = 'newton'; 
    i_p.addRequired('f'); i_p.addRequired('c');
    i_p.addOptional('tol',1.0e-15); i_p.addOptional('max_iterations',30); 
    i_p.parse(f, c, varargin{:});
    tol = i_p.Results.tol; max_iterations = i_p.Results.max_iterations;
    
    % Find the derivative of f
    syms x;
    df = diff(f(x), x);
    g = @(y)subs(df, y);
    
    for i=1:max_iterations
        fc = f(c);
        if abs(fc) < tol
            break;
        end
        c = c-fc/g(c);
        fprintf('%18.15f\t %e\n', fc, abs(c));
    end
    r=c;
end