require 'date'

class Utils
    def self.ConvertToUpperSmall(up,text)
        if up
            return text.tr('a-z','A-Z')
        else
            return text.tr('A-Z','a-z')
        end
    end

    def self.ReplaceCharacters(text)
        return text.tr("àáâãäçèéêëòóôõöùúü ","aaaaaceeeeooooouuu_")
    end

    def self.PrepareTestName(text)
        return text.sub('.rb','').tr('0-9[]:','')
    end

    def self.PreparePathScreenshot(test_name,name)
        return $print_path+'/prints/'+test_name+'/'+ name+'/'+Time.now.strftime('%H_%M_%S')+'.png'
    end
end