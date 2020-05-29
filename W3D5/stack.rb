class Stack

    attr_reader :my_array

    def initialize
        @my_array = []
    end

    def push(el)
      my_array.push(el)
    end

    def pop
      my_array.pop(el)
    end

    def peek
      my_array.last
    end
  end