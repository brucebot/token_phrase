require 'backports/1.9.1/array/sample'
module TokenPhrase
  class Generator
    attr_accessor :dictionary,:order

    def initialize
      @dictionary = TokenPhrase.dictionary
      @order = dictionary.keys
    end

    def generate
      lists.map(&:sample)
    end

    def permutations
      lists.inject 1 do |p, list|
        if list.empty?
          p
        else
          p * list.uniq.count
        end
      end
    end

    def lists
      dictionary.values_at(*order).compact
    end
  end
end

