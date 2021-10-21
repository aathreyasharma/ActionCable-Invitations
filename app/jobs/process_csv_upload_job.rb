class ProcessCsvUploadJob
  require 'csv'
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(import_file_id, current_user_id)
    begin
      import_file = FileUpload.find(import_file_id)
      csv_data = CSV.parse(import_file.excel_file.download, headers: true)
      csv_data.each do |row|
        hash = row.to_h
        user = User.find_or_initialize_by(email: hash["emails"])
        unless user.persisted?
          user.managed_by_id = current_user_id
          user.invited_by_id = current_user_id
          user.invited_by_type = 'User'
          user.invite!
          Rails.logger.info "User Invited: #{user.email}"
        else
          Rails.logger.info "User exist: #{user.email}"
        end
      end
      notification = Notification.create(user_id: current_user_id, message: "Job Completed for file #{import_file.file_name}")
      ActionCable.server.broadcast "room_channel_#{current_user_id}", message: notification.message
    rescue Exception => e
      Rails.logger.info e
    end
  end

end
