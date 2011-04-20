class ChangePhoneNumbersToRelateToPolymorphicContacts < ActiveRecord::Migration
  def self.up
    PhoneNumber.destroy_all
    remove_column :phone_numbers, :person_id
    add_column :phone_numbers, :contact_id, :integer
    add_column :phone_numbers, :contact_type, :string
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
