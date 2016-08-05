class MessagesController < ApplicationController

  def data
    render json: Message.all
  end


  def index
    if current_user == nil
      redirect_to new_session_path, notice: "Please log in first"
    elsif current_user.approved == false
      render :alert
    end
  end

  def create
    emojified = emojify(params[:body])
    m = Message.create!(body: emojified, user: current_user, user_name: current_user.full_name)
    head :created
  end

  def destroy
    m = Message.find(params[:id])
    if m.user == current_user || current_user.admin == true
      m.destroy!
      head :ok
    else
      head :error
    end
  end

  def emojify(content)
    content.gsub(/:([\w+-]+):/) do |match|
      if emoji = Emoji.find_by_alias($1)
        Emoji.find_by_alias($1).raw
      else
        match
      end
    end
  end

end
