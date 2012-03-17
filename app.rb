require "sinatra"
require 'cgi'

get "/" do
  if params[:term]
    redirect "/" + params[:term]
  else
    erb :index
  end
end

get "/:term" do
  term = CGI.unescape params[:term].strip.squeeze(" ")
  term = indefinitize(term) unless indefinitized?(term)

  erb :show, locals: { term: term }
end

not_found do
  erb :not_found
end

def indefinitized?(word)
  word =~ /^a(n)?\s/i
end

def indefinitize(word)
  indefinite = word =~ /^[aeiou]/i ? "an" : "a"
  "#{indefinite} #{word}"
end
