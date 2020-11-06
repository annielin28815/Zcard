class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :nickname
      t.string :account
      t.string :avator
      t.string :school

      t.timestamps
    end
  end
end


# 11/06PM16:06
# 面試題：model migration 的關聯？無關聯。是跟table有關，會決定與描述table的樣貌欄位等。migrate是資料庫的成長紀錄表。一定要進到版控的進度裡。