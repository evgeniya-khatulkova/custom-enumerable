module Enumerable
  def my_each_with_index
    counter = 0
    my_each do |x|
      yield(x, counter)
      counter += 1
    end
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

  def my_any?
    new_array = []
    my_each { |x| new_array << x if yield(x) == true }
    new_array.length.positive?
  end

  def my_none?
    new_array = []
    my_each { |x| new_array << x if yield(x) == true }
    new_array.empty?
  end

  def my_count
    if block_given?
      new_array = []
      my_each { |x| new_array << x if yield(x) == true }
      new_array.size
    else
      length
    end
  end

  def my_map
    new_array = []
    my_each { |x| new_array << yield(x) }
    new_array
  end

  def my_inject(number)
    counter = yield(number, self[0])
    my_lambda = -> (a,b) { yield(a, b) }
    my_each { |x| counter = yield(x, counter) }
    if my_lambda.call(0, 1).zero?
      counter
    else
      counter - self[0]
    end
  end
end

class Array
  def my_each
    for i in self
      yield i if block_given?
    end
  end
end
