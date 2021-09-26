require 'rails_helper'

RSpec.describe Procedure, type: :model do
  describe "Procedureモデルのテスト" do
    before do
      @procedure = FactoryBot.build(:procedure)  
    end
    
    it "有効なモデルを持つこと" do
      expect(FactoryBot.create(:procedure)).to be_valid
    end
    
    it "recipe_idがなければ無効な状態であること" do
      @procedure.recipe_id = nil
      @procedure.valid?
      expect(@procedure.errors[:recipe_id]).to include("を入力してください")
    end
    
    it "bodyがなければ無効な状態であること" do
      @procedure.body = nil
      @procedure.valid?
      expect(@procedure.errors[:body]).to include("を入力してください")
    end
  end
end