require 'net/http'
require 'nokogiri'
require 'date'

class ApiWeather 
    @affiliate_id = '&affiliate_id=zdo2c683olan'
    @lang = "api_lang=en"
    @temp_max
    @temp_min
    @temp_today
    @today = Date.today
    @province_url

    def self.get_max_temp(province)

        get_province_url(province)

        xml_body = Net::HTTP.get_response(URI.parse(@province_url)).body

        doc = Nokogiri::XML(xml_body)

        doc.xpath('//var').each do |var|
            if (var.at_xpath('name').content.to_s.eql? 'Temperatura Máxima') || (var.at_xpath('name').content.to_s.eql? 'Maximum Temperature')
                values = []
                var.search('forecast').each do |forecast|
                    values << forecast["value"].to_i
                end

                @temp_max = values.max
            end
        end

        @temp_max
    end

    def self.get_min_temp(province)
        
        get_province_url(province)

        xml_body = Net::HTTP.get_response(URI.parse(@province_url)).body

        doc = Nokogiri::XML(xml_body)

        doc.xpath('//var').each do |var|
            
            if (var.at_xpath('name').content.to_s.eql? 'Temperatura Mínima') || (var.at_xpath('name').content.to_s.eql? 'Minimum Temperature')
                values = []
                var.search('forecast').each do |forecast|
                    values << forecast["value"].to_i
                end

                @temp_min = values.min
            end
        end

        @temp_min
    end

    def self.get_day_temp(province)

        get_province_url(province)

        xml_body = Net::HTTP.get_response(URI.parse(@province_url)).body

        doc = Nokogiri::XML(xml_body)

        doc.xpath('//var').each do |var|

            if (var.at_xpath('name').content.to_s.eql? 'Día') || (var.at_xpath('name').content.to_s.eql? 'Day')
                values = []
                var.search('forecast').each do |forecast|
                    #TODO where is the data?
                end
                
                @temp_today = 0
            end
        end

        @temp_today
    end

    def self.get_province_url(province)

        url = "http://api.tiempo.com/index.php?#{@lang}&division=102#{@affiliate_id}"

        xml_body = Net::HTTP.get_response(URI.parse(url)).body

        doc = Nokogiri::XML(xml_body)
        doc.xpath('//data').each do |data|
            provincia = data.at_xpath('name').content

            if provincia.to_s.eql? province
                @province_url = data.at_xpath('url').content.concat(@affiliate_id)
            end
        end

        if @province_url == nil
            puts "Province not found."
        end
    end

    class Date
        def dayname
            DAYNAMES[self.wday]
        end

        def abbr_dayname
            ABBR_DAYNAMES[self.wday]
        end
    end
end