def searchNumOccurrence(ary, k, start, _end)
    return 0 if (start > _end)
    mid = (start + _end) / 2

    return searchNumOccurrence(ary, k, mid + 1, _end) if (ary[mid] < k)
    return searchNumOccurrence(ary, k, start, mid - 1) if (ary[mid] > k) 

    searchNumOccurrence(ary, k, start, mid - 1) + 1 + searchNumOccurrence(ary, k, mid + 1, _end)
end

puts  searchNumOccurrence([1,2,2,3,4,5,6], 2, 0, 6)
