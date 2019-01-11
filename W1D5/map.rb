lass Map
  def initialize
    @mapped = []
  end

  def set(key, value)
    pair_index = mapped.index { |pair| pair[0] == key }
    if pair_index
      mapped[pair_index][1] = value
    else
      mapped.push([key, value])
    end
    value
  end

  def get(key)
    mapped.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def delete(key)
    value = get(key)
    mapped.reject! { |pair| pair[0] == key }
    value
  end
