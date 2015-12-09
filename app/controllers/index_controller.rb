def three_letters(input)
  if input.length > 3
		# return true if input is 3 or less characters
    # and false otherwise
    raise Exception.new("** Word must be less than or equal to 3 characters. **")
  end
end

def distinct_letters(input)
   letter_array = input.chars
   unique_letters = letter_array.uniq
   if unique_letters.length < letter_array.length
     raise Exception.new("** Word must have distinct letters please! **")
   end
end

def valid_input(input)
	three_letters(input)
	distinct_letters(input)
end

get '/' do
  erb :index
end

get '/anagrams/:word' do
  @word = params[:word]
	alphabetized_string = @word.chars.sort.join
  @anagrams = Word.where("letters=?", alphabetized_string)
  erb :show
end

post '/' do
  @word = params[:word]
  begin 
		valid_input(@word)
    redirect "/anagrams/#{@word}"
  rescue Exception => error
    @error = error.message
    erb :index
  end
end
