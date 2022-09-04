class Solution
    # @param a : array of integers
    # @param b : integer
    # @return an integer
    def solve(a, b)
        a.index(b)
    end

    def solve1(ary, b)
        min, max, idx = find_bitonic_point(ary)
        answer = 0

        return -1 if b < min || b > max
        return answer if answer = b_search(ary[..idx], b)
        return ary.size - 1 - answer if answer = b_search(ary[idx+1..].reverse, b)
        -1
    end

    def solve2(ary, b)
        min, max, idx = find_bitonic_point(ary)
        
        return -1 if b < min || b > max
        a = b_search(ary[..idx], b)
        return a if a
        b = reverse_b_search(ary[idx+1..], b)
        return idx + b + 1 if b
        -1
    end

    def b_search(ary, n)
        left, right = 0, ary.size - 1
        while left <= right
            mid = (left + right) / 2
            return mid if n == ary[mid]

            if n > ary[mid]
                left = mid + 1
            else
                right = mid - 1
            end
        end
    end

    def reverse_b_search(ary, n)
        left, right = 0, ary.size - 1
        while left <= right
            mid = (left + right) / 2
            return mid if n == ary[mid]

            if n > ary[mid]
                right = mid - 1
            else
                left = mid + 1
            end
        end
    end

    # @return [min, max, max_index]
    def find_bitonic_point(ary)
        max, index = 0, 0, 0
        left, right = 0, ary.size - 1
        min = [ary[left], ary[right]].min

        while left < right
            index = (left + right + 1) / 2
            if ary[index-1] < ary[index] && ary[index] > ary[index+1]
                max = ary[index]
                break
            end

            if ary[index-1] > ary[index]
                right = index - 1
            else
                left = index + 1
            end
        end

        [min, max, index]
    end
end

solver = Solution.new
p solver.solve([1,3,5,6,10,4,-1,-10], 3)
p solver.solve1([1,3,5,6,10,4,-1,-10], 3)
p solver.solve2([1,3,5,6,10,4,-1,-10], 3)

p solver.solve([1,3,5,6,10,4,-1,-10], -10)
p solver.solve1([1,3,5,6,10,4,-1,-10], -10)
p solver.solve2([1,3,5,6,10,4,-1,-10], -10)

# Benchmark
# require 'benchmark/ips'
# Benchmark.ips do |x|
#   SAMPLE_ARRAY = [5, 6, 7, 8, 9, 10, 3, 2, 1].freeze
#   solver = Solution.new

#   x.report("Array#index") do
#     solver.solve(SAMPLE_ARRAY, 3)
#     solver.solve(SAMPLE_ARRAY, 0)
#   end
#   x.report("bsearch") do
#     solver.solve1(SAMPLE_ARRAY, 3)
#     solver.solve1(SAMPLE_ARRAY, 0)
#   end
#   x.report("better bsearch") do
#     solver.solve2(SAMPLE_ARRAY, 3)
#     solver.solve2(SAMPLE_ARRAY, 0)
#   end

#   x.compare!
# end
