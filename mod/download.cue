package mod

download: {
	#from: string
	#command: string | *"go mod download"
	#directory: string | *"."

	{
		ops: [
			{	file: { mkdir: #directory, options: createParents: true } },
			{ copy: ["go.mod", "go.sum"], destination: #directory, from: #from },
			{
				diff: {
					sh: #command
					options: [
						{ directory: #directory },
						{ customName: "🏗️ " + #command },
					]
				}
			}
		]
	}
}
