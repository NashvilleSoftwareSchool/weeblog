Fabricator(:post) do
  title "Great Post!"
  body "Really, this is."
  author { Fabricate(:user) }
end

Fabricator(:blog_post, from: :post) do

end
