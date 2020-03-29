class Scraper

  def self.page_selection(page_sel) 
    if page_sel.to_i == 1 
      url = "https://adltexas.org/pets/" 
      self.scrape_site(url)
    elsif page_sel.to_i.between?(1,10) 
      url = "https://adltexas.org/pets/page/#{page_sel}/"
      self.scrape_site(url)
    else
      puts "Whoopsies! it looks like you made an invalid selection. Please try again"
      Cli.new.page_choice 
    end 
  end 
  
  def self.scrape_site(url) 
    page = Nokogiri::HTML(open(url))
    results = page.css("div#gallery-container.row.small-up-1.medium-up-2.large-up-3.pet-gallery").css(".pet-details").each do |details|
      name =  details.css(".pet-title a")[0].text
      building = details.css(".pet-location").text.strip
      url = details.css(".pet-title a")[0].attr("href")
      Pet.new(name,building,url)
    end 
  end
    
  def self.scrape_pet(pet)
    html = open(pet.url)
    page = Nokogiri::HTML(html)
    pet.breed = page.css(".column p")[0].text
    pet.gender = page.css(".column p")[1].text
    pet.weight =  page.css(".column p")[3].text
    pet.age = page.css(".column p")[2].text
  end

end