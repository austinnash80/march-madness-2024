class UploadsController < ApplicationController
  require 'csv'
  def new


  end

  def create_school

    file_path = params[:file].tempfile

    CSV.foreach(file_path, headers: true) do |row|
      School.create!(row.to_hash)
    end

    redirect_to uploads_new_path, notice: 'Schools data uploaded successfully.'
  end

  def create_draft_ranks

    file_path = params[:file].tempfile

    CSV.foreach(file_path, headers: true) do |row|
      DraftRank.create!(row.to_hash)
    end

    redirect_to uploads_new_path, notice: 'Draft Ranks data uploaded successfully.'
  end

  def create_draft_result

    file_path = params[:file].tempfile

    CSV.foreach(file_path, headers: true) do |row|
      DraftResult.create!(row.to_hash)
    end

    redirect_to uploads_new_path, notice: 'draft result data uploaded successfully.'
  end
end