class ChatsController < ApplicationController

  def show
    # どのユーザーとチャットするかを取得。
    @user = User.find(params[:id])
    # ログインしているユーザーのuser_roomにあるroom_idの値の配列をroomsに代入。
    rooms = current_user.user_rooms.pluck(:room_id)
    # user_roomモデルからuser_idがチャット相手のidが一致するものと、
    # room_idが上記roomsのどれかに一致するレコードをuser_roomsに代入。
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

    # もしuser_roomが空でないなら
    unless user_rooms.nil?
      # @roomに上記user_roomのroomを代入。
      @room = user_rooms.room
    else
      # 新しくroomを作り、user_roomをログインしているユーザー分とチャット相手分を作る。
      @room = Room.new
      @room.save
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: @user.id, room_id: @room.id)
    end
    # roomに紐づくchatsテーブルのレコードを@chatsに代入。
    @chats = @room.chats
    # room.idを@chatに代入。
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end

end
