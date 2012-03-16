require "sinatra"
require 'cgi'

get "/" do
  erb :index
end

get "/:term" do
  term = CGI.unescape params[:term].strip
  term = indefinitize(term) unless indefinitized?(term)
  term = term.split.map(&:capitalize).join(" ")
  term = term[0].downcase + term[1..-1]

  erb :show, locals: { term: term }
end

def indefinitized?(word)
  word =~ /^a(n)?\s/i
end

def indefinitize(word)
  indefinite = word =~ /^[aeiou]/i ? "an" : "a"
  "#{indefinite} #{word}"
end
