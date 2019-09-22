def my_uniq(arr)
  finalarr = []
  arr.each { |el| finalarr << el unless finalarr.include?(el) }
  finalarr
end

def two_sum(arr)
  finalarr = []
  arr.each_with_index do |el1, idx1|
    (idx1+1...arr.length).each do |idx2|
      finalarr << [idx1, idx2] if el1 + arr[idx2] == 0
    end
  end
  finalarr
end

def my_transpose(matrix)
  finalmatrix = []
  i = 0
  while i < matrix.length
    temparr = []
    matrix.each { |sub| temparr << sub[i] }
    finalmatrix << temparr
    i += 1
  end
  finalmatrix
end

def stockpicker(arr)
  pair = []
  max_diff = 0

  arr.each_with_index do |price1, day1|
    (day1+1...arr.length).each do |day2|
      price2 = arr[day2]
      diff = price2 - price1
      pair, max_diff = [day1, day2], diff if diff > max_diff
    end
  end
  pair
end