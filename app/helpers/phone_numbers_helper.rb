module PhoneNumbersHelper
  
  def print_numbers(numbers)
    render :partial => "phone_number"
    items = numbers.collect do |n| 
      content_tag(:li, n.number + link_to("edit", edit_phone_number_path(n))).html_safe
    end
    
    content_tag :ul, items.join.html_safe
  end
end
