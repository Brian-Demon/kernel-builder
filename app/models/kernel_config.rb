class KernelConfig < ApplicationRecord
  belongs_to :user
  has_one_attached :config_url
end
