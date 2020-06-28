
""" Eight queens puzzle"""
class Num_Queen:
    def __init__(self, place):
        self.place = place
        self.rotation = 0
        self.identify()

    def identify(self):
        """identify the positions"""
        queen_position = [-1] * self.place
        self.put_value(queen_position, 0)

    def put_value(self, queen_position, rows):

        if self.rotation == 0:
            if rows == self.place:
                print(queen_position)
                self.rotation += 1
            else:
                for cols in range(self.place):
                    if self.validate_position(queen_position, rows, cols):
                        queen_position[rows] = cols
                        self.put_value(queen_position, rows + 1)

    def validate_position(self, queen_position, capture_row, cols):
         #(check column and diagonal queen_position)
        for i in range(capture_row):
            if queen_position[i] == cols or \
                queen_position[i] - i == cols - capture_row or \
                queen_position[i] + i == cols + capture_row:
 
                return False
        return True

Queen = Num_Queen(8)
