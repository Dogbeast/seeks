require 'rails_helper'
RSpec.describe Like2, type: :model do
  describe 'relationships' do
    before do
      @person = create_user
      @secret = @person.secret2s.create(content: 'Oops')
      @like = Like2.create(person: @person, secret2: @secret)
    end
    it 'belongs to a user' do
      expect(@like.person).to eq(@person)
    end
    it 'belongs to a secret' do
      expect(@like.secret2).to eq(@secret)
    end
  end
end