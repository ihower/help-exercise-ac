require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.create!(:email => "foobar@example.org", :password => "12345678")
  end

  describe "#posts_count" do
    before do
      other_user = User.create!(:email => "ooxx@example.org", :password => "12345678")
      m1 = Message.create!(:user => other_user)
      Comment.create!(:user => other_user, :message => m1)

      m2 = Message.create!(:user => @user)
      Comment.create!(:user => @user, :message => m2)
      Comment.create!(:user => @user, :message => m2)
    end

    it "回傳該使用者的總 Mesasge 數量加 Comment 數量" do
      expect(@user.posts_count).to eq(3)
    end
  end

  describe "#words_count" do
    before do
      @other_user = User.create!(:email => "ooxx@example.org", :password => "12345678")
      # 共60字 Message @user
      m1 =Message.create!(:user => @user,
                          :title => Faker::Lorem.sentence(10, false, 1),
                          :content => Faker::Lorem.sentence(50, false, 1))
      # 共20字 Comment @user
      Comment.create!(:user => @user,
                      :content => Faker::Lorem.sentence(20, false, 1),
                      :message_id => m1)
      # 共30字 Comment other_user
      Comment.create!(:user => @other_user,
                      :content => Faker::Lorem.sentence(30, false, 1),
                      :message_id => m1)
    end

    it "加總該使用者的所有 Mesasge 和 Comment 的總字數" do
      # TODO: 測試 words_count 方法
      expect(@user.words_count).to eq(80)
      expect(@other_user.words_count).to eq(30)
    end
  end

end
