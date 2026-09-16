class GridWorldEnv:

    def __init__(self, data):
        self.grid_size = data["grid_size"]
        self.start = tuple(data["start"])
        self.goal = tuple(data["goal"])
        self.blocked = [tuple(x) for x in data["blocked"]]
        self.rewards = data["rewards"]
        self.actions = data["actions"]

        self.state = self.start

    def reset(self):
        self.state = self.start
        return self.state

    def step(self, action):

        row, col = self.state

        if action == "up":
            row -= 1
        elif action == "down":
            row += 1
        elif action == "left":
            col -= 1
        elif action == "right":
            col += 1
        else:
            raise ValueError("Invalid action")

        # Check boundaries
        if row < 0 or row >= self.grid_size[0] or \
           col < 0 or col >= self.grid_size[1]:
            return self.state, -1, False

        new_state = (row, col)

        # Check blocked cell
        if new_state in self.blocked:
            return self.state, -1, False

        self.state = new_state

        # Get reward
        reward = self.rewards.get(str([row, col]), 0)

        # Check goal
        done = self.state == self.goal

        return self.state, reward, done

    def render(self):

        grid = ""

        for row in range(self.grid_size[0]):
            for col in range(self.grid_size[1]):

                position = (row, col)

                if position == self.state:
                    grid += "A "
                elif position == self.goal:
                    grid += "G "
                elif position in self.blocked:
                    grid += "X "
                else:
                    grid += ". "

            grid += "\n"

        return grid