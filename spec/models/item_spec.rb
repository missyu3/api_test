require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Association' do
    let(:association) do
      described_class.reflect_on_association(target)
    end
    context "todos" do
      let(:target) { :todo }
      it { expect(association.macro).to eq :belongs_to }
    end
  end
  describe 'Validate' do
    it "登録ずみの文言だとNG" do
      item1 = build(:item)
      item2 = build(:item)
      item2.name = item1.name
      expect(item2.valid?).to eq(true)
    end
  end

end
