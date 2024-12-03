require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '配送先情報の登録' do
    context '配送先情報を登録できる場合' do
      it '郵便番号・都道府県・市区町村・番地・電話番号が存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
    end
    
    context '配送先情報を登録できない場合' do
      it '郵便番号が空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が「３桁-4桁」でなければ登録できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code input correctly")
      end
      it '郵便番号が半角数字でなければ登録できない' do
        @order_address.postal_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code input correctly")
      end
      it '都道府県が「---」（id=1)では登録できない' do
        @order_address.region_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Region Select")
      end
      it '市区町村が空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空では登録できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号が半角数字のみでなければ登録できない' do
        @order_address.phone = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone input only number")
      end
      it '電話番号が10~11桁でなければ登録できない' do
        @order_address.phone = '090'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is too short")
      end
      it 'userが紐づいていないと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end