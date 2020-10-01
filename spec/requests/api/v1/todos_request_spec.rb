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
    it "returns todo.title" do
      todo = create(:todo)
      get "/api/v1/todos/#{todo.id}"
      expect(JSON.parse(response.body)["data"]["title"]).to eq(todo.title)
    end
  end
  describe "POST /create" do
    it "returns http success" do
      todo = attributes_for(:todo)
      a = post "/api/v1/todos", params: { todo: todo } 
      expect(response.status).to eq(200)
    end
    it "returns todo.title" do
      todo = attributes_for(:todo)
      a = post "/api/v1/todos", params: { todo: todo } 
      expect(JSON.parse(response.body)["data"]["title"]).to eq(todo[:title])
    end
  end
  describe "Put /update" do
    it "returns http success" do
      todo1 = create(:todo)
      update_value = attributes_for(:todo)
      update_value[:title] = "title_update"
      put "/api/v1/todos/#{todo1.id}", params: { todo: update_value } 
      expect(response.status).to eq(200)
    end
    it "returns todo.title" do
      todo1 = create(:todo)
      update_value = attributes_for(:todo)
      update_value[:title] = "title_update"
      put "/api/v1/todos/#{todo1.id}", params: { todo: update_value } 
      expect(JSON.parse(response.body)["data"]["title"]).to eq(update_value[:title])
    end
    describe "delete /delete" do
      it "returns http success" do
        todo = create(:todo)
        delete "/api/v1/todos/#{todo.id}"
        expect(response.status).to eq(200)
      end
      it "returns http success" do
        todo = create(:todo)
        delete "/api/v1/todos/#{todo.id}"
        expect(response.status).to eq(200)
      end
      it "returns http success" do
        todo = create(:todo)
        delete "/api/v1/todos/#{todo.id}"
        expect(JSON.parse(response.body)["data"]["id"]).to eq(todo.id)
      end
    end
  end
end