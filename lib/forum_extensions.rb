module ForumExtensions
  def self.included(base)
    base.class_eval {
      has_and_belongs_to_many :groups
      alias inherited_groups groups

      def visible_by_default_with_groups?
        groups.empty? && visible_by_default_without_groups?           # ungrouped means visible to all
      end

      def visible_to_with_groups?(reader)
        return true if visible_by_default?                            # visible by default normally means 'has no groups'
        return false unless reader                                    # forum not visible by default and reader not logged in: no see
        return true if reader.is_admin?                               # reader attached to admin user sees all
        return true unless (groups & reader.groups).empty?            # if reader is in any permitted group: yes see
        return false                                                  # otherwise, no see
      end

      alias_method_chain :visible_to?, :groups
      alias_method_chain :visible_by_default?, :groups

      include InstanceMethods
    }
  end
  
  module InstanceMethods     
  
    def has_group?(group)
      return self.groups.include?(group)
    end
    
  end

end