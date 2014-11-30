require 'backports/1.9.1/array/sample'
module TokenPhrase
  class Generator
    #attr_accessor :separator, :dictionary, :order
    attr_accessor :dictionary

    #def initialize separator = "-", options = {}
    #  separator, options = "-", separator if separator.is_a? Hash
    #  options[:numbers] = [] if options[:numbers] == false

      #@separator = separator
    #  @dictionary = TokenPhrase.dictionary.merge options
      #@order = dictionary.keys
      #end

    def generate
      lists.map(&:sample).join(separator).chomp(separator).gsub(/-/, separator)
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

