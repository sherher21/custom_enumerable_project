module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |value|
      yield(value, index)
      index += 1
    end
  end

  def my_select
    array = []
    my_each { |value| array << value if yield(value) }
    array
  end

  def my_all?
    valid = true
    my_each { |value| valid = false unless yield(value) }
    valid
  end

  def my_none?
    valid = true
    my_each { |value| valid = false if yield(value) }
    valid
  end

  def my_count
    return length unless block_given?
    count = 0
    my_each { |value| count += 1 if yield(value) }
    count
  end

  def my_map
    array = []
    my_each { |value| array << yield(value) }
    array
  end

  def my_inject(initial_value)
    my_each { |value| initial_value = yield(initial_value, value)}
    initial_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    array = []
    for i in 0..length - 1
      yield at(i)
      array << at(i)
    end
    array
  end
end
