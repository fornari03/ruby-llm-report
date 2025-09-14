class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2
    player1, player2 = game
    name1, strat1 = player1
    name2, strat2 = player2

    if !['R', 'P', 'S'].include?(strat1) || !['R', 'P', 'S'].include?(strat2)
        raise NoSuchStrategyError
    end

    if (strat1 == 'R' && strat2 == 'S') || (strat1 == 'S' && strat2 == 'P') || (strat1 == 'P' && strat2 == 'R') || strat1 == strat2
        return player1
    end
    return player2
end

p rps_game_winner([ [ "Kristen", "P" ], [ "Pam", "S" ] ]) # => returns the list ["Pam", "S"] wins since S>P
# p em vez de puts para mostrar a lista e nao os elementos dela



def rps_tournament_winner(tournament)
    if tournament[0][0].is_a?(String)
        return rps_game_winner(tournament)
    else
        left = rps_tournament_winner(tournament[0])
        right = rps_tournament_winner(tournament[1])
        return rps_game_winner([left, right])
    end
end

p rps_tournament_winner [
    [
        [ ["Kristen", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"], ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]