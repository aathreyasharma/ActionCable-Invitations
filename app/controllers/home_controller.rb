class HomeController < ApplicationController
  before_action :filter_params, only: :import
  before_action :set_notifications, except: [:import]
  def index
    @excel_upload = current_user.file_uploads.build
  end

  def import
    if @file.nil?
      redirect_to request.referrer, notice: "No file provided!"
      return
    end
    import_file = FileUpload.new(
      excel_file: @file,
      file_name: @file.original_filename,
      created_by: current_user
    )
    if import_file.save!
      ProcessCsvUploadJob.perform_async(import_file.id, current_user.id)
      flash[:success] = "Upload successful"
    end
  end

  def my_files
    @files = current_user.file_uploads
  end

  def clear_notifications
    @unread_notifications.update_all(read: true)
    render json: {success: true}, status: 200
  end

  private

  def filter_params
    @file = params[:file_upload][:excel_file]
  end

  def set_notifications
    @unread_notifications = current_user.notifications.where(read: false)
  end

end
