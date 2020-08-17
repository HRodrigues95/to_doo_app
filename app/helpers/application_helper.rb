module ApplicationHelper

  def full_title(page_title = '')
    base_title = "TO DOO APP (Learning Experience)"
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
  
end
