module DateAndTime
    def date_time_now(mask='%d/%m/%Y')
        return Time.now.strftime(mask)
    end    

    def date_time_add_days(days,mask='%d/%m/%Y')
        return (Time.now+(days*(60*60*24))).strftime(mask)
    end
end