# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110212112810) do

  create_table "clusters", :force => true do |t|
    t.string   "nombre"
    t.string   "desc"
    t.string   "activo"
    t.string   "url"
    t.string   "miclave"
    t.string   "suclave"
    t.integer  "empresas"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "confs", :force => true do |t|
    t.string   "nombre"
    t.integer  "grupo_id"
    t.string   "tipo"
    t.string   "valor"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estadisticasbazares", :force => true do |t|
    t.date     "fecha"
    t.integer  "bazar_id"
    t.integer  "empresas"
    t.integer  "consultas"
    t.integer  "clustersactivos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "estadisticasbazares", ["bazar_id", "fecha"], :name => "index_estabazar_bazar"
  add_index "estadisticasbazares", ["fecha", "bazar_id"], :name => "index_estabazar_fecha"

  create_table "estadisticasempresas", :force => true do |t|
    t.integer  "empresa_id"
    t.integer  "bazar_id"
    t.integer  "consultas"
    t.integer  "fundada"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "estadisticasempresas", ["bazar_id", "empresa_id"], :name => "index_estaempre_bazar"

  create_table "estdadisticasbazares", :force => true do |t|
    t.date     "fecha"
    t.integer  "bazar_id"
    t.integer  "empresas"
    t.integer  "consultas"
    t.integer  "clustersactivos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gruposconfs", :force => true do |t|
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "noticias", :force => true do |t|
    t.text     "titulo"
    t.text     "texto"
    t.datetime "fecha"
    t.integer  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "noticias", ["fecha"], :name => "index_noticia_fecha"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
