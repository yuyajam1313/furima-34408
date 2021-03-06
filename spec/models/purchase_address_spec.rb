require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep(0.5)
    end

    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'posral_codeが空だと購入できない' do
        @purchase_address.posral_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Posral code can't be blank")
      end
      it 'posral_codeがハイフンを含んだ正しい形式でないと購入できない' do
        @purchase_address.posral_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Posral code is invalid")
      end
      it 'area_idが空だと購入できない' do
        @purchase_address.area_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalitiesが空だと購入できない' do
        @purchase_address.municipalities = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'address_numberが空だと購入できない' do
        @purchase_address.address_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address number can't be blank")
      end
      it 'building_nameは空でも購入できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
      it 'phone_numberが空だと購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁か11桁でないと購入できない' do
        @purchase_address.phone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberにハイフンがあると購入できない' do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'tokenが空だと購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
