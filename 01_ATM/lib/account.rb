require 'active_record'
# task :up => :'db:connect' do
#   migrations = if ActiveRecord.version.version >= '5.2'
#     ActiveRecord::Migration.new.migration_context.migrations
#   else
#     ActiveRecord::Migrator.migrations('db/migrate')
#   end
#   ActiveRecord::Migrator.new(:up, migrations, nil).migrate
# end


ActiveRecord::Base.establish_connection(:adapter => 'sqlite3',
                                        :database => 'db/bank.db')
migrations = ActiveRecord::Migration.new.migration_context.migrations
  ActiveRecord::Migrator.new(:up, migrations, nil).migrate
  
class Account < ActiveRecord::Base
  validates_uniqueness_of :number
  
  def queue
    @queue ||= TransactionQueue.new
  end

  def credit(amount)
    @queue.write("+#{amount},#{number}")
  end

  def debit(amount)
    @queue.write("-#{amount},#{number}")
  end
end