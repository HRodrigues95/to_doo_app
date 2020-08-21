module ApplicationHelper
  def full_title(page_title = '')
    # Use single quote ('') for simple string
    # Use double quote ("") for string interpolation (e.g. "Hello #{name_var}!")
    base_title = 'TO DOO APP (Learning Experience)'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
end
