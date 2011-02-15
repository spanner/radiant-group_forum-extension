class GroupForumForumsDataset < Dataset::Base
  datasets = [:group_forum_groups]
  datasets << :group_forum_sites if defined? Site
  uses *datasets
  
  def load
    create_forum "Public"
    create_forum "Grouped", :groups => [groups(:chatty)]
    create_forum "Alsogrouped", :groups => [groups(:chatty)]
  end
  
  helpers do
    def create_forum(name, attributes={})
      attributes[:site] ||= sites(:test) if defined? Site
      create_model :forum, name.symbolize, attributes.update(:name => name)
    end
  end
 
end