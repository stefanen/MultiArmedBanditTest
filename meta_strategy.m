function strategy = meta_strategy(A_games, A_wins, B_games, B_wins)



% 1. Trivial strategy (Score: 0.00)
% strategy = 'A';



% 2. Weighted randomized choice (Score: 0.42)
% x_guess = (A_wins+1)/(A_games+1);
% y_guess = (B_wins+1)/(B_games+1);
% if x_guess > (x_guess+y_guess)*rand()
%     strategy = 'A';
% else
%     strategy = 'B';
% end



% 3. Choose strategy that appears best (Score: 0.85)
x_guess = (A_wins+1)/(A_games+1);
y_guess = (B_wins+1)/(B_games+1);
if x_guess > y_guess
    strategy = 'A';
else
    strategy = 'B';
end





