class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
    description == otherTodo.description &&
    done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if todo.class == Todo
      @todos << todo
    else
      raise TypeError, "Can only add Todo objects"
    end
  end
  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all? do |item|
      item.done == true
    end
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    @todos.fetch(idx).done = true
  end

  def mark_undone_at(idx)
    @todos.fetch(idx).done = false
  end

  def done!
    @todos.each do |item|
      item.done = true
    end
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    deleted_item = @todos.fetch(idx)
    @todos.delete(deleted_item)
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each
    idx = 0
    loop do
      yield(@todos[idx])
      idx += 1
      break if idx >= @todos.size
    end
    self
  end

  def select
    results = TodoList.new('Selected todos')
    @todos.each do |item|
      results.todos << item if yield(item)
    end
    results
  end

  def find_by_title(string)
    select { |todo| todo.title == string }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| todo.done == false }
  end

  def mark_done(string)

    todos.each do |item|
      if item.title == string
        item.done = true
      end
    end

  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each {|todo| todo.undone! }
  end

  protected

  attr_accessor :todos
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)



