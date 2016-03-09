class RemoveNumber2FromPhones < ActiveRecord::Migration
  def change
    remove_column :phones, :number2, :string
  end
end
