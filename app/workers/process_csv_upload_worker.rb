class ProcessCsvUploadWorker
  require 'csv'
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(import_file_id, current_user_id)
    begin
      csv_data = CSV.parse(import_file.excel_file.download, headers: true)
      CSV.parse(import_file.excel_file.download, headers: true) do |row|
          hash = row.to_h
          Sidekiq.logger.error "logger.info : #{hash['emails']}"
      end
    rescue Exception => e
      Rails.logger.info e
    end
  end

end
