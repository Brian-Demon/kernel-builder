class KernelBuild < ApplicationRecord
  belongs_to :kernel_config
  accepts_nested_attributes_for :kernel_config
  belongs_to :kernel_source
  accepts_nested_attributes_for :kernel_source
  belongs_to :user
end
