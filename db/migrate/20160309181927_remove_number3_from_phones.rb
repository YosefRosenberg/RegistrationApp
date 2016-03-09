class RemoveNumber3FromPhones < ActiveRecord::Migration
  def change
    remove_column :phones, :number3, :string
  end
end
