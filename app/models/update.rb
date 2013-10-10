class Update < ActiveRecord::Base
  belongs_to :user
  acts_as_likeable
  # after_save :notify

  def notify
    Update.connection.execute "NOTIFY HotSpot, #{connection.quote comment.to_s}"
  end

  def listen
    Update.connection.execute "LISTEN HotSpot"
    loop do
      Update.connection.raw_connection.wait_for_notify do |event, pid, comment|
        yield comment
      end
    end
  ensure
    Update.connection.execute "UNLISTEN HotSpot"
  end
end
