import chess


class ChessEnv:

    def __init__(self):
        self.board = chess.Board()

    def reset(self):
        self.board.reset()
        return self.board.fen()

    def get_state(self):
        return self.board.fen()

    def get_actions(self):
        return list(self.board.legal_moves)

    def step(self, action):

        # Make the move
        self.board.push(action)

        # Check game status
        if self.board.is_checkmate():
            reward = 10
            done = True

        elif self.board.is_stalemate() or self.board.is_insufficient_material():
            reward = 0
            done = True

        else:
            reward = 0
            done = False

        return self.board.fen(), reward, done

    def render(self):
        print(self.board)