require 'digest/sha1'
class GroupForumGroupsDataset < Dataset::Base
  uses :group_forum_forums, :group_forum_readers, (:group_forum_sites if defined? Site)

  def load
    create_group "Normal"
    create_group "Chatty"

    add_readers_to_group :chatty, [:normal, :another]
    add_forums_to_group :chatty, [:grouped, :alsogrouped]
  end
  
  helpers do
    def create_group(name, att={})
      group = create_record Group, name.symbolize, group_attributes(att.update(:name => name))
    end
    
    def group_attributes(att={})
      name = att[:name] || "A group"
      attributes = { 
        :name => name,
        :description => "Test group"
      }.merge(att)
      attributes[:site_id] ||= site_id(:test) if defined? Site
      attributes
    end
  end
    
  def add_readers_to_group(g, rr)
    g = g.is_a?(Group) ? g : groups(g)
    g.readers <<  rr.map{|r| readers(r)}
  end
  
  def add_forums_to_group(g, ff)
    g = g.is_a?(Group) ? g : groups(g)
    g.forums <<  ff.map{|f| forums(f)}
  end
  
end