require 'helper'
describe "/" do

  before do
    get '/'
  end

  it 'responds' do
    status.should == 200
  end

  it 'contains the expected title' do
    body.should =~ %r{<title>Dans &amp; Muziek in Kampenhout, Vlaams Brabant</title>}
  end

end
