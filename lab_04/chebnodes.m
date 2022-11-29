function x = chebnodes(n,a,b)
%CHEBNODES   Sequence of points related to Chebyshev polynomials.
%          X = CHEBNODES(N) produces a row vector of length ABS(N).
%          There are two choices:
%              N > 0:  zeros of T_N,
%              N < 0:  extrema of T_{-N-1},
%          where T_k is the Chebsyhev polynomial of degree k.

if n~=round(n), error('CHEBNODES: first argument must be integer'); end
if nargin==1, a=-1; b=1; end
if nargin~=1 && nargin~=3, error('CHEBNODES: one or three arguments required'); end
if nargin==3 && a>=b, error('CHEBNODES: difference of third and second argument must be positive'); end
if n>0                        %  Zeros of T_n
   k = 1:n;
   x = cos((0.5-k)*(pi/n));
elseif n<0                    %  Extrema of T_(n-1)
   if n==-1, x=[]; return, end
   k = 0:abs(n)-1;
   x = cos( k * (pi/(abs(n)-1)) );
else
   x=[]; return
end
x=0.5*((a-b)*x+(a+b));