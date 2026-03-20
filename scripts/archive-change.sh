#!/usr/bin/env bash

set -euo pipefail

# =========================
# VALIDACIÓ INPUT
# =========================

CHANGE_DIR="docs/active/current-change"
YEAR=$(date +"%Y")
META_FILE="$CHANGE_DIR/00_meta.md"

has_active_change_files() {
  find "$CHANGE_DIR" -mindepth 1 -maxdepth 1 ! -name '.gitkeep' -print -quit | grep -q .
}

# =========================
# VALIDAR EXISTÈNCIA DE CANVI ACTIU
# =========================

if [ ! -d "$CHANGE_DIR" ] || ! has_active_change_files; then
  echo "❌ No hi ha cap canvi actiu a $CHANGE_DIR"
  exit 1
fi

if [ "${1:-}" ]; then
  CHANGE_NAME="$1"
elif [ -f "$META_FILE" ]; then
  CHANGE_NAME="$(grep '^name:' "$META_FILE" | head -n 1 | cut -d':' -f2- | xargs)"
else
  CHANGE_NAME=""
fi

if [ -z "$CHANGE_NAME" ]; then
  echo "❌ No s'ha pogut determinar el nom del canvi"
  echo "Exemple: ./scripts/archive-change.sh feature-login"
  exit 1
fi

ARCHIVE_BASE="docs/archive/$YEAR"
ARCHIVE_PATH="$ARCHIVE_BASE/$CHANGE_NAME"

# =========================
# VALIDAR QUE NO EXISTEIXI JA L'ARXIU
# =========================

if [ -d "$ARCHIVE_PATH" ]; then
  echo "❌ Ja existeix un arxiu per aquest canvi a:"
  echo "   $ARCHIVE_PATH"
  echo "👉 Tria un altre nom o revisa l'arxiu existent."
  exit 1
fi

# =========================
# CREAR DESTÍ D'ARXIU
# =========================

mkdir -p "$ARCHIVE_BASE"
mkdir -p "$ARCHIVE_PATH"

# =========================
# ACTUALITZAR META SI EXISTEIX
# =========================

if [ -f "$META_FILE" ]; then
  {
    echo ""
    echo "archived_at: $(date +"%Y-%m-%d %H:%M:%S")"
    echo "archived_path: $ARCHIVE_PATH"
    echo "status: archived"
  } >> "$META_FILE"
fi

# =========================
# COPIAR CONTINGUT ACTIU A ARXIU
# =========================

cp -R "$CHANGE_DIR"/* "$ARCHIVE_PATH"/

# =========================
# NETEJAR CONTEXT ACTIU
# =========================

rm -f "$CHANGE_DIR"/*

# =========================
# MISSATGES FINALS
# =========================

echo "✅ Canvi arxivat correctament"
echo "📦 Ruta: $ARCHIVE_PATH"
echo "🧹 Context actiu netejat: $CHANGE_DIR"
