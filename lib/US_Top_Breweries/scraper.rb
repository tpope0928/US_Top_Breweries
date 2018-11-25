class USTopBreweries::Scraper

  def get_page
    Nokogiri::HTML(open("https://untappd.com/brewery/top_rated?country_id=86"))
  end

  def scrape_breweries_index
     self.get_page.css("div#content")
  end

  def make_breweries
    scrape_breweries_index.each do |b|
      USTopBreweries::Brewery.new_from_index_page(b)
    end
  end
end
