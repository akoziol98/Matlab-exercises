function output = diceRolling(N,S,T)
% The first variable N
% is the number of dice the user wants to roll (a user can select two through more than one dice at the
% same time), S is the number of sides on the dice (we assume all dice are the same) and the number of
% trials T that the user wants to run (how many times the user is throwing the dice).

try
assert(~isnan(N) & N >= 0);
catch
N = 1;
warning('Assigning N a value of 1.')
end


try
assert(~isnan(T) & T >= 0);
catch
T = 1*10^6;
warning('Assigning T a value of 1e6.')
end


try
assert(~isnan(S) & S >= 0);
catch
S = 6;
warning('Assigning S a value of 6.')
end

output = randi(S,[N, T]);
end
