class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    temp = []
    each_with_index do |el, idx|
      temp << el.hash * idx.hash
    end
    temp.sum + length.hash
  end
end

class String
  def hash
    alpha = ('a'..'z').to_a
    split("").map { |char| alpha.index(char.downcase).hash }.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.flatten.map { |el| el.hash }.sort.hash
  end
end
