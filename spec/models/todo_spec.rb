require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe 'Association' do
    context "items" do
      it "itemsとhas_many関係であるか" do 
        association =  described_class.reflect_on_association(:items)
        expect(association.macro).to eq :has_many
      end
    end
  end
  describe 'Validate' do
    context "title" do
      it "登録ずみの文言だとNG" do
        todo1 = create(:todo)
        todo2 = build(:todo)
        todo2.title = todo1.title
        expect(todo2.valid?).to eq(true)
      end
    end
  end
  describe 'CRUD' do
    context "destroy" do
      it "紐づくitemが削除された時、同時に削除されるか" do
        item = create(:item)
        todo = item.todo
        expect{ todo.destroy}.to change{ Item.count }.by(-1)
      end
    end
  end
end
