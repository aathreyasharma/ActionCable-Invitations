class HomeController < ApplicationController
  before_action :filter_params, only: :import
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
      ProcessCsvUploadWorker.perform_async(import_file.id, current_user.id)
      flash[:success] = 'File been uploaded!'
      redirect_to request.referrer
    else
      flash[:alert] = "Upload Failed!"
      render 'index'
    end
  end

  private

   def filter_params
    @file = params[:file_upload][:excel_file]
  end


end
