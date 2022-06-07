class ContactMailersController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
  end

  def create

    @group = Group.find(params[:group_id])
    @title = params[:title]
    @body = params[:body]

    contact = {
      :group => @group,
      :title => @title,
      :body => @body

    }

    ContactMailer.send_mail_to_group(contact)

    render :sent
  end

  def sent
    redirect_to group_path(params[:group_id])
  end

end
