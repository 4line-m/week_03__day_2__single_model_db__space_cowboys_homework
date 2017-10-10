require( 'pg' )

class Bounty

  attr_accessor :name, :species, :favourite_weapon, :bounty_value

  attr_reader(:id)

  def initialize( options )
    @id = options ['id'].to_i if options['id']
    @name = options['name']
    @species = options['species']
    @favourite_weapon = options['favourite_weapon']
    @bounty_value = options['bounty_value'].to_i
  end

  def save()
    db = PG.connect( {
       dbname: 'space_cowboys',
       host: 'localhost' } )
    sql =
      "INSERT INTO bounties
      (
        name,
    	  species,
    	  favourite_weapon,
    	  bounty_value
      )
     VALUES
     (
      $1, $2, $3, $4
     )
     RETURNING *
     "
     values = [@name, @species, @favourite_weapon, @bounty_value]
     db.prepare("save_order", sql)
     @id =
     db.exec_prepared("save_order", values)[0]['id'].to_i()
     db.close()
  end

  def update()
    db = PG.connect( {
       dbname: 'space_cowboys',
       host: 'localhost' } )
    sql =
      "UPDATE bounties
      SET (
        name,
    	  species,
    	  favourite_weapon,
    	  bounty_value
      ) =
      ($1, $2,  $3, $4
      ) WHERE id = $5
      "
    values = [@name, @species, @favourite_weapon, @bounty_value, @id]
    db.prepare("update", sql)
    db.exec_prepared("update",values)
    db.close()
    end

end
