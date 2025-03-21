package mod

download: {
	#from: string
	#command: string | *"go mod download"
	#directory: string | *"."

	{
		ops: [
			{ copy: ["go.mod", "go.sum"], destination: #directory, from: #from },
			{
				sh: #command
				options: [
					{ directory: #directory },
					{ customName: "🏗️ " + #command + " " + strings.Join($packages, " ") },
				]
			},
		]
	}
}
