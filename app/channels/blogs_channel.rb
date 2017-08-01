class BlogsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "magics_#{params['magic_id']}_channel"
  end

  def unsubscribed
  end

  def send_comment(data)
    current_user.comments.create!(content: data['comment'], magic_id: data['magic_id'])
  end
end