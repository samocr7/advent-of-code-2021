
def get_numbers(input_array)
    return input_array[0].split(',').map(&:to_i)
end

def build_boards(input_array)
    numbers = input_array[0].split(',').map(&:to_i)
    board_start_index = 2
    board_end_index = 7
    boards = []
    while true do
        board = Array.new(5){Array.new(5)}
        (board_start_index..board_end_index - 1).each do |index|
            board_numbers = input_array[index].split(' ').map(&:to_i)
            (0..4).each do |y|
                row = index-board_start_index
                board[row][y] = board_numbers[y]
            end
        end
        boards.push(board)
        board_start_index += 6
        board_end_index += 6
        break if board_end_index > input_array.length
    end
return boards
end


def find_winning_board_scores(numbers, boards)
    boards_that_won = []
    winning_board_scores = []
    numbers.each do |number|
        boards.each_with_index do |board, board_index|
            if boards_that_won.include?(board_index)
                next
            end 
            (0..4).each do |x|
                (0..4).each do |y|
                    if number == board[x][y]
                        board[x][y] = true
                        winner = check_line_for_win(board)
                        if winner
                             winning_board_scores.append(calculate_score(board, number))
                             boards_that_won.append(board_index)
                        end
                    end
                end
            end
        end
    end
    return winning_board_scores
end


def check_line_for_win(board)
    (0..4).each do |x|
        return true if board[x].all?(true)
        column_line = []
        (0..4).each do |y|
            column_line.append(board[y][x])
        end
        return true if column_line.all?(true)
    end
return false
end

def calculate_score(board, winning_number)
    sum = 0
    (0..4).each do |x|
        (0..4).each do |y|
            sum += board[x][y] if board[x][y] != true
        end
    end
    score = sum * winning_number
    return score
end


"""
https://adventofcode.com/2021/day/4
"""

input = File.readlines("day4/input.txt")
numbers = get_numbers(input)
boards = build_boards(input)

winning_boards = find_winning_board_scores(numbers, boards)
# problem 1
puts(winning_boards[0])
# problem 2
puts(winning_boards[winning_boards.length - 1])