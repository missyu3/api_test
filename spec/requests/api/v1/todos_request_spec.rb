require 'rails_helper'

RSpec.describe "Todos", type: :request do
  describe "GET /todo" do
    it "returns http success" do
      get "/api/v1/todos"
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET /show" do
    it "returns http success" do
      todo = create(:todo)
      get "/api/v1/todos/#{todo.id}"
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET /show" do
    it "returns todo.title" do
      todo = create(:todo)
      get "/api/v1/todos/#{todo.id}"
      expect(response.body).to include(todo.title)
    end
    it "ユーザーが存在しない場合" do
      todo = create(:todo)
      get "/api/v1/todos/#{todo.id + 1}"
      is_expected.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
