require "informal"
class Contact
	include Informal::Model
	attr_accessor :name, :email, :subject, :body
	validates_presence_of :name, :email, :subject, :body

	validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

  def persisted?
    false
  end

end