require_relative '../Infra/Base/BasePage.rb'

include BasePage

class Create_Account_Page    

    def exist_login_modal?
        if(has_selector?(:xpath,'//login-modal'))
            return true
        else
            return false
        end
    end

    def click_create_account(*)
        find('.create-new-account').click
    end

    def insert_username(username)
        find_field('usernameRegisterPage').set(username)
    end

    def get_username(*)
        return find_field('usernameRegisterPage').value
    end

    def insert_email(email)
        find_field('emailRegisterPage').set(email)
    end

    def get_email(*)
        return find_field('emailRegisterPage').value
    end

    def insert_password(password)
        find_field('passwordRegisterPage').set(password)
    end

    def get_password(*)
        return find_field('passwordRegisterPage').value
    end

    def insert_confirm_password(confirm_password)
        find_field('confirm_passwordRegisterPage').set(confirm_password)
    end

    def get_confirm_password(*)
        return find_field('confirm_passwordRegisterPage').value
    end

    def check_agree(state)
        find_field('i_agree').set(state)
    end

    def get_agree(*)
        return find_field('i_agree').checked?
    end

    def get_username_text(*)
        return find(:xpath,'//*[@id="menuUserLink"]/span').text
    end

    def click_register(*)
        find('#register_btnundefined').click
    end

    def fill_fields(username,email,password,i_agree)
        insert_username(username)
        insert_email(email)
        insert_password(password)
        insert_confirm_password(password)
        check_agree(i_agree)
    end
end