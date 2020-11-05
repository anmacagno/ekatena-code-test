class SynchronizeRecord
  include Interactor::Organizer

  organize([FindRecord, UpdateRecord])
end
