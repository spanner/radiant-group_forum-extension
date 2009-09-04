class GroupForumExtension < Radiant::Extension
  version "0.1"
  description "Just a bit of glue between reader_groups and forum"
  url "http://spanner.org/radiant/group_forums"
  
  def activate
    Group.send :include, GroupExtensions
    Forum.send :include, ForumExtensions

    unless admin.forum.edit.form && admin.forum.edit.form.include?("forum_groups")
      admin.forum.edit.add :form, "forum_groups"
    end
  end
  
  def deactivate
  end
  
end
