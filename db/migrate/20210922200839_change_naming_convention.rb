class ChangeNamingConvention < ActiveRecord::Migration[6.1]
  def change
    rename_column :kernel_builds, :kernel_id, :kernel_source_id
    rename_column :kernel_builds, :config_id, :kernel_config_id
  end
end
