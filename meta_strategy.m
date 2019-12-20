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



% 3. Choose strategy that appears best (Score: 0.85) (N=0)
%x_guess = (A_wins+1)/(A_games+1);
%y_guess = (B_wins+1)/(B_games+1);
%if x_guess > y_guess
%    strategy = 'A';
%else
%    strategy = 'B';
%end


% 3. Choose strategy that appears best after N exploration trials (Score ~ 0.85 with N in (0,6) then declines?)

N_learning_trials=6;

if (A_games+B_games<N_learning_trials/2)
    strategy = 'A';
elseif (A_games+B_games<N_learning_trials)
    strategy = 'B';
else
	x_guess = (A_wins+1)/(A_games+1);
	y_guess = (B_wins+1)/(B_games+1);
	if x_guess > y_guess
	    strategy = 'A';
	else
	    strategy = 'B';
	end
end


