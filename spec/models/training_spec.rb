require 'rails_helper'
RSpec.describe Training, type: :model do
  before do
    @training = FactoryBot.build(:training)
  end
  describe 'トレーニング記録の新規投稿' do
    context 'トレーニング記録の新規投稿がうまくいく時' do
      it 'titleとtrainingtime_id、part_id、eventが存在すれば登録できる' do
        expect(@training).to be_valid
      end
    end

    context 'トレーニング記録の新規投稿がうまくいかない時' do
      it 'トレーニングの目的が空だと登録できない' do
        @training.title = nil
        @training.valid?
        expect(@training.errors.full_messages).to include('目的を入力してください')
      end
      it 'トレーニングの合計時間の情報がないと登録できない' do
        @training.trainingtime_id = nil
        @training.valid?
        expect(@training.errors.full_messages).to include('合計時間を入力してください')
      end
      it 'トレーニングの合計時間の選択肢に『----』が選択されている場合は出品できない' do
        @training.trainingtime_id = 0
        @training.valid?
        expect(@training.errors.full_messages).to include('合計時間は0以外の値にしてください')
      end
      it 'トレーニングの部位について情報がないと登録できない' do
        @training.part_id = nil
        @training.valid?
        expect(@training.errors.full_messages).to include('部位を入力してください')
      end
      it 'トレーニングの合計時間の選択肢に『----』が選択されている場合は出品できない' do
        @training.part_id = 0
        @training.valid?
        expect(@training.errors.full_messages).to include('部位は0以外の値にしてください')
      end
      it 'トレーニングの種目が空だと登録できない' do
        @training.event = nil
        @training.valid?
        expect(@training.errors.full_messages).to include('種目を入力してください')
      end
    end
  end
end
