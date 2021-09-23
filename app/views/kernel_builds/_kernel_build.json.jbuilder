json.extract! kernel_build, :id, :kernel_source_id, :kernel_config_id, :artifact_url, :created_at, :updated_at
json.url kernel_build_url(kernel_build, format: :json)
