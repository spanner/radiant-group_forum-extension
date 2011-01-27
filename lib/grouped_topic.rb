module GroupedTopic

  def self.included(base)
    base.class_eval {
      has_group
      gets_group_from :forum
      gives_group_to :posts
    }
  end

end
