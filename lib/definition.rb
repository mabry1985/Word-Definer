require ('./lib/word')

class Definition
  attr_accessor :definition, :word_id, :id

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @definition = attributes.fetch(:definition)
    @word_id = attributes.fetch(:word_id)
    @id = @@total_rows += 1
  end

  def save
    @@definitions[self.id] = self
  end

  def self.all()
    @@definitions.values()
  end

  def self.find(id)
    @@definitions[id]
  end

  def self.find_by_word(word_id)
  definitions = []
  @@definitions.values.each do |definition|
    binding.pry
    if definition.word_id == word_id
      definitions.push(definition)
    end
  end
  definitions
  end

  def self.clear
    @@definitions = {}
    @@total_rows = 0
  end

  def update(definition, word_id)
    self.definition = definition
    self.word_id = word_id
    @@definitions[self.id] = Song.new(self.definition, self.word_id, self.id)
  end

  def delete
    @@definitions.delete(self.id)
  end

  def word
    Word.find_by_definition(self.id)
  end

end
