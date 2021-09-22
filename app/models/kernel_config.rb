class KernelConfig < ApplicationRecord
  belongs_to :user
  has_many :kernel_builds
  has_one_attached :config_url

  def config_filename
    config_url.filename
  end
end
