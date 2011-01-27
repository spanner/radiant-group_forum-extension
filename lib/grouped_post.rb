module GroupedPost

  def self.included(base)
    base.class_eval {
      has_group
      gets_group_from :topic
    }
  end

end
