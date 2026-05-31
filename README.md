# 🎴 Pokémon TCG — Colecciones Web

Web estática para GitHub Pages que muestra todas las colecciones de Pokémon TCG con sus cartas, imágenes y precios de mercado en tiempo real.

---

## ✅ ¿Qué incluye?

- **Todas las colecciones** organizadas con logo, símbolo, fecha y serie
- **Filtros y búsqueda** de colecciones y cartas
- **Precios de Cardmarket (€) y TCGPlayer ($)** por carta
- **Imágenes oficiales** de cada carta vía pokemontcg.io
- **Paginación** (60 cartas por página)
- **100% HTML/CSS/JS** — sube el `index.html` a GitHub Pages y listo

---

## 🚀 Cómo subir a GitHub Pages

1. Crea un repositorio en GitHub (puede ser público o privado con Pages activo)
2. Sube el fichero `index.html` a la rama principal (`main`)
3. Ve a **Settings → Pages → Source → Deploy from a branch → main / root**
4. En ~1 minuto tu web estará en `https://TU_USUARIO.github.io/TU_REPO/`

---

## 🔑 APIs utilizadas

### 1. pokemontcg.io (gratuita — RECOMENDADA)

Esta API es la fuente principal. Proporciona:
- Datos de todos los sets (logo, símbolo, fecha, serie…)
- Datos de todas las cartas (nombre, imagen, rareza, número…)
- **Precios integrados** de Cardmarket (€) y TCGPlayer ($) — ¡sin API de terceros!

**Registro gratuito:**
👉 https://dev.pokemontcg.io

**Sin API key:** funciona pero con límite de ~1000 req/día.  
**Con API key:** límite ampliado a 20.000 req/día.

> La web ya tiene un botón "🔑 API Keys" que guarda tu key en tu navegador (localStorage). No hace falta tocar código.

### 2. (Opcional) tcgapi.dev

Si quieres precios adicionales o históricos:
- 100 req/día gratis
- Registro: https://tcgapi.dev
- Modifica `CONFIG.PRICE_MODE = 'tcgapi'` en el `<script>` del index.html

### 3. (Opcional) pokemonpricetracker.com

- 100 créditos/día gratis
- Registro: https://www.pokemonpricetracker.com
- Útil para datos japoneses o PSA graded

---

## 💰 ¿De dónde vienen los precios?

La API de **pokemontcg.io ya incluye precios** de:

| Fuente | Moneda | Campo en API |
|--------|--------|-------------|
| Cardmarket | € (EUR) | `card.cardmarket.prices.averageSellPrice` |
| TCGPlayer | $ (USD) | `card.tcgplayer.prices.normal.market` |

La web muestra Cardmarket (€) como prioritario (perfecto para España/Europa) y TCGPlayer ($) como fallback.

---

## 🖼️ Insertar imágenes propias (opcional)

Si quieres usar tus propias imágenes en lugar de las de la API:

1. Crea una carpeta `img/` en tu repositorio
2. Nombra las imágenes con el formato `{setId}-{cardNumber}.png`  
   Ejemplo: `swsh1-001.png`, `base1-4.png`
3. En el `index.html`, localiza esta línea:
   ```js
   const imgUrl = card.images?.small;
   ```
   Y cámbiala por:
   ```js
   const imgUrl = `img/${card.set.id}-${String(card.number).padStart(3,'0')}.png`;
   ```

---

## ⚙️ Configuración rápida (en el código)

Busca el bloque `CONFIG` en el `<script>`:

```js
const CONFIG = {
  PKMN_API: 'https://api.pokemontcg.io/v2',  // no tocar
  PRICE_MODE: 'pokemontcg',   // 'pokemontcg' | 'none'
  CARDS_PER_PAGE: 60,          // cartas por página (ajusta según tu gusto)
};
```

---

## 🔗 Complementar tu web existente

Para enlazar desde tu web principal al catálogo:

```html
<a href="https://TU_USUARIO.github.io/TU_REPO/" target="_blank">
  Ver todas las colecciones →
</a>
```

O embeber en un iframe:
```html
<iframe src="https://TU_USUARIO.github.io/TU_REPO/"
  width="100%" height="800px" frameborder="0"></iframe>
```

---

## 📋 Recursos

| Recurso | URL |
|---------|-----|
| API Pokémon TCG | https://pokemontcg.io |
| Registro API key | https://dev.pokemontcg.io |
| Documentación API | https://docs.pokemontcg.io |
| CardMarket | https://www.cardmarket.com |
| TCGPlayer | https://www.tcgplayer.com |
| GitHub Pages (guía) | https://pages.github.com |

---

## 📝 Notas legales

- Las imágenes de cartas son © The Pokémon Company / Nintendo / Creatures Inc.
- Los precios son datos públicos de marketplaces
- Esta web es solo para uso personal/fan
