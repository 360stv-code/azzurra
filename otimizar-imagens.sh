#!/bin/bash
# Otimiza as imagens do site Azzurra (rodar na pasta raiz do repositório, no Mac)
# Uso: bash otimizar-imagens.sh
# Usa o "sips" que já vem no macOS — não precisa instalar nada.
set -e
cd "$(dirname "$0")"

if [ ! -d images ]; then echo "Pasta images/ não encontrada. Rode na raiz do site."; exit 1; fi

# Backup (só na primeira vez)
if [ ! -d images-backup ]; then
  cp -R images images-backup
  echo "Backup criado em images-backup/"
fi

# Fotos JPG: limitar a 1200px de largura e comprimir (qualidade 72)
for f in images/*.jpg images/*.jpeg; do
  [ -e "$f" ] || continue
  sips --resampleWidth 1200 --setProperty formatOptions 72 "$f" >/dev/null 2>&1 || \
  sips --setProperty formatOptions 72 "$f" >/dev/null
  echo "Otimizada: $f ($(du -h "$f" | cut -f1))"
done

# Logo: é exibido com ~150px de largura; 400px cobre telas retina
if [ -f images/logo-azzurra-branco.png ]; then
  sips --resampleWidth 400 images/logo-azzurra-branco.png >/dev/null
  echo "Logo redimensionado: $(du -h images/logo-azzurra-branco.png | cut -f1)"
fi

echo ""
echo "Pronto! Confira o site localmente e faça o commit/push."
echo "Meta: nenhuma foto acima de ~150 KB."
