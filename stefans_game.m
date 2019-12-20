% Stefan's problem:
%
% In a game strategy A and B wins with probability x and y, respectively
% Playing a round of games maximize the number of wins, knowing only the
% outcome of previous games in that round

% Number of rounds
N_rounds = 10000;

% Number of games in a round
N_games = 100;

history = zeros(N_rounds, 3);

for n_round = 1:N_rounds
    % Define winning probability
    x=rand();
    y=rand();
    
    % Clear outcome-history
    A_games = 0;
    A_wins = 0;
    B_games = 0;
    B_wins = 0;
    
    % Play the games in this round
    for n_game = 1:N_games
        % Choose strategy
        strategy = meta_strategy(A_games, A_wins, B_games, B_wins);
        
        if strategy == 'A'
            % Play a game according to strategy A
            A_games = A_games+1;
            A_wins = A_wins + (rand()<x);
        elseif strategy == 'B'
            % Play a game according to strategy B
            B_games = B_games+1;
            B_wins = B_wins + (rand()<y);
        else
            error('Invalid strategy!');
        end
    end
    
    % As a merit, calculate how close we were to the expected number of
    % wins if we would have always have used the best strategy of A and B
    win_ratio = (A_wins + B_wins)/(A_games + B_games);
    merit = win_ratio/max(x,y);
    
    % Record outcome of this round
    history(n_round, :) = [x,y,merit];
end

% A merit of 75% is achieved only from randomly picking one of A or B
% (or always using A, no matter what, etc...)
%
% Therefore:
% Define score as average merit relative a baseline of 75 %
score = (mean(history(:,3))-0.75)/0.25;
fprintf('Your meta-strategy achieved score: %.2f\n', score);

% Optional:
% Plot a map over achived merit over the rounds
%
% map = sparse(ceil(100*history(:,1)), ceil(100*history(:,2)), history(:,3));
% imagesc(map');
% set(gca,'YDir','normal');
% colormap('jet');
% xlabel('x');
% ylabel('y');
