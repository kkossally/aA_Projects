require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) } 
  it { should validate_presence_of(:password_digest) } 
  it { should validate_presence_of(:session_token) } 
  it { should validate_length_of(:password).is_at_least(6) }
  
  describe 'uniqueness' do
    before :each do
      create(:user)
    end

    it { should validate_uniqueness_of(:username)}
    it { should validate_uniqueness_of(:session_token)}
  end

  describe '#is_password?' do
    let!(:user) { create(:user) }

    context 'with valid credentials' do
      it 'returns true' do
        expect(user.is_password?('figvaper')).to be true
      end
    end
    
    context "with invalid credentials" do
      it 'returns false' do
        expect(user.is_password?('pigfaker')).to be false
      end
    end 
  end

  describe '::find_by_credentials' do
    let!(:user) { User.create!(username: 'earlgrey', password: 'figvaper') }

    it 'locates the user in the database' do
      expect(User.find_by_credentials('earlgrey', 'figvaper')).to eq(user)
    end
  end

  describe 'password_digest' do
    let!(:user) { User.create(username: 'Earlgrey', password: 'figvaper') }
     
    it 'encrypts the password' do 
      expect(user.password_digest).not_to be('figvaper')
    end
  end

  describe '#ensure_session_token' do
    let!(:user) { User.create(username: 'Earlgrey', password: 'figvaper') }

    it 'checks that the user has a session token' do
      expect(user.session_token).not_to be_nil
    end 
  end


  describe '#reset_session_token!' do
    it 'assigns a session_token if one is not given' do
      billy = User.create(username: 'billy', password: 'slasher')
      old_token = billy.session_token
      billy.reset_session_token!
      expect(billy.session_token).not_to eq(old_token)
    end
  end


end