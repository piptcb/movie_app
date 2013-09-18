require 'spec_helper'


describe "showing all the movies" do 
 

	it "show the movies" do 
		movie1 = Movie.create(movie_attributes)
		visit movies_url
		#expect(page).to have_text("3 Movies")
		expect(page).to have_text(movie1.title)
	#	expect(page).to have_text(movie2.title)
	#  	expect(page).to have_text(movie3.title)

	  	expect(page).to have_text(movie1.rating)
	    expect(page).to have_text(movie1.description[0..10])
	    expect(page).to have_text("$318,412,101.00")
	end 

 it "does not show a movie that hasn't yet been released" do
  movie = Movie.create(movie_attributes(released_on: 1.month.from_now))
  
  visit movies_path
  
  expect(page).not_to have_text(movie.title)
end
 
end 	