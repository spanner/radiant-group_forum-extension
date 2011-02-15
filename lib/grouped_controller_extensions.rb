module GroupedControllerExtensions
  
  def self.included(base)
    base.class_eval {
      before_filter :require_visibility_to_reader

    protected
      
      def require_visibility_to_reader
        if @page && !@page.visible_to?(current_reader)
          flash[:error] = t("page_not_public")
          redirect_to reader_permission_denied_url
          return false
        end
        
        if @forum && !@forum.visible_to?(current_reader)
          flash[:error] = "forum_not_public"
          redirect_to reader_permission_denied_url
          return false
        end
      end
    }
  end
end



