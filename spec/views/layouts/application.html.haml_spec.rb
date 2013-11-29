require 'spec_helper'

describe "layouts/application" do
  context "with the partial on the page" do
    it "should render the partial on the page" do
      render
      expect(view).to render_template(partial: '_header')
    end
  end
end
