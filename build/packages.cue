package build

import (
	"list"
)

packages: {
	#packages: string | [string, ...string] | *"./..."
	#cache: string | *"/var/cache/go"

	let $packages = list.FlattenN([#packages], 1)
	let $cache = #cache

	sh & {
		#command: "go build"
		#cache: $cache
		#arguments: $packages
	}
}
