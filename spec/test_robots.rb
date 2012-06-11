require 'helper'
describe "/robots.txt" do

  before do
    get '/robots.txt'
  end

  it 'respond' do
    status.should == 200
    content_type.should =~ %r{text/plain}
  end

end