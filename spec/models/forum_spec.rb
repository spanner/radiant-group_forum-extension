require File.dirname(__FILE__) + '/../spec_helper'

describe Forum do
  dataset :group_forum_forums
  
  before do
    @site = Page.current_site = sites(:test) if defined? Site
  end
  
  it "should have a groups association" do
    Forum.reflect_on_association(:groups).should_not be_nil
  end
  
  describe "without a grouped reader" do
    it "should list only the ungrouped forums" do
      Forum.visible.count.should == 1
      Forum.visible_to(readers(:ungrouped)).count.should == 1
    end
  end
  
  describe "to a grouped reader" do
    it "should list also the forums of that group" do
      Forum.visible_to(readers(:normal)).count.should == 3
    end
  end

  describe "with a group" do
    it "should report itself visible to a reader who is a group member" do
      forums(:grouped).visible_to?(readers(:normal)).should be_true
    end
    it "should report itself invisible to a reader who is not a group member" do
      forums(:grouped).visible_to?(readers(:ungrouped)).should be_false
    end
  end

  describe "without a group" do
    it "should report itself visible to everyone" do
      forums(:public).visible_to?(readers(:normal)).should be_true
      forums(:public).visible_to?(readers(:ungrouped)).should be_true
    end
  end
end
