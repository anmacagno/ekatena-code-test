class RecordScraper
  BASE_URL = 'https://www.poderjudicialvirtual.com/'

  attr_accessor :page

  def initialize(identifier)
    begin
      tempfile = URI.open(BASE_URL + identifier, { ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE })
    rescue OpenURI::HTTPError
      raise ScraperError.new("Invalid identifier: '#{identifier}'. Not found.")
    end
    @page = Nokogiri::HTML.parse(tempfile)
  end

  def call
    begin
      {
        number: number,
        court: court,
        actor: actor,
        defendant: defendant,
        summary: summary,
        notifications: notifications
      }
    rescue StandardError
      raise ScraperError.new("Invalid page. Login at #{BASE_URL}.")
    end
  end

  private

  def number
    string = page.css('.header')[0].css('h1').children.map { |name| name.text }[0]
    string.split.last
  end

  def court
    string = page.css('.content')[1].css('p').children.map { |name| name.text }[3]
    string
  end

  def actor
    string = page.css('.content')[1].css('p').children.map { |name| name.text }[5]
    string.gsub('Actor:', '').strip
  end

  def defendant
    string = page.css('.content')[1].css('p').children.map { |name| name.text }[7]
    string.gsub('Demandado:', '').strip
  end

  def summary
    string = page.css('.content')[2].css('p').children.map { |name| name.text.strip.gsub('  ', ' ') }.join(' ')
    string.gsub('RESUMEN:', '').strip
  end

  def notifications
    items = page.css('#listaAcuerdos').css('.list-group-item')
    items.each_with_object([]) do |item, array|
      strings = item.children.map { |name| name.text }
      array << {
        title: strings[1],
        content: strings[3]
      }
    end
  end
end
