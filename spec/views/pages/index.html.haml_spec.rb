require 'spec_helper'

describe "pages/index.html.haml" do
  context 'when rendering page' do
    it 'should have text' do
      render template: "pages/index.html.haml"
    end
  end
end
