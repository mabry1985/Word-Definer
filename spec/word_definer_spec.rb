require 'rspec'
require 'word_definer'

describe('#word_definer') do
  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it('returns an empty array when there are no words') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#definition') do
    banana = Word.new({:word => 'Banana'})
    banana.save()
    banana.definitions = ['a fruit', 'dangerous weapon']
    banana.delete_definition('a dangerous weapon')
    it ('returns the array without the string passed') do
      expect(banana.definitions).to(eq(['a fruit']))
    end
  end


end
