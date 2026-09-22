for pkg in build/*/; do
	stow -d build -t "$HOME" "$(basename "$pkg")"
done
