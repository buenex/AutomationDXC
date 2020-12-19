require_relative '../Infra/Base/BasePage.rb'

include BasePage

class Payment_Page 
    def click_next(*)
        find('#next_btn').click
    end

    def set_credit_mastercredit(*)
        find(:xpath,'//input[@name="masterCredit"]').click
    end

    def insert_card_number(card_number)
        find('#creditCard').set(card_number)
    end

    def get_card_number(*)
        return find('#creditCard').value
    end

    def insert_cvv(cvv)
        find(:xpath,'//input[@name="cvv_number"]').set(cvv)
    end

    def get_cvv(*)
        return find(:xpath,'//input[@name="cvv_number"]').value
    end

    def choose_expiration_date_month(index)
        get_all_item_on_list('//select[@name="mmListbox"]',:xpath)[index].click
    end

    def get_expiration_date_month(*)
        return find(:xpath,'//select[@name="mmListbox"]').value
    end

    def choose_expiration_date_year(index)
        get_all_item_on_list('//select[@name="yyyyListbox"]',:xpath)[index].click
    end

    def get_expiration_date_year(*)
        return find(:xpath,'//select[@name="yyyyListbox"]').value
    end

    def insert_card_holder_name(card_holder_name)
        find('//input[@name="card_holder_name"]').set(card_holder_name)
    end

    def get_card_holder_name(*)
        return find(:xpath,'//input[@name="card_holder_name"]').value
    end

    def click_pay_now(*)
        find('#pay_now_btn_ManualPayment').click
    end

    def get_conclude_payment(*)
        if(has_selector?('#trackingNumberLabel'))
            return true
        else
            return false
        end
        
    end

    def get_tracking_number(*)
        return find('#trackingNumberLabel').text
    end

    def get_ording_number(*)
        return find('#orderNumberLabel').text
    end
end 