# 11/30(14:15)
class AddDeletedAtToComment < ActiveRecord::Migration[6.0]
  def change
    # add_column(table_name, column_name, type, **options)
    # https://api.rubyonrails.org/
    add_column :comments, :deleted_at, :datetime, default: nil
    # 增加索引做soft delete，加速資料庫搜尋速度(binary tree二元次索引)，讀取快但寫入慢
    add_index :comments, :deleted_at
  end
end
