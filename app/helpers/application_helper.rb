module ApplicationHelper
    include FontAwesome::Rails::IconHelper
    
    # helper to set the page title within the page view
	def full_title(page_title = '')
    base_title = "ChatNoir, Best place to buy vintage art"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
    end

end
