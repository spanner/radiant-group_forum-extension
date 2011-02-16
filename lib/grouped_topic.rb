module GroupedTopic
  
  def self.included(base)
    base.class_eval {
      # this overwrites the similarly named stub method in Topic
      named_scope :visible_to, lambda { |reader| 
        if reader.nil? || reader.groups.empty?
          conditions = "pp.group_id IS NULL"
        else
          ids = reader.group_ids
          conditions = reader.nil? ? "pp.group_id IS NULL" : ["pp.group_id IS NULL OR pp.group_id IN(#{ids.map{"?"}.join(',')})", *ids]
        end
        {
          :joins => "INNER JOIN forums on topics.forum_id = forums.id LEFT OUTER JOIN permissions as pp on pp.permitted_id = forums.id AND pp.permitted_type = 'Forum'",
          :group => column_names.map { |n| self.table_name + '.' + n }.join(','),
          :conditions => conditions,
          :readonly => false
        } 
      } do
        def count
          length
        end
      end
    }
  end
end



