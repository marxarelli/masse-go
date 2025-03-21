package build

import (
	"list"
	"strings"
)

build: {
	#command: string | *"go build"
	#packages: string | [string, ...string] | *"./..."
	#cache: string | *"/var/cache/go"

	let $packages = list.FlattenN([#packages], 1)

	{
		sh: #command
		arguments: $packages
		options: [
			{ customName: "🏗️ " + #command + " " + strings.Join($packages, " ") },
			{ cache: #cache, access: "locked" },
			{ env: GOCACHE: #cache },
		]
	}
}
