require_relative '../Infra/Base/BasePage.rb'

include BasePage

class Products_Page
    def click_cart(*)
        find('#shoppingCartLink').click
    end

    def click_user(*)
        find('#menuUserLink').click
    end

    def click_sign_out(*)
        find(:xpath,'//label[text()="Sign out"]').click
    end
end