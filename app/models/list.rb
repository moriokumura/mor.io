class List < ActiveRecord::Base

  # has_paper_trail

  extend FriendlyId
  friendly_id :title, use: :slugged
  include Ownable

  has_many :list_items, lambda { order(position: :asc) }, dependent: :destroy
  belongs_to :user


  # Override friendly_id's original slug generation for not downcasing original characters.
  # Because friendly_id uses ActiveSupport::Inflector#parameterize inside,
  # following code substitutes implementation of ActiveSupport::Inflector#parameterize.
  #
  # @param [String] value
  # @return [String]
  def normalize_friendly_id(value)
    sep = '-'
    # replace accented chars with their ascii equivalents
    parameterized_string = ActiveSupport::Inflector.transliterate(value)

    parameterized_string.gsub!(/\+/, '-plus') # Google+ => Google-plus
    parameterized_string.gsub!(/\#/, '-sharp') # C# => C-sharp

    # Turn unwanted chars into the separator
    parameterized_string.gsub!(/[^a-zA-Z0-9\-_]+/, sep)
    unless sep.nil? || sep.empty?
      re_sep = Regexp.escape(sep)
      # No more than one of the separator in a row.
      parameterized_string.gsub!(/#{re_sep}{2,}/, sep)
      # Remove leading/trailing separator.
      parameterized_string.gsub!(/^#{re_sep}|#{re_sep}$/, '')
    end
    parameterized_string
  end

  # Method to fix bad slug
  # This doesn't work if slug duplicated.
  def normalize_slug!
    self.slug = self.normalize_friendly_id(name)
    self.save
  end
end
