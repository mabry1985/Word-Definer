class Word
  attr_accessor :word, :definition
  attr_reader :id

  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @word = attributes.fetch(:word)
    @definition = attributes.fetch(:definition)
    @id = id || @@total_rows += 1
  end

  def save
    @@Words[self.id] = self
  end

  def self.all()
    @@Words.values()
  end

  def self.find(id)
    @@words[id]
  end

end
