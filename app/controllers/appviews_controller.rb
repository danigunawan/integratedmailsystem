class AppviewsController < ApplicationController
  load_and_authorize_resource
  
  def contacts
  end

  def profile
  end

  def projects
  end

  def project_detail
  end

  def file_manager
  end

  def calendar
  end

  def faq
  end

  def timeline
  end

  def pin_board
  end

  def teams_board
  end

  def clients
  end

  def outlook_view
    render :layout => "layout_3"
  end

  def issue_tracker
  end

  def blog
  end

  def article
  end

end
