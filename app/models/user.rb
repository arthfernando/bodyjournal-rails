class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  before_save :format_birthdate

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  private
  def format_birthdate
    self.birthdate.to_date.strftime("%d-%m-%Y")
  end
end
