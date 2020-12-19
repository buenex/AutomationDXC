require_relative '../Common/DriverManagement.rb'
require_relative '../Common/DateAndTime.rb'
require 'spreadsheet'

module BasePage
    include DriverManagement
    include DateAndTime
    
    def get_text_column(table,index_row,index_column,selector=:id)
        table=table.to_s.tr('#','')
        rows = find(selector,table).all('tr')
        cells = rows[index_row].all('td')
        return cells[index_column].text
    end

    def has_rows(row_id,selector=:id)  
        row_id=row_id.to_s.tr('#','')
        begin
            find(selector,row_id)
            return true
        rescue 
            return false
        end        
    end

    def sum_columns(table_id,column_index, row_init, constant, format,selector=:id)
        table_id=table_id.to_s.tr('#','')
        _count = 1
        _result = 0.0
        rows = find(selector,table_id).all('tr')
        for i in 0..rows.length-1   
            if (_count == constant && i >= row_init )           
                _result += rows[i].all('td')[column_index].text.to_s.tr(',','.').to_f    
                if constant == 1
                    _count = 1
                else
                    if(_count<constant)
                        _count += 1
                    else
                        _count = 0
                    end
                end
            else
                if(_count<constant)
                    _count +=1
                end
            end              
        end
        _result = sprintf("%." + format.to_s + "f", _result)
        return _result.to_s.to_s.tr('.',',')
    end

    def get_item_on_list(value,index_element,selector=:id)
        value=value.to_s.tr('#','')
        return find(selector,value).all('option')[index_element]
    end

    def get_all_item_on_list(value,selector=:id)
        value=value.to_s.tr('#','')
        return find(selector,value).all('option')
    end

    def unfocus(*)
        find('#titulo').click
    end

    def get_item_in_element(value,tag,index,selector=:id)
        value=value.to_s.tr('#','')
        return find(selector,value).all(tag)[index]
    end

    def insert_anexo(value,file_path,selector=:id)
        
        execute_script('document.querySelector("'+value+'").style="opacity: 0.1"')
        value=value.to_s.tr('#','')
        find(selector,value).attach_file(file_path)
    end

    def search_element_in_column(table_id,col_index,element,selector = :id)
        table_id=table_id.to_s.tr('#','')
        rows = find(selector,table_id).all('tr')

        for i in 0..rows.length
            cols = rows[i].all('td')
            if cols[col_index].text == element                
                return rows[i]
                break
            end
        end
        return nil
    end

    def insert_id(value,new_value,selector=:xpath)        
        execute_script('document.evaluate(\''+value+'\', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.id="'+new_value+'";')
    end

    def send_key(value,key=:tab,selector=:id)
        value=value.to_s.tr('#','')
        find(selector,value).send_keys(key)
    end

    def has_tab(tab)
        begin       
            switch_to_window { title.include? tab }   
            return true     
        rescue
            return false
        end
    end

    def file_exists?(path,file_name)
        Dir.foreach(path).each do |i|
            if i.include?(file_name)
                return true
                break
            end
        end       
        return false
    end

    def insert_into_sheet(value,column)
        workbook = Spreadsheet.open '../../Files/Data.xlsx'

        workbook.worksheet(0).each do |row|
            if(row==nil){
                row.column[column] = value
                break
            }
        end
    end
end