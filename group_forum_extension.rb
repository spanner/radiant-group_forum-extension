class GroupForumExtension < Radiant::Extension
  version "0.2"
  description "Just a bit of access-control glue joining reader_groups to forum"
  url "http://spanner.org/radiant/group_forums"
  
  def activate
    Group.send :include, GroupExtensions
    Forum.send :include, ForumExtensions
    ForumsController.send :include, ForumsControllerExtensions
    TopicsController.send :include, TopicsControllerExtensions
    PostsController.send :include, PostsControllerExtensions

    unless admin.forum.edit.form && admin.forum.edit.form.include?("forum_groups")
      admin.forum.edit.add :form, "forum_groups"
    end
  end
  
  def deactivate
  end
  
end
