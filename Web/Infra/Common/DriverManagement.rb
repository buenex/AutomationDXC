module DriverManagement
    def has_tab?(name)        
        begin
            switch_to_window { title.include?(name) } 
            return true            
        rescue 
            return false
        end  
    end

    def switch_tab(name)
        return  switch_to_window { title.include?(name) }
    end
end