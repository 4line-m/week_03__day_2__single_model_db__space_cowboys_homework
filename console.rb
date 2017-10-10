require('pry')
require_relative('models/bounty.rb')

bounty_1 = Bounty.new(
  {
    'name' => 'Alizor',
    'species' => 'Amazonik',
    'favourite_weapon' => 'Photon Stunner',
    'bounty_value' => ''

  }
)

bounty_2 = Bounty.new(
  {
    'name' => 'Paddex',
    'species' => 'Independent Republic of the Fourth Sun',
    'favourite_weapon' => 'Plasma Pistol',
    'bounty_value' => '500'
  }
)

binding.pry
nil
