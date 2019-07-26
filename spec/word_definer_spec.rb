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

  describe()


end
