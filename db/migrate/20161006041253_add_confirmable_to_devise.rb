class AddConfirmableToDevise < ActiveRecord::Migration[5.0]
  def change
    change_table(:users) do |t|
      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
    end
  end
end
