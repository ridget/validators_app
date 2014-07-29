require 'spec_helper'

describe Profile do

  context 'validations' do
    it { should validate_numericality_of(:bay_films_watched).is_equal_to(0).only_integer }
    it { should validate_acceptance_of(:the_highlight_of_shia_labeoufs_career).with_message('You must accept that Transformers was the highlight of Shia Labeoufs career') }
    it { should allow_value("foobar boom bang").for(:plot) }
    it { should_not allow_value("foobar boom bang michael").for(:plot) }
    it { should allow_value('Crap').for(:megan_foxs_acting_ability) }
    it { should_not allow_value('Amazing').for(:megan_foxs_acting_ability) }
    #
    # it { should validate_inclusion_of(:great_bay_films).in_array(["Bad Boys"]) }
    # The below has been deprecated as of 3 days ago, but the gem wast updated as of time of writingp
    # Going forward it will follow the above format, same for ensure_exclusion_of
    it { should ensure_inclusion_of(:great_bay_films).in_array(["Bad Boys"]) }
    it { should ensure_exclusion_of(:great_bay_films).in_array(["The Rock" "Armageddon" "Pearl Harbor", "Transformers: Revenge of the Fallen", "Transformers: Dark of the Moon", "Transformers: Age of Extinction"]) }

    it { should validate_presence_of(:dead_horses_beaten) }
    it { should validate_numericality_of(:bad_jokes_told).is_greater_than(9000) }

    context 'presenter is false' do
      before { allow(subject).to receive(:is_presenter?) { false } }
      it { should_not validate_presence_of(:dead_horses_beaten) }
      it { should_not validate_numericality_of(:bad_jokes_told).is_greater_than(9000) }
    end

  end

end
