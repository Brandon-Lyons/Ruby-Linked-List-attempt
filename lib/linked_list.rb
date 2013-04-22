require 'linked_list_item'

class LinkedList
  attr_reader :first_item

  def initialize *args
    args.each { |item| add_item(item) }
  end

  def add_item(payload)
    next_item = LinkedListItem.new(payload)
    return @first_item = next_item if @first_item.nil?
    last_item = @first_item
    until last_item.last?
      last_item = last_item.next_list_item
    end
    last_item.next_list_item = next_item
  end

  def get(n)
    item = @first_item
    n.times do
      raise IndexError if item.nil?
      item = item.next_list_item
    end
    item.payload
  end

  def last
    item = @first_item
    return nil if item.nil?
    until item.last?
      item = item.next_list_item
    end
    item.payload
  end

  def size
    item = @first_item
    size = 0
    until item.nil?
      item = item.next_list_item
      size += 1
    end
    size
  end

  def to_s
    return "| |" if @first_item.nil?
    item = @first_item
    string = item.payload
    until item.last?
      item = item.next_list_item
      string = "#{string}, #{item.payload}"
    end
    "| #{string} |"
  end

  # ========= Bonus ========== #

  def [](n)
    get(n)
  end

  def []=(n, value)
    item = @first_item
    new_item = LinkedListItem.new(value)
    (n - 1).times do
      raise IndexError if item.nil?
      item = item.next_list_item
    end
    new_item.next_list_item = item.next_list_item.next_list_item
    item.next_list_item = new_item
  end

  def remove(n)
    item = @first_item
    return @first_item = item.next_list_item if n == 0
    (n - 1).times do
      item = item.next_list_item
    end
    raise IndexError if item.nil?
    item.next_list_item = item.next_list_item.next_list_item
  end
end
