class LRUCache

   def initialize(size)
     @size = size
     @cache = []
   end

   def count
     @cache.count
   end

   def add(el)
     # adds element to cache according to LRU principle
     if @cache.include?(el)
       @cache.delete(el)
       @cache << el
     elsif @catche.count > size
       @cache.shift
       @cache << el
     else
       @cache << el
     end
   end

   def show
     # shows the items in the cache, with the LRU item first
     p @cache
     nil
   end

   private
   # helper methods go here!

 end
