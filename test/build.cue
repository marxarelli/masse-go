package test

import (
	gobuild "github.com/marxarelli/masse-go/build"
	state "github.com/marxarelli/masse/state"
)

test_sh: {
	no_arguments: state.#Op & gobuild.sh & {
		#command: "make"
	}
	arguments: state.#Op & gobuild.sh & {
		#command: "make"
		#arguments: ["foo"]
	}
}

test_packages: {
	default_packages: state.#Op & gobuild.packages
	given_packages: state.#Op & gobuild.packages & {
		#packages: ["./foo", "./bar"]
	}
}
