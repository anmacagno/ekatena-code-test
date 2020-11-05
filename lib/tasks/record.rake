namespace :record do
  desc 'Synchronize record for a given identifier'
  task :synchronize, [:identifier] => :environment do |task, args|
    result = SynchronizeRecord.call(identifier: args.identifier)
    if result.success?
      puts "Record #{result.record.number} synchronized successfully"
    else
      puts result.error
    end
  end
end
