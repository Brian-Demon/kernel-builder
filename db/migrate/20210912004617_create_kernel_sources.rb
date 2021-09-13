class CreateKernelSources < ActiveRecord::Migration[6.1]
  def change
    create_table :kernel_sources do |t|
      t.string :git_repo
      t.string :git_ref

      t.timestamps
    end
  end
end
