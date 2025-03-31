package build

import (
	"list"
	"strings"
	"github.com/marxarelli/masse/state"
)

sh: {
	#command: string | *"go build"
	#arguments: string | [string, ...string] | *[]
	#cache: string | *"/var/cache/go"

	let $arguments = list.FlattenN([#arguments], 1)

	ops: (state.#Shell & {
		sh: #command
		arguments: $arguments
		options: [
			{ customName: strings.TrimSpace("🏗️ " + #command + " " + strings.Join($arguments, " ")) },
			{ cache: #cache, access: "locked" },
			{ env: GOCACHE: #cache },
		]
	}).ops
}
