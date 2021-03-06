% nanstan Return a standardized serie discarding NaNs
%
% X = nanstan(X,[DIM])
% 
% Return a standardized serie:
%	[X - nanmean(X,DIM)]/nanstd(X,[],DIM)
%
% Mean and std are taken along DIM (1 by default)
% 
% See also: nanstan
%
% http://codes.guillaumemaze.org
% Copyright (c) 2013, Guillaume Maze (Ifremer, Laboratoire de Physique des Oceans).
% Created: 2013-12-20 by G. Maze
% Revised: 2014-04-09 (C. Feucher) Added possibility to handle series with 2 dimensions.
% Revised: 2014-04-10 (G. Maze) Now handle arrays with any number of dimensions

% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
% 	* Redistributions of source code must retain the above copyright notice, this list of 
% 	conditions and the following disclaimer.
% 	* Redistributions in binary form must reproduce the above copyright notice, this list 
% 	of conditions and the following disclaimer in the documentation and/or other materials 
% 	provided with the distribution.
% 	* Neither the name of the Ifremer, Laboratoire de Physique des Oceans nor the names of its contributors may be used 
%	to endorse or promote products derived from this software without specific prior 
%	written permission.
%
% THIS SOFTWARE IS PROVIDED BY Guillaume Maze ''AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, 
% INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A 
% PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Guillaume Maze BE LIABLE FOR ANY 
% DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
% LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR 
% BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
% STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
% OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%

function X = nanstan(X,varargin)

switch nargin
	case 1
		idim = 1;
	otherwise
		idim = varargin{1};
end% switch 

Xmean = nanmean(X,idim);
Xstd  = nanstd(X,[],idim);
X = bsxfun(@rdivide,bsxfun(@minus,X,Xmean),Xstd);

end %functionnanstan