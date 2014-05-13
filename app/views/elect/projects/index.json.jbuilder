json.projects do
  json.partial! partial: 'elect/project/project', collection: projects, as: :project
end