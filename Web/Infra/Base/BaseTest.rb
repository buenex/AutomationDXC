
module BaseTest
    
    def BeforeSuite()                      
        
    end

    def BeforeContext()

    end

    def BeforeExample()

    end

    def AfterSuite()        
        
    end

    def AfterExample(e)
        name = Utils.ReplaceCharacters(Utils.ConvertToUpperSmall(false,e.description))
        test_name = Utils.PrepareTestName(e.id.to_s)
        page.save_screenshot(Utils.PreparePathScreenshot(test_name,name))if e.exception
    end
end