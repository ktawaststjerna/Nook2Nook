class User < ApplicationRecord
  require 'sendgrid-ruby'
  include SendGrid
  has_many :join_listings
  has_many :host_listings
  has_many :notifications

  has_secure_password

  validates :island_name, :character_name, :password_digest, :email, presence: true

  def self.create_password
    SecureRandom.hex(8)
  end

  def welcome_email(password)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    from = Email.new(email: 'ktawaststjerna@gmail.com')
    to = Email.new(email: email)
    subject = 'Welcome to Nook2Nook'

    mail = Mail.new
    mail.from = from
    mail.subject = subject
    mail.template_id = 'd-a775be452d284136b8d13a61af6c6d16'

    sendgrid_data = { url: ENV['DOMAIN'], password: password}
    personalization = Personalization.new
    personalization.add_to(to)
    personalization.add_dynamic_template_data(sendgrid_data)
    mail.add_personalization(personalization)

    # content = Content.new(type: 'text/plain')

    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end
end