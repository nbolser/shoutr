class MakeShoutsPolymorphic < ActiveRecord::Migration[5.2]
  class Shout < ApplicationRecord
    belongs_to :content, polymorphic: true
  end
  class TextShout < ApplicationRecord; end

  def change
    change_table(:shouts) do |t|
      t.string :content_type
      t.integer :content_id
      t.index [:content_type, :content_id]
    end

    reversible do |dir|
      Shout.reset_column_information
      Shout.find_each do |s|
        dir.up do
          text_shout = TextShout.create(body: s.body)
          s.update(content_id: text_shout.id, content_type: 'TextShout')
        end
        dir.down do
          s.update(body: s.content.body)
          s.content.destroy
        end
      end
    end
  end
end
