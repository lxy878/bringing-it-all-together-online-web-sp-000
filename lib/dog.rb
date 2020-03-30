class Dog
  attr_accessor :name, :breed, :id

  def initialize(hash)
    hash.each {|key, value| self.send("#{key}=", value)}
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT)
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    DB[:conn].execute('DROP TABLE IF EXISTS dogs')
  end

  def save
    if @id.nil?
      sql = <<-SQL
        INSERT INTO dogs (name, breed) VALUES (?, ?)
      SQL
      DB[:conn].execute(sql, @name, @breed)
      DB[:conn].execute('SELECT last_insert_rowid() FROM dogs')[0][0]
    else

    end

  end

  def self.create(name:, breed:)

  end

  def self.new_from_db(row)

  end

  def self.find_by_id(id)

  end

  def self.find_or_create_by(name:, breed:)

  end
end
