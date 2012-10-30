Fabricator(:post) do
  title "Great Post!"
  body "Really, this is."
end

Fabricator(:blog_post, from: :post) do

end
