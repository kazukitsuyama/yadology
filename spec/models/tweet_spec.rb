require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe '記事投稿機能' do
    context '記事の投稿できる時' do
      it '全ての項目の入力が存在すれば投稿できる' do
        expect(@tweet).to be_valid
      end
    end

    context '記事の投稿できない時' do
      it 'yado_titleが空' do
        @tweet.yado_title = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Yado titleを入力してください")
      end

      it 'yado_nameが空' do
        @tweet.yado_name = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Yado nameを入力してください")
      end

      it 'textが空' do
        @tweet.text = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Textを入力してください")
      end

      it 'dateが空' do
        @tweet.date = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Dateを入力してください")
      end

      it 'priceが空' do
        @tweet.price = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Priceを入力してください")
      end

      it 'area_idが空（---）のとき' do
        @tweet.area_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Areaは1以外の値にしてください')
      end

      it 'imageが空' do
        @tweet.images = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Imagesを入力してください")
      end

      it 'priceが全角数字' do
        @tweet.price = '５００'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Priceは数値で入力してください')
      end

      it 'priceが半角英数混合' do
        @tweet.price = '５００1'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Priceは数値で入力してください')
      end

      it 'priceが半角英字のみ' do
        @tweet.price = 'abc'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Priceは数値で入力してください')
      end
    end
  end
end
