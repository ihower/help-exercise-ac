
json.id message.id
json.title message.title
json.content message.content
json.user do
  json.id message.user.id
  json.display_name message.user.display_name
  json.email message.user.email
end
json.views_count message.views_count

json.photo_original_url asset_url(message.photo.url)
json.photo_medium_url asset_url(message.photo.url(:medium))
json.photo_thumb_url asset_url(message.photo.url(:thumb))

json.photo_file_name message.photo_file_name
json.photo_content_type message.photo_content_type
json.photo_file_size message.photo_file_size
json.photo_updated_at message.photo_updated_at

json.created_at message.created_at
json.updated_at message.updated_at