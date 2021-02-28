require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

before do
  @item = FactoryBot.build(:item)
end

describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'nameとdescriptionとcategory_idとstatus_idとdeliveryfee_idとarea_idとdeliveryday_idとpriceとuserとimageが存在すれば出品できること' do
        expect(@item).to be_valid
      end 
    end

    context '商品出品がうまくいかないとき' do
      it 'nameが空では出品できない ' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descripitonが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idが空では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'deliveryfee_idが空では出品できない' do
        @item.deliveryfee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryfee must be other than 1")
      end
      it 'area_idが空では出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it 'deliveryday_idが空では出品できない' do
        @item.deliveryday_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryday must be other than 1")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'ユーザーが紐ついていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
