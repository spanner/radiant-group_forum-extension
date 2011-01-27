module GroupedForum

  def self.included(base)
    base.class_eval {
      has_group
      gives_group_to :topics  # which in turn give it to posts
    }
  end

end
