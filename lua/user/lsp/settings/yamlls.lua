return {
	filetypes = {
		"yaml",
		"yaml.ansible",
		"yaml.docker-compose",
		"helm",
	},
	settings = {
		yaml = {
			format = { enable = true, singleQuote = true },
			validate = true,
			hover = true,
			completion = true,
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},
			schemas = {
				-- kubernetes = {
				-- 	"/*.helm.yaml",
				-- 	"/*.k8s.yaml",
				-- },
				["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.9.9-standalone-strict/all.json"] = "/*.k8s.yaml",
				["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
				["https://json.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
				["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-tasks.json"] = "roles/tasks/**/*.{yml,yaml}",
				["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-playbook.json"] = "playbook{s,}/**/*.{yml,yaml}",
				["https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-inventory.json"] = "inventory/*.{ini,yml}",
				["https://json.schemastore.org/prettierrc.json"] = ".prettierrc.{yml,yaml}",
				["https://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
				["https://json.schemastore.org/helmfile"] = "helmfile.{yml,yaml}",
			},
		},
	},
}
