class Download < ActiveRecord::Base
  belongs_to :offer
  belongs_to :user

  scope :newest, lambda {|updated_at| where("updated_at > ? ", updated_at)}
end
