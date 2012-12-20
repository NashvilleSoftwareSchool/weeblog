require 'spec_helper'

describe Post do
  
  before do
   current_user = User.new(email: "sam@gray.com", password: "foo", password_confirmation: "foo")
   @post = Post.new(title: "foo", body: "my body here")
  end
  subject { @post }
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
    it { should validate_presence_of :author }
  end
  describe "associations" do
    it { should have_many(:comments) }
    it { should belong_to(:author) }
  end
  describe "video validation" do
    it "only validates url if there is video title" do
      video_title = "foo video"
      pending ("must associate author_id to post")
      @post.should_not be_valid
      @post.errors.should include("video_url can't be blank")
    end
  end
end
