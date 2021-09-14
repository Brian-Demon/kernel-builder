class AddUserIdToKernelSource < ActiveRecord::Migration[6.1]
  def change
    add_column :kernel_sources, :user_id, :integer
  end
end
