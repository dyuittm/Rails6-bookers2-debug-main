class ContactMailer < ApplicationMailer

  def send_mail(member, contact)
    @group = contact[:group]
    @title = contact[:title]
    @body = contact[:body]

    # @mail = ContactMailer.new()
    # mail(
      # from: ENV['MAIL_ADDRESS'],
      # to:   member.email,
      # subject: 'New Event Notice!!'
    # )
  end

  def self.send_mail_to_group(contact)
    group = contact[:group]
    group.users.each do |member|
      ContactMailer.send_mail(member, contact).deliver_now
    end
  end

end
