class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(companies_params)

    if @company.save
      redirect_to root_path, notice: "Company was succesfully added"
    else
      render action: "new"
    end
  end

  def companies_params
    params.require(:company).permit(:name, :email, :password)
  end
end