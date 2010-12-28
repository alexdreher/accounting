module ApplicationHelper
  def display_accounts(accounts)
    ret = "<ul>"
    
    accounts.each do |account|
      if account.parent.nil?
        bgcolor = (account.bookable) ? '' : '#cccccc'
		    ret += "<li>"
    		ret += link_to "#{account.number} #{account.title}", account_transactions_path(account), :style => "background-color:#{bgcolor}"
    		ret += find_all_subaccounts(account) unless account.children.empty?
    		ret += "</li>"
	    end
    end
    
    ret += "</ul>"
  end

  def find_all_subaccounts(account)
    if account.children.size > 0
      ret = '<ul>'
      account.children.each { |subcat| 
        bgcolor = (subcat.bookable) ? '' : '#cccccc'
        if subcat.children.size > 0
          ret += "<li>"
          ret += link_to "#{subcat.number} #{subcat.title}", account_transactions_path(subcat), :style => "background-color:#{bgcolor}"
          ret += find_all_subaccounts(subcat)
          ret += '</li>'
        else
          ret += "<li>"
          ret += link_to "#{subcat.number} #{subcat.title}", account_transactions_path(subcat), :style => "background-color:#{bgcolor}"
          ret += '</li>'
        end
        }
      ret += '</ul>'
    end
  end
end
