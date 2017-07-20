module Api
  module V1
    class BooksController < ApplicationController
      respond_to :json
      def index
        books = Book.order("created_at DESC")
        render json: {status: 'SUCCESS', message:'Loaded books', data:books},status: :ok
      end

      def show
        book = Book.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded books', data:book},status: :ok

      end
      def create
        book = Book.new(book_params)
        if book.save
          render json: {status: 'SUCCESS', message:'Created book', data:book},status: :ok
        else
          render json: { errors: book.errors }, status: 422
        end
      end

      def destroy
        book = Book.find(params[:id])
        book.destroy
        render json: {status: 'SUCCESS', message:'Deleted book', data:book},status: :ok
      end

      def update
        book = Book.find(params[:id])
        if book.update_attributes(book_params)
          render json: {status: 'SUCCESS', message:'Updated book', data:book},status: :ok
        else
          render json: {status: 'ERROR', message:'Book not updated', data:book.errors},status: :unprocessable_entity
        end
      end
      private

      def book_params
        params.require(:book).permit(:name, :page_count, :state, :author, :category_id, :book_img)
      end

    end
  end
end
