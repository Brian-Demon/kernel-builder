class CreateKernelBuilds < ActiveRecord::Migration[6.1]
  def change
    create_table :kernel_builds do |t|
      t.integer :kernel_id
      t.integer :config_id
      t.string :artifact_url

      t.timestamps
    end
  end
end
