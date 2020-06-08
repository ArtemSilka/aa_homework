class LRUCache
    def initialize(size)
        @size = size
        @cache = Array.new()
    end

    def count
      @cache.count
    end

    def add(el)
        if !@cache.include?(el)
            if !full?
                @cache << el
            else
                @cache.shift
                @cache << el
            end
        else
            ele = @cache.delete(el)
            @cache << ele
        end
    end

    def show
      @cache
    end

    private

    def full?
        @cache.count == @size
    end
  end