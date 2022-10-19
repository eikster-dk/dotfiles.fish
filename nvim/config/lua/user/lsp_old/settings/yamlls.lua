local schema = {}
schema["kubernetes"] = { "/kustomize/**/*.yaml", "/kustomize/**/*.yml" }
schema["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
schema["https://json.schemastore.org/kustomization.json"] = { "/kustomize/**/kustomization.yaml", "/kustomize/**/kustomization.yml"}

return {
	settings = {
		yaml = {
			schemaStore = {
				url = "https://www.schemastore.org/api/json/catalog.json",
				enable = true,
			},
			schemas = schema,
		},
	},
}
