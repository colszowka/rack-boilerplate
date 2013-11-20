# This is just an example, you will want to get rid of this
class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :name
    end
  end
end