require_relative '../PageObject/Create_Account_Page.rb'
require_relative '../PageObject/Products_Page.rb'
require_relative '../PageObject/Index_Page.rb'
require_relative '../PageObject/Cart_Page.rb'
require_relative '../PageObject/Payment_Page.rb.rb'

describe 'Create Account' do
    path = ''
    cadastro_page_object = Create_Account_Page.new
    products_page_object = Products_Page.new
    index_page_object = Index_Page.new
    cart_page_object = Cart_Page.new
    payment_page_object = Payment_Page.new


    before(:each) do
        visit path
    end

    it 'Client register' do
        index_page_object.click_user   

        expect(cadastro_page_object.exist_login_modal?).to be true

        sleep 2

        cadastro_page_object.click_create_account

        cadastro_page_object.fill_fields('Teste','Teste@mail.com','Teste@1',true)

        expect(cadastro_page_object.get_username).not_to be_empty
        expect(cadastro_page_object.get_email).not_to be_empty
        expect(cadastro_page_object.get_password).not_to be_empty
        expect(cadastro_page_object.get_confirm_password).not_to be_empty
        expect(cadastro_page_object.get_agree).to be true

        cadastro_page_object.click_register
        sleep 2

        expect(current_url).to eq 'http://advantageonlineshopping.com/#/'
        expect(cadastro_page_object.get_username_text).to eq 'Teste'
    end

    it 'Client register and make order' do
        index_page_object.click_user   

        expect(cadastro_page_object.exist_login_modal?).to be true

        sleep 2

        cadastro_page_object.click_create_account

        cadastro_page_object.fill_fields('Teste','Teste@mail.com','Teste@1',true)

        expect(cadastro_page_object.get_username).not_to be_empty
        expect(cadastro_page_object.get_email).not_to be_empty
        expect(cadastro_page_object.get_password).not_to be_empty
        expect(cadastro_page_object.get_confirm_password).not_to be_empty
        expect(cadastro_page_object.get_agree).to be true

        cadastro_page_object.click_register
        sleep 2

        expect(current_url).to eq 'http://advantageonlineshopping.com/#/'
        expect(cadastro_page_object.get_username_text).to eq 'Teste'

        products_page_object.click_item_elitepad
        expect(current_url).to eq 'http://advantageonlineshopping.com/#/product/16'

        products_page_object.insert_quantity(4)
        expect(products_page_object.get_quantity).to eq '4'

        products_page_object.click_cart
        expect(products_page_object.get_cart).to be true

        cart_page_object.click_checkout
        expect(current_url).to eq 'http://advantageonlineshopping.com/#/orderPayment'

        payment_page_object.click_next
        payment_page_object.set_credit_mastercredit

        payment_page_object.insert_card_number('111111111111')
        payment_page_object.insert_cvv('111')
        payment_page_object.choose_expiration_date_month(4)
        payment_page_object.choose_expiration_date_year(5)
        payment_page_object.insert_card_holder_name('teste teste')

        expect(payment_page_object.get_card_number).to eq '1111 1111 1111'
        expect(payment_page_object.get_cvv).to eq '111'
        expect(payment_page_object.get_expiration_date_month).to eq '04'
        expect(payment_page_object.get_expiration_date_year).to eq '2024'
        expect(payment_page_object.get_card_holder_name).to eq 'teste teste'

        payment_page_object.click_pay_now
        expect(payment_page_object.get_conclude_payment).to be true

        index_page_object.click_user
        index_page_object.click_sign_out
    end

    it 'Client register and make order' do
        index_page_object.click_user   

        expect(cadastro_page_object.exist_login_modal?).to be true

        sleep 2

        cadastro_page_object.click_create_account

        cadastro_page_object.fill_fields('Teste','Teste@mail.com','Teste@1',true)

        expect(cadastro_page_object.get_username).not_to be_empty
        expect(cadastro_page_object.get_email).not_to be_empty
        expect(cadastro_page_object.get_password).not_to be_empty
        expect(cadastro_page_object.get_confirm_password).not_to be_empty
        expect(cadastro_page_object.get_agree).to be true

        cadastro_page_object.click_register
        sleep 2

        expect(current_url).to eq 'http://advantageonlineshopping.com/#/'
        expect(cadastro_page_object.get_username_text).to eq 'Teste'

        products_page_object.click_item_elitepad
        expect(current_url).to eq 'http://advantageonlineshopping.com/#/product/16'

        products_page_object.insert_quantity(4)
        expect(products_page_object.get_quantity).to eq '4'

        products_page_object.click_cart
        expect(products_page_object.get_cart).to be true

        cart_page_object.click_checkout
        expect(current_url).to eq 'http://advantageonlineshopping.com/#/orderPayment'

        payment_page_object.click_next
        payment_page_object.set_credit_mastercredit

        payment_page_object.insert_card_number('111111111111')
        payment_page_object.insert_cvv('111')
        payment_page_object.choose_expiration_date_month(4)
        payment_page_object.choose_expiration_date_year(5)
        payment_page_object.insert_card_holder_name('teste teste')

        expect(payment_page_object.get_card_number).to eq '1111 1111 1111'
        expect(payment_page_object.get_cvv).to eq '111'
        expect(payment_page_object.get_expiration_date_month).to eq '04'
        expect(payment_page_object.get_expiration_date_year).to eq '2024'
        expect(payment_page_object.get_card_holder_name).to eq 'teste teste'

        payment_page_object.click_pay_now
        expect(payment_page_object.get_conclude_payment).to be true

        payment_page_object.insert_into_sheet(payment_page_object.get_tracking_number,5)
        payment_page_object.insert_into_sheet(payment_page_object.get_ording_number,6)

        index_page_object.click_user
        index_page_object.click_sign_out
    end
end