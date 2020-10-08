def bubble_sort(arr)
    sorted = false
    until sorted
        sorted = true
        i = 0
        while i < arr.length - 1
            if arr[i] > arr[i+1]
                sorted = false
                arr[i], arr[i+1] = arr[i+1], arr[i]
            end
            i += 1
        end
    end
    arr
end

p bubble_sort([4,3,78,2,0,2])
# [0,2,2,3,4,78]