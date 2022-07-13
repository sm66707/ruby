def printA(str,n)
    p str*n
end

def check(str)
    if str.start_with?('if')
        p 'True'
    else
        p 'False'
    end
end

def change(str)
    p str[-1]<<str[1...-1]<<str[0]
end

def add(str)
    lastchar=str.length()-1
    p str.split('')[lastchar]+str+str.split('')[lastchar]
end 

def calculate()
            year = [2012, 1500, 1600, 2020]
            year.each do |y|
            if y % 400 == 0
            puts y.to_s + ' is leap year'
            elsif y % 4==0 && y % 100 != 0 
            puts y.to_s + ' is leap year'
            else  puts y.to_s + ' is not leap year'
         end
     end
end

def rotate(nums)
    print rotated = nums[1], nums[2], nums[0];
end

def sum(nums)
    sum = 0
    i = 0
    while i < nums.length
        if(nums[i] == 17)
            i += 1
        else
            sum += nums[i]
        end
        i += 1
    end
    return sum
end

printA('a',3)
check('ifaya')
change('salma')
add('ayklam')
calculate()
rotate([1,2,5])
print sum([3, 5, 1, 17, 6])


