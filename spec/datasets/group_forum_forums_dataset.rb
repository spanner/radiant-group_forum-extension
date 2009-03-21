class GroupForumForumsDataset < Dataset::Base
  uses :group_forum_sites if defined? Site
  
  def load
    create_forum "Public"
    create_forum "Grouped"
    create_forum "Alsogrouped"
  end
  
  helpers do
    def create_forum(name, attributes={})
      attributes[:site] ||= sites(:test) if defined? Site
      create_model :forum, name.symbolize, attributes.update(:name => name)
    end
  end
 
end