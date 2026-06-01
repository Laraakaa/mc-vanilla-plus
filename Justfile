# Run `just` or `just --list` to see commands.

# Show available recipes
default:
    @just --list

# Add a Modrinth mod (slug or full URL). packwiz searches if the slug is fuzzy.
add slug:
    packwiz mr install "{{slug}}"

# Add a CurseForge mod (slug or full URL)
add-cf slug:
    packwiz cf install "{{slug}}"

# Remove a mod by name
remove slug:
    packwiz remove "{{slug}}"

# Re-index after manually adding/editing files in config/ etc.
refresh:
    packwiz refresh

# Update every mod to its latest compatible version
update:
    packwiz update --all

# Build the distributable .mrpack into ./dist
export:
    mkdir -p dist
    packwiz mr export -o "dist/pack.mrpack"
    @echo "Built dist/pack.mrpack — import this in Prism."

# Sanity check: refresh + list what's tracked
status:
    packwiz refresh
    @ls mods/*.pw.toml 2>/dev/null | wc -l | xargs echo "tracked mods:"
