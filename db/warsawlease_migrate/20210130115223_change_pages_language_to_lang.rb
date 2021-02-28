class ChangePagesLanguageToLang < ActiveRecord::Migration[6.0]
  def change
    rename_column :pages, :language, :lang
  end
end
