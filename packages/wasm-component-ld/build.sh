TERMUX_PKG_HOMEPAGE=https://github.com/bytecodealliance/wasm-component-ld
TERMUX_PKG_DESCRIPTION="Command line linker for creating WebAssembly components"
TERMUX_PKG_LICENSE="Apache-2.0, MIT"
TERMUX_PKG_LICENSE_FILE="LICENSE-APACHE, LICENSE-Apache-2.0_WITH_LLVM-exception, LICENSE-MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.5.7"
TERMUX_PKG_SRCURL=https://github.com/bytecodealliance/wasm-component-ld/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=f046d4eb152bbb5637fede88c8f3afacdb64f94ce61448d3ccb71a7b652816ef
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_rust
}

termux_step_make() {
	cargo build --jobs "${TERMUX_PKG_MAKE_PROCESSES}" --target "${CARGO_TARGET_NAME}" --release
}

termux_step_make_install() {
	install -Dm755 -t "${TERMUX_PREFIX}/bin" "target/${CARGO_TARGET_NAME}/release/wasm-component-ld"
}
