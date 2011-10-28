module Sinatra::Navigation

  def navigation
    navigation = [
      {
        :title => "Fish",
        :children => [
          {:title => "History of classification", :rewrite => "history",
           :children => [
             {:title => "Reptilian lungs", :rewrite => "lungs"},
             {:title => "Turtles and tortoises"},
             {:title => "Palate"}
           ]
          },
          {:title => "Taxonomy"}
        ]
      },
      {
        :title => "Reptiles",
        :children => [
          {:title => "Circulatory"},
          {:title => "Respiratory",
           :children => [
             {:title => "Reptilian lungs", :rewrite => "lungs"},
             {:title => "Turtles and tortoises"},
             {:title => "Palate"}
           ]
          },
          {:title => "Evolutionary history"}
        ]
      }
    ]
  end

  def sections
    pages = {}
    navigation.each_index do |primary_idx|
      pages = navigation[primary_idx]
    end
    pages
  end

  def get_token item
    item[:rewrite] || convert_to_url_token(item[:title])
  end

  def first_section_token
    get_token navigation.first
  end

  def is_first_page_of_app
    url_match_with_index?(first_section_token)
  end

  def last_section_token
    get_token navigation.last
  end

  def last_section_sub_page_token
    get_token navigation.last[:children].last
  end

  def is_last_page_of_app
    url_match?(last_section_token + '/' + last_section_sub_page_token)
  end

  def primary_token
    get_token primary_hash
  end

  def primary_idx
    idx = 0
    navigation.each_index do |primary_idx|
      idx  = primary_idx
    end
    idx
  end

  def sub_pages
    pages = {}
    navigation.each_index do |primary_idx|
      primary_hash  = navigation[primary_idx]
      primary_token = get_token primary_hash
      if url_match?(primary_token)
        pages = primary_hash[:children]
      end
    end
    pages
  end
end