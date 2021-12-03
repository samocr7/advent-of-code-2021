def calculate_position_and_depth_product(input_array)
    position = 0
    depth = 0
    input_array.each do |x|
        command = x.split(" ")
        direction = command[0]
        value = command[1].to_i
        if direction == 'up'
            depth -= value
        elsif direction == 'down'
            depth += value
        else
            position += value
        end
    end
    return position * depth
end

def calculate_position_and_depth_product_with_aim(input_array)
    position = 0 
    depth = 0
    aim = 0
    input_array.each do |x|
        command = x.split(" ")
        direction = command[0]
        value = command[1].to_i
        if direction == 'up'
            aim -= value
        elsif direction == 'down'
            aim += value
        else
            position += value
            depth += value*aim if aim > 0
        end
    end
    return position * depth
end

"""
https://adventofcode.com/2021/day/2
"""

commands = File.readlines("day2/input.txt")
# problem 1
puts(calculate_position_and_depth_product(commands))
# problem 2
puts(calculate_position_and_depth_product_with_aim(commands))