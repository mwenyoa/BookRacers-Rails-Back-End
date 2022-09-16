require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before :each do
    @user = User.create(name: 'John', email: 'user@gmail.com', password: 'password123',
                        password_confirmation: 'password123')
    @category = Category.create(catname: 'Sport Racer')
    @motorcycle = Motorcycle.create(brand: 'Yamaha', model: 'R1', year: 2019,
                                    image: 'https://www.yamaha-motor.com.ph/uploads/2019/01/2019-Yamaha-YZF-R1M-1.jpg',
                                    rental_price: 400, category_id: @category.id)
  end
  context 'validations' do
    it 'should be valid with valid attributes' do
      @reservation = Reservation.new(user_id: @user.id, motorcycle_id: @motorcycle.id, created_at: Date.today,
                                     updated_at: Date.today + 1.day)
      @reservation.save
      expect(@reservation).to be_valid
    end

    it 'should be invalid without a user' do
      @reservation = Reservation.new(user_id: nil, motorcycle_id: @motorcycle.id, created_at: Date.today,
                                     updated_at: Date.today + 1.day)
      @reservation.save
      expect(@reservation).to_not be_valid
    end

    it 'should be invalid without a motorcycle' do
      @reservation = Reservation.new(user_id: @user.id, motorcycle_id: nil, created_at: Date.today,
                                     updated_at: Date.today + 1.day)
      @reservation.save
      expect(@reservation).to_not be_valid
    end
  end
  context 'associations' do
    it 'belongs to user' do
      associate = described_class.reflect_on_association(:user)
      expect(associate.macro).to eq :belongs_to
    end
    it 'belongs to motorcycle' do
      associate = described_class.reflect_on_association(:motorcycle)
      expect(associate.macro).to eq :belongs_to
    end
  end
end