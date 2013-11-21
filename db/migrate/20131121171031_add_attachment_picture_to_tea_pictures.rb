class AddAttachmentPictureToTeaPictures < ActiveRecord::Migration
  def self.up
    change_table :tea_pictures do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :tea_pictures, :picture
  end
end
