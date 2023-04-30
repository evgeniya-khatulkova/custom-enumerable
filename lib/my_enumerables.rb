module Enumerable
  # Your code goes here
  def my_each_with_index
  end

  def my_select
    new_array = []
    my_each { |x| new_array << x if yield(x) == true }
    new_array
  end

  def my_all?
    new_array = []
    my_each { |x| new_array << x if yield(x) == true }
    new_array.length == length
  end

end

class Array
  def my_each
    each { |x| yield x if block_given? }
  end
  include Enumerable
end
