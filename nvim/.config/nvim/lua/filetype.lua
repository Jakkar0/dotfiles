vim.filetype.add({
	filename = {
		["inventory"] = "yaml.ansible",
		["hosts"] = "yaml.ansible",
		["playbook.yml"] = "yaml.ansible",
		["site.yml"] = "yaml.ansible",
	},
	pattern = {
		[".*/collections/.*%.yml"] = "yaml.ansible",
		[".*/group_vars/.*%.yml"] = "yaml.ansible",
		[".*/host_vars/.*%.yml"] = "yaml.ansible",
		[".*/inventory/.*%.yml"] = "yaml.ansible",
		[".*/molecule/.*%.yml"] = "yaml.ansible",
		[".*/playbooks/.*%.yml"] = "yaml.ansible",
		[".*/roles/.*%.yml"] = "yaml.ansible",
		[".*/tasks/.*%.yml"] = "yaml.ansible",
	},
})
