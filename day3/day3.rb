def get_submarine_power_consumption(input_array)
    most_common = ""
    least_common = ""
    (0..11).each do |x|
        sum = 0
        input_array.each do |n|
            sum += n[x].to_i           
        end
        if sum > (input_array.length/2)
            most_common+='1'
            least_common+='0'
        else
            most_common+='0'
            least_common+='1'
        end
    end
    power_consumption = most_common.to_i(2) * least_common.to_i(2)
    return power_consumption
end


def get_submarine_life_support_rating(input_array)
    # i don't like this solution :'(
    oxygen_list = input_array
    co2_list = input_array
    (0..11).each do |x|
        sum = 0
        oxygen_list.each do |n|
            sum += n[x].to_i           
        end
        if sum >= ((oxygen_list.length/2.0).round)
            oxygen_list = oxygen_list.filter{ |binary_string| binary_string[x] == '1'} if oxygen_list.length > 1
        else
            oxygen_list = oxygen_list.filter{ |binary_string| binary_string[x] == '0'} if oxygen_list.length > 1
        end
        
        sum = 0
        co2_list.each do |n|
            sum += n[x].to_i           
        end
        if sum >= ( (co2_list.length/2.0).round)
            co2_list = co2_list.filter{ |binary_string| binary_string[x] == '0'} if co2_list.length > 1
        else
            co2_list = co2_list.filter{ |binary_string| binary_string[x] == '1'} if co2_list.length > 1
        end
    end
    life_support_rating = oxygen_list[0].to_i(2) * co2_list[0].to_i(2)
    return life_support_rating

end

"""
https://adventofcode.com/2021/day/3
"""

binary_strings = File.readlines("day3/input.txt")
# problem 1
puts(get_submarine_power_consumption(binary_strings))
# problem 2
puts(get_submarine_life_support_rating(binary_strings))