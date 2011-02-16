class GroupForumExtension < Radiant::Extension
  version "0.6.1"
  description "Just a bit of access-control glue joining reader_groups to forum"
  url "http://spanner.org/radiant/group_forums"
  
  def activate
    Forum.send :has_groups
    Topic.send :include, GroupedTopic           # scopes and retrieval methods that check forum group permissions
    Post.send :include, GroupedPost             # (giving Post and Topic the same visibility calls as Forum even though they don't have direct group links)
    Page.send :include, GroupForumTags          # a few tags for listing forums and latest topics on group pages
    ForumBaseController.send :include, GroupedControllerExtensions

    unless admin.forum.edit.form && admin.forum.edit.form.include?("forum_group")
      admin.forum.edit.add :form, "forum_group"
    end
  end
  
  def deactivate
  end
  
end
