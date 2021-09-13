json.extract! kernel_source, :id, :git_repo, :git_ref, :created_at, :updated_at
json.url kernel_source_url(kernel_source, format: :json)
