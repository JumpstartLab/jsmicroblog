require 'sinatra'
require 'data_mapper'
require 'dm-yaml-adapter'

DataMapper.setup(:default, {:adapter => 'yaml', :path => 'db'})

class Post
  include DataMapper::Resource

  property :id,         Serial
  property :author,     String
  property :body,       Text
  property :created_at, DateTime
end

class JSMicroblog < Sinatra::Base
  enable :inline_templates

  get '/' do
    erb :index
  end

  post '/posts' do
    params.delete "Submit"
    Post.create(params)
    redirect "/"
  end

  get '/posts/:id' do
    @post = Post.find(params[:id]).first
    erb :show
  end
end

__END__

@@ layout
<!DOCTYPE html>
<html><head><title>JSMicroblog</title></head>
<body>
  <%= yield %>
</body>
</html>

@@ index
<h1>The JSMicroblog</h1>
<h2>Say something!</h2>
<form action="/posts" method="post">
<label for="author">
Who are you?
</label><br />
<input type="text" name="author" id="author" /><br />
<label for="body" />
What do you have to say for yourself?<br />
</label>
<input type="text" name="body" id="body" /><br />
</label>
<input type="submit" name="Submit" />
</form>
<h3>Here's what others have said!</h3>
<ul>
  <% Post.all.sort.reverse.each do |post| %>
    <li><span name="who"><%= post.author %></span> said '<span name="what"><%= post.body %></span>'. <a href="/posts/<%= post.id %>">permalink</a></li>
  <% end %>
</ul>

@@show
<h1>JSMicroblog: A post</h1>
<span name="who"><%= @post.author %></span> said '<span name="what"><%= @post.body %></span>'.
<p><a href="/">Go back to all posts</a></p>

