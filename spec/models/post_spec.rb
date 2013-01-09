require 'spec_helper'
require 'capybara'

describe Post do
  
  before do
   @current_user = User.new(email: "sam@example.com", password: "foo", password_confirmation: "foo")
   @current_user.save
   @post = Post.new(title: "foo", body: "my body here")
   @post.author = @current_user
  end
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
    it { should validate_presence_of :author }
    it "is not valid without a title" do
      @post.title = ""
      @post.should_not be_valid
    end
    it "is not valid without a body" do
      @post.body = ""
      @post.should_not be_valid
    end
    it "is not valid without an author" do
      @post.author = nil
      @post.should_not be_valid
    end
  end
  describe "associations" do
    it { should have_many(:comments) }
    it { should belong_to(:author) }
  end
  context "video title but no video url" do
    describe "video validation" do    
      it "only validates title if there is video url" do
        @post.video_title = "foo video"
        @post.video_url = ""
        @post.should_not be_valid
        @post.should have_at_least(1).error_on(:video_url)
      end
    end
  end
  context "video url but no video title" do
    describe "video validation" do    
      it "only validates url if there is video title" do
        @post.video_url = "http://sam.com"
        @post.video_title = ""
        @post.should_not be_valid
        @post.should have_at_least(1).error_on(:video_title)
      end
    end
  end
  context "happy path" do
    describe "validates with video links" do    
      it "validates with video url and video title" do
        @post.video_url = "http://sam.com"
        @post.video_title = "my title"
        @post.save
        expect(Post.count).to eq 1
      end
    end
  end
end
