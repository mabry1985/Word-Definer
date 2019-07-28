require('./lib/word')

class Word
  attr_accessor :word, :definitions, :id

  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @word = attributes.fetch(:word)
    @definitions = []
    @id = id || @@total_rows += 1
  end

  # def self.find_by_word(word_id)
  # definitions = []
  # @@definitions.values.each do |definition|
  #   if definition.word_id == word_id
  #     definitions.push(definition)
  #   end
  # end
  # definitions
  # end

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

  def update(name, album_id)
    self.name = name
    self.album_id = album_id
    @@songs[self.id] = Song.new(self.name, self.album_id, self.id)
  end

  def delete
    @@songs.delete(self.id)
  end  

  def self.clear
    @@words = {}
    @@total_rows = 0
  end


end