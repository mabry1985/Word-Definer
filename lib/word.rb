require('./lib/definition')

class Word
  attr_accessor :word, :definitions, :id

  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @word = attributes.fetch(:word)
    @id = id || @@total_rows += 1
  end

  def definitions
    Definition.find_by_word(self.id)
  end

  def save
    @@words[self.id] = self
  end

  def self.all()
    @@words.values()
  end

  def self.find(id)
    @@words[id]
  end

  def update(attributes)
    self.word = attributes.fetch(:word)
  end

  def delete
    @@words.delete(self.id)
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end


end
