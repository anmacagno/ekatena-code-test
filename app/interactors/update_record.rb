class UpdateRecord
  include Interactor

  delegate :attributes, to: :context

  def call
    record = find_or_create_record
    if record.save
      context.record = record
    else
      context.fail!(error: record.errors.messages)
    end
  end

  private

  def find_or_create_record
    record = Record.find_or_create_by(number: attributes[:number])
    record.notifications.delete_all
    record.court = attributes[:court]
    record.actor = attributes[:actor]
    record.defendant = attributes[:defendant]
    record.summary = attributes[:summary]
    record.notifications.build(attributes[:notifications])
    record
  end
end
