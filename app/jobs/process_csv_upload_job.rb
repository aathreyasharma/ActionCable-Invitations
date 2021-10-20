class ProcessCsvUploadJob < ApplicationJob
  include Sidekiq::Worker
  queue_as "process_excel_upload_#{ENV['RAILS_ENV']}"
  require "csv"

  def perform(import_file_id, current_user_id)
    begin
      csv_data = CSV.parse(import_file.excel_file.download, headers: true)
      CSV.parse(import_file.excel_file.download, headers: true) do |row|
          hash = row.to_h

      end
    rescue Exception => e
      Rails.logger.info e
    end
  end

end
