describe UrlValidator do

  before do
    @validator = UrlValidator.new attributes: {}
  end

  context 'invalid input' do
    it 'should return false for a poorly formed URL' do
      @validator.url_valid?('something.com').should be_false
    end

    it 'should return false for garbage input' do
      pi = 3.14159265
      @validator.url_valid?(pi).should be_false
    end

    it 'should return false for URLs without an HTTP protocol' do
      @validator.url_valid?('ftp://secret-file-stash.net').should be_false
    end
  end

  context 'valid input' do
    it 'should return true for a correctly formed HTTP URL' do
      @validator.url_valid?('http://nooooooooooooooo.com').should be_true
    end

    it 'should return true for a correctly formed HTTPS URL' do
      @validator.url_valid?('https://google.com').should be_true
    end
  end

end