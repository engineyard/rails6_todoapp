class CompletedController < ApplicationController

    def update
      @todo = Todo.find(params[:id])
      @todo.done = !@todo.done
      @todo.save
      respond_to do |format|
        format.html { redirect_to todos_url, notice: "Todo was successfully updated." }
        format.json { head :no_content }
      end
    end
  
  end