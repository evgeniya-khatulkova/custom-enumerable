module Enumerable
  # def my_each_with_index

  # end

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

  def my_any?
    new_array = []
    my_each { |x| new_array << x if yield(x) == true }
    new_array.length.positive?
  end
end

class Array
  def my_each
    for i in self
      yield i if block_given?
    end
  end
  include Enumerable
end
