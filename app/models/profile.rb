class Profile < ActiveRecord::Base
  belongs_to :user
  # multiple validations on the one attribute

  # We can specify only an integer value on the record otherwise it checks for floats
  # we can do:
  # less than or equal to
  # less than
  # greater than
  # greater than or equal to
  # equal to
  # odd
  # even
  validates :bay_films_watched, :presence => true, :numericality => { :only_integer => true, :equal_to => 0 }


  validates_format_of :megan_foxs_acting_ability, :with => /Crap/, :message => "Let's be honest there is no chance of an oscar any time soon"

  validates :great_bay_films, :inclusion => { :in => ["Bad Boys"] }, :exclusion => { :in => ["The Rock" "Armageddon" "Pearl Harbor", "Transformers: Revenge of the Fallen", "Transformers: Dark of the Moon", "Transformers: Age of Extinction"]}

  validates_acceptance_of :the_highlight_of_shia_labeoufs_career, :message => 'You must accept that Transformers was the highlight of Shia Labeoufs career'
  # validates :the_highlight_of_shia_labeoufs_career, :acceptance => { :message => 'You must accept that Transformers was the highlight of Shia Labeoufs career' }

  validates :plot, :explosions => true

  # collect conditional validations using with options
  # passing symbol as a method
  with_options :if => :is_presenter? do |presenter|
    presenter.validates :dead_horses_beaten, :presence => true
    presenter.validates :bad_jokes_told, :numericality => { :greater_than => 9000 }
  end

  def is_presenter?
    true
  end
end
