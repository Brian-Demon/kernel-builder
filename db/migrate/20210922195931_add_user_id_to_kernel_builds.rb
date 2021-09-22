class AddUserIdToKernelBuilds < ActiveRecord::Migration[6.1]
  def change
    add_column :kernel_builds, :user_id, :integer
  end
end
