class KernelSource < ApplicationRecord
  belongs_to :user
  has_many :kernel_builds

  def display_name
    "#{git_repo} @ #{git_ref}"
  end
end
