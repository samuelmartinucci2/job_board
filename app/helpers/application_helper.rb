module ApplicationHelper

  private

  def current_company
    @current_user ||= session[:company_id]
      Company.find_by_id(session[:company_id])
  end
end
