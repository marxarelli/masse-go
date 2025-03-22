package mod

import (
	"path"
)

download: {
	#from: string
	#command: string | *"go mod download"
	#directory: string | *"/tmp/go"

	{
		ops: [
			{
				file: [
					{ mkdir: #directory, options: createParents: true },
					{ copy: "go.mod", destination: path.Join([#directory, "go.mod"], path.Unix), from: #from },
					{ copy: "go.sum", destination: path.Join([#directory, "go.sum"], path.Unix), from: #from },
				]
			},
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
