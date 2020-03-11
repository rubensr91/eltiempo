require 'net/http'
require 'nokogiri'

class ApiWeather 
    @affiliate_id = '&affiliate_id=zdo2c683olan'
    @lang = "api_lang=en"

    def self.get_max_temp(province_url)

        temp_max = []

        xml_body = Net::HTTP.get_response(URI.parse(province_url)).body

        doc = Nokogiri::XML(xml_body)

        doc.xpath('//var').each do |var|
            if (var.at_xpath('name').content.to_s.eql? 'Temperatura Máxima') || (var.at_xpath('name').content.to_s.eql? 'Maximum Temperature')
                var.search('forecast').each do |forecast|
                    temp_max << forecast["value"].to_i
                end
            end
        end

        temp_max
    end

    def self.get_min_temp(province_url)

        temp_min = []
        
        xml_body = Net::HTTP.get_response(URI.parse(province_url)).body

        doc = Nokogiri::XML(xml_body)

        doc.xpath('//var').each do |var|
            if (var.at_xpath('name').content.to_s.eql? 'Temperatura Mínima') || (var.at_xpath('name').content.to_s.eql? 'Minimum Temperature')
                var.search('forecast').each do |forecast|
                    temp_min << forecast["value"].to_i
                end
            end
        end

        temp_min
    end

    def self.get_today_temp(province_url)

        today = []

        xml_body = Net::HTTP.get_response(URI.parse(province_url)).body

        doc = Nokogiri::XML(xml_body)

        doc.xpath('//var').each do |var|
            if (var.at_xpath('name').content.to_s.eql? 'Definición de Atmosfera') || (var.at_xpath('name').content.to_s.eql? 'Atmospheric condition')
                var.search('forecast').each do |forecast|
                    today << forecast["value"]
                end
            end
        end

        today
    end

    def self.get_province_url(province)

        province_url = nil

        url = "http://api.tiempo.com/index.php?#{@lang}&division=102#{@affiliate_id}"

        xml_body = Net::HTTP.get_response(URI.parse(url)).body

        doc = Nokogiri::XML(xml_body)
        doc.xpath('//data').each do |data|
            if (data.at_xpath('name').content.to_s.eql? province) || (province_url != nil)
                province_url = data.at_xpath('url').content.concat(@affiliate_id)
            end
        end

        province_url
    end
end