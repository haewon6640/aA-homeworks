require_relative 'plays'

class Playwright
    attr_accessor :name, :birth_year
    def self.all
        data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
        Playwright.map_data(data)
    end

    def self.find_by_name(name)
        data = PlayDBConnection.instance.execute(<<-SQL,name)
            SELECT 
                *
            FROM
                playwrights
            WHERE
                name = ?
        SQL
        Playwright.map_data(data)
    end

    def initialize(options)
        @id = options['id']
        @name = options['name']
        @birth_year = options['birth_year']
    end

    def create
        raise "#{self} already in database" if @id
        PlayDBConnection.instance.execute(<<-SQL,self.name,self.birth_year)
            INSERT INTO
                playwrights (name, birth_year)
            VALUES
                (?, ?)
        SQL
    end

    def update
        raise "#{self} not in database" unless @id
        PlayDBConnection.instance.execute(<<-SQL,self.name,self.birth_year,@id)
            UPDATE
                playwrights
            SET
                name = ?, birth_year = ?
            WHERE
                id = ?
        SQL
    end
    
    def get_plays
        data = PlayDBConnection.instance.execute(<<-SQL)
            SELECT playwrights.name, plays.id,plays.title,plays.year FROM playwrights
            JOIN plays ON playwrights.id = plays.playwright_id
        SQL
        data
    end
    private 
    def self.map_data(data)
      data.map {|datum| Playwright.new(datum)}
    end
end