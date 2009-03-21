class GroupForumExtension < Radiant::Extension
  version "0.1"
  description "Just a bit of glue between reader_groups and forum"
  url "http://spanner.org/radiant/group_forums"
  
  def activate
    Group.send :include, GroupExtensions
    Forum.send :include, ForumExtensions
    
    admin.forum.edit.add :form, "forum_groups"
    admin.group.edit.add :form, "group_forums"
  end
  
  def deactivate
  end
  
end
