def count_increases(input_array)
    count=0
    (0..input_array.length-2).each do |x| 
        count+=1 if input_array[x + 1] > input_array[x]
    end
    return count
end

def count_three_meas_sliding_window_increases(input_array)
    count=0
    (0..input_array.length-4).each do |x|
        curr_sum = input_array[x] + input_array[x+1] + input_array[x+2]
        next_sum = input_array[x+1] + input_array[x+2] + input_array[x+3]
        count+=1 if next_sum > curr_sum
    end
    return count
end


measurements = File.readlines("day1/measurements.txt").map(&:to_i)
# problem 1
puts(count_increases(measurements))
# problem 2
puts(count_three_meas_sliding_window_increases(measurements))
