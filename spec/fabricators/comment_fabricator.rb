Fabricator(:comment) do
  commenter "Bob"
  message "Lorem ipsumlkj kajfdkl alkdfjlads"
end

Fabricator(:reply, from: :comment) do
  parent_comment(fabricator: :comment)
end