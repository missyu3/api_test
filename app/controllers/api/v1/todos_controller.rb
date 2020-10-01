module Api
  module V1
    class TodosController < ApplicationController
      before_action :set_todo, only: [:show, :update, :destroy]

      def index
        todos = Todo.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded posts', data: todos }
      end

      def show
        if @todo.present?
          render json: { status: 'SUCCESS', message: 'Loaded the post', data: @todo }
        else
          render json: { status: '422', message: 'No ID', data: @todo.errors }
        end
      end

      def create
        todo = Todo.new(post_params)
        if todo.save
          render json: { status: 'SUCCESS', data: todo }
        else
          render json: { status: 'ERROR', data: todo.errors }
        end
      end

      def destroy
        @todo.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the post', data: @todo }
      end

      def update
        if @todo.update(post_params)
          render json: { status: 'SUCCESS', message: 'Updated the post', data: @todo }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @todo.errors }
        end
      end

      private

      def set_todo
        @todo = Todo.find_by(params[:id])
      end

      def post_params
        params.require(:todo).permit(:title)
      end
    end
  end
end