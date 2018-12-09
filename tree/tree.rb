#Author: Daniel Osterholz, Roman Schmidt

class Tree
  def initialize(ordnung)
    @tree = get_tree(ordnung);
  end

  def to_s
    @tree.to_s
  end

  def print_nicely
    @tree.each {|line|
      puts line.join(" ").center(@tree[-1].join(" ").length, " ")
    }
  end

  private

  def get_tree(ordnung)
    if (ordnung == 1)
      [["0", "1"]]
    else
      tree(get_tree(ordnung - 1))
    end
  end

  def tree(array)
    new_array = []
    line_index = 0
    new_line_index = 0
    while (line_index < array.size)
      line = array[line_index]
      if (line.size == 1)
        new_array[new_line_index] = []
        new_array[new_line_index][0] = line[0] + "0"
        new_array[new_line_index][1] = line[0] + "1"
        new_line_index += 1
        line_index += 1
      else
        new_array[new_line_index] = []
        new_array[new_line_index + 1] = []
        symbol_index = 0
        while (symbol_index < line.size)
          if (symbol_index == 0)
            new_array[new_line_index + 1][symbol_index] = line[symbol_index] + "0"
            new_array[new_line_index + 1][symbol_index + 1] = line[symbol_index] + "1"
          else
            new_array[new_line_index][symbol_index - 1] = line[symbol_index] + "0"
            new_array[new_line_index + 1][symbol_index + 1] = line[symbol_index] + "1"
          end
          symbol_index += 1
        end
        line_index += 1
        new_line_index += 2
      end
    end
    new_array
  end
end

Tree.new(10).print_nicely