class AddNumber3ToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :number3, :string
  end
end
