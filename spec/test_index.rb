require 'helper'
describe "/" do

  before do
    get '/'
  end

  it 'contains markdown generated content' do
    status.should == 200
    body.should =~ %r{<p>Dans en Muziek Kampenhout verenigt}
  end

end
