require 'spec_helper'

describe Comment do
  describe "validations" do
    it { should validate_presence_of :commenter }
    it { should validate_presence_of :message }
  end
  describe "associations" do
    it { should belong_to :post }
    it { should belong_to :parent_comment }
    it { should have_many :replies }
  end
  describe "#is_reply?" do
    context "if there is a parent_comment" do
      it "should be true" do
        comment = Fabricate :comment , :parent_comment => Fabricate(:comment)
        comment.is_reply?.should be_true
      end
    end
    context "if there is not parent_comment" do
      it "should be false" do
        comment = Fabricate :comment
        comment.is_reply?.should be_false
      end
    end
  end
  describe "#type" do
    context "if it is a reply" do
      it "should be reply" do
        comment = Fabricate :reply
        comment.type.should == "reply"
      end
    end
    context "if it is not a reply" do
      it "should be a comment" do
        comment = Fabricate :comment
        comment.type.should == "comment"
      end
    end
  end
end
