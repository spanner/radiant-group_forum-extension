module ForumExtensions
  def self.included(base)
    base.class_eval {
      has_and_belongs_to_many :groups
      alias inherited_groups groups

      def visible_by_default_with_groups?
        groups.empty? && visible_by_default_without_groups?
      end

      # Forum.visible_to, w
      def visible_to_with_groups?(reader)
        return true if reader.is_admin?
        return true if visible_by_default?
        return false if reader.nil?
        return false if reader.groups.empty?
        return true unless (self.groups & reader.groups).empty?
        return false
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