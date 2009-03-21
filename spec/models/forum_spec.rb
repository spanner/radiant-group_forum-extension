require File.dirname(__FILE__) + '/../spec_helper'

describe Forum do
  dataset :group_forum_groups
  
  before do
    @site = Page.current_site = sites(:test) if defined? Site
  end
  
  it "should have a groups association" do
    Forum.reflect_on_association(:groups).should_not be_nil
  end

  it "should have a number of groups" do
    forum = forums(:grouped)
    forum.groups.any?.should be_true
    forum.groups.size.should == 1
  end
  
  describe "with groups" do
    it "should report itself visible to a reader who is a group member" do
      forums(:grouped).visible_to?(readers(:ungrouped)).should be_false
    end
    it "should report itself invisible to a reader who is not a group member" do
      forums(:grouped).visible_to?(readers(:normal)).should be_true
    end
  end

end
