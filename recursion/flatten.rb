def flatten(arr, result = [])
    arr.each do |e|
        if e.kind_of?(Array)
            flatten(e, result)
        else
            result << e
        end
    end
    result
end

p flatten([1,[2,3,[452]]]) # => [1,2,3,452]