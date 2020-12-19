require_relative '../Infra/Base/BasePage.rb'

include BasePage

class Cart_Page    
    def click_checkout(*)
        find('#checkOutButton').click
    end
end