require 'json'

include Capybara::DSL

class Configuration   

    def self.GetBrowser(headless,browser)
        case browser            
            when 1
                if headless
                    :selenium_chrome_headless
                
                else
                    :selenium_chrome      
            end          
            when 2
                if headless
                    return :selenium_firefox_headless
                
                else
                    return :selenium_firefox
            end
        end
    end

    obj = JSON.parse(File.read('Infra/Configuration/Config.json'))
   
    $close_browser_after_test = obj['CLOSE_BROWSER_AFTER_TEST']   
    $seconds_to_wait = obj['SECONDS_TO_WAIT']
    $print_path = obj['PRINT_PATH'] + '/' + ENV["USERNAME"]
    $browser = GetBrowser(obj['HEADLESS_BROWSER'],obj['BROWSER'])
    $server = obj['SERVER']   
    $clean_report_files = obj['CLEAN_REPORT_FILES']
   
    def Regex(text)
        chars = 'áàãâÁÀÃÂéèêÉÈÊíìÍÌóòÓÒ'
    end
end

