class KernelBuild < ApplicationRecord
  has_many :kernel_configs
  accepts_nested_attributes_for :kernel_configs
  has_many :kernel_sources
  accepts_nested_attributes_for :kernel_sources
end
