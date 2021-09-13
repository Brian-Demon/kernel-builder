class KernelBuild < ApplicationRecord
  has_many :kernel_configs
  has_many :kernel_sources
end
