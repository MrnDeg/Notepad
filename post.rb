class Post
  def initialize
    @created_at = Time.now #дата создания записи
    @text = [] #массив строк записи
  end

  #Набор известных детей класса, запишем в виде массива классов
  def self.post_types
    [Memo, Task, Link]
  end

  #Динамическое создание объекта нужного класса из набора возможных детей
  def self.create(type_index)
    return post_types[type_index].new
  end

  #метод для считывания даннны и их записи
  def read_from_console
    
  end 

  def to_strings

  end

  def save
    file = File.new(file_path, "w:UTF-8")

    for item in to_strings do
      file.puts(item)
    end
    file.close
  end

  def file_path
    current_path = File.dirname(__FILE__)
    file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")

    return current_path + "/" + file_name
  end
end