class AddNumber2ToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :number2, :string
  end
end
