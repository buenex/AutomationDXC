require_relative '../Infra/Base/BasePage.rb'

include BasePage

class Products_Page
    def click_item_elitepad(*)
        find(:xpath,'//div[@name="popular_item_16"]/a').click
    end

    def insert_quantity(quantity)
        find(:xpath,'//input[@name="quantity"]').set(quantity)
    end

    def get_quantity(*)
        return find(:xpath,'//input[@name="quantity"]').value
    end

    def click_cart(*)
        find(:xpath,'//button[@name="save_to_cart"]').click
    end

    def get_cart(*)
        if(has_selector?('#toolTipCart'))
            return true
        else
            return false
        end
    end 

    def click_Item_Elitepad(*)
        find(:xpath,'//div[@name="popular_item_16"]/a').click
    end
end