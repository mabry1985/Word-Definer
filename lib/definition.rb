class Definition
  attr_accessor :definition, :definitions, :id

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @definition = attributes.fetch(:definition)
    @definitions = []
    @id = id || @@total_rows += 1
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

  def self.clear
    @@definitions = {}
    @@total_rows = 0
  end

  def word
    Word.find_by_definition(self.id)
  end

end
