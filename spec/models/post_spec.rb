require 'spec_helper'

describe Post do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
    it { should validate_presence_of :author }
  end
  describe "associations" do
    it { should have_many(:comments) }
    it { should belong_to(:author) }
  end
end
