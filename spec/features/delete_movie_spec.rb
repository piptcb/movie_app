require 'spec_helper'



describe "deleting the movie" do 

 it "delete and confirm " do 

 	movie = Movie.create(movie_attributes)

 	visit movie_url(movie)

 	click_link "Delete"

 	expect(current_path).to eq(movies_path)
 	expect(page).to_not  have_text("Delete") 
 	expect(page).to have_text("Movie successfully deleted!")

 end 


end 