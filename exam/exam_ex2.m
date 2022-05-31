N = randi([-10,900],1);
S = randi([-10,900],1);
T = randi([-10,900],1);

try
    a = diceRolling(N,S,T);
catch
end
histogram(a);