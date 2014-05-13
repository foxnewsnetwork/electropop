json.id project.id
json.permalink project.permalink
json.title project.title
json.tagline project.tagline
json.description project.description
json.pic "images/ruby.png"
json.purpose project.purpose
json.type project.project_type

json.backends do
  json.partial! partial: 'elect/project/framework', collection: project.backends, as: :framework
end
json.frontends do
  json.partial! partial: 'elect/project/framework', collection: project.frontends, as: :framework
end
json.languages do
  json.partial! partial: 'elect/project/language', collection: project.languages, as: :language
end
