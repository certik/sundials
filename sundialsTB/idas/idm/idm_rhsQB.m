function [qBd, flag, new_data] = idm_rhsQB(type, varargin)

%
% Wrapper around the actual user-provided Matlab function
%

switch type
  
 case 0
 
  % Not dependent on yS

  t    = varargin{1};
  yy   = varargin{2};
  yp   = varargin{3};
  yyB  = varargin{4};
  ypB  = varargin{5};
  fct  = varargin{6};
  data = varargin{7};
  
  if isempty(data)
    [qBd, flag] = feval(fct,t,yy,yp,yyB,ypB);
    new_data = [];
  else
    [qBd, flag, new_data] = feval(fct,t,yy,yp,yyB,ypB,data);
  end

 case 1
 
  % Dependent on yS

  t    = varargin{1};
  yy   = varargin{2};
  yp   = varargin{3};
  Ns   = varargin{4};
  yyS  = varargin{5};
  ypS  = varargin{6};
  yyB  = varargin{7};
  ypB  = varargin{8};
  fct  = varargin{9};
  data = varargin{10};
  
  N = length(y);
  yyS = reshape(yS,N,Ns);
  ypS = reshape(yS,N,Ns);
  
  if isempty(data)
    [qBd, flag] = feval(fct,t,yy,yp,yyS,ypS,yyB,ypB);
    new_data = [];
  else
    [qBd, flag, new_data] = feval(fct,t,yy,yp,yyS,ypS,yyB,ypB,data);
  end

  
end