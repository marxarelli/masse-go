package go

import (
	gobuild "github.com/marxarelli/masse-go/build"
	gomod "github.com/marxarelli/masse-go/mod"
)

build: gobuild.build
mod: {
	download: gomod.download
}
