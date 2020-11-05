class FindRecord
  include Interactor

  delegate :identifier, to: :context

  def call
    if identifier.present?
      begin
        context.attributes = RecordScraper.new(identifier).call
      rescue ScraperError => e
        context.fail!(error: e.message)
      end
    else
      context.fail!(error: "Invalid identifier: '#{identifier}'. Can't be blank.")
    end
  end
end
