require 'spec_helper'

describe Comment do
  describe "validations" do
    it { should validate_presence_of :commenter }
    it { should validate_presence_of :message }
  end
  describe "associations" do
    it { should belong_to :post }
  end
end
