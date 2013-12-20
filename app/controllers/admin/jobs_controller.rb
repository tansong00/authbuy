class Admin::JobsController < Admin::ApplicationController

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new job_params
    if @job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :amount, :location, :qualification , :responsibility, :wage, :other )
  end

end
