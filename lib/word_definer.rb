class Word
  attr_accessor :word, :definition
  attr_reader :id

  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @word = attributes.fetch(:word)
    @definition = []
    @id = id || @@total_rows += 1
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

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

end