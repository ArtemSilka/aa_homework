class Queue

    attr_reader :my_array

    def initialize
        @my_array = []
    end

    def enqueue(el)
      my_array.push(el)
    end

    def dequeue
      my_array.shift(el)
    end

    def peek
      my_array.first
    end
  end