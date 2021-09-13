class KernelBuild < ApplicationRecord
  has_one: :kernel_config
  has_one: :kernel_source
end
