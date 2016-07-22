class Api::V1::MessagesController < ApiController

  def index
    # 列出所有 Message 訊息，包括 id, status, category_name, title, content 和 created_at。

    messages = Message.all

    datas = []

    messages.each do |m|
      datas << {:id => m.id, :status => m.status, :category_name => m.category_name,
       :title => m.title, :content => m.content, :created_at => m.created_at}
    end

    result = {:datas => datas}

    render :json => result.to_json, :status => 200

  end
end