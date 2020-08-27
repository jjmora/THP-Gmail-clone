class Email < ApplicationRecord
  def self.counting
    return Email.all.where(read: false).count
  end
end
