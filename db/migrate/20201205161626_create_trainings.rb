class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.string       :title,            null: false
      t.integer      :trainingtime_id,  null: false
      t.integer      :part_id,          null: false
      t.string       :event,            null: false
      t.references   :user,             foreign_key:true  
      t.timestamps
    end
  end
end
