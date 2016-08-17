require 'rails_helper'
RSpec.describe Person do
  # ...
  describe 'relationships' do
    it 'has many secrets' do
      user = create_user
      secret1 = user.secret2s.create(content: 'secret 1')
      secret2 = user.secret2s.create(content: 'secret 2')
      expect(user.secret2s).to include(secret1)
      expect(user.secret2s).to include(secret2)
    end
    it 'has many likes' do
      user = create_user
      secret1 = user.secret2s.create(content: 'Oops')
      secret2 = user.secret2s.create(content: 'I did it again')
      like1 = Like2.create(person: user, secret2: secret1)
      like2 = Like2.create(person: user, secret2: secret2)
      expect(user.like2s).to include(like1)
      expect(user.like2s).to include(like2)
    end
  end
end