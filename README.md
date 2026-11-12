# Avantiris

Website des Vereins Avantiris – Think Tank für KI und die Zukunft der Gesellschaft.
SvelteKit (statisch), Tailwind CSS, anime.js.

## Entwickeln

```sh
nix develop        # nur auf NixOS/Nix nötig: stellt node und typst bereit
npm install
npm run dev        # lokale Vorschau
npm run build      # statische Seite nach ./build
npm run check      # Typen prüfen
```

## Wo ist was

| Was                         | Wo                                                        |
| --------------------------- | --------------------------------------------------------- |
| Texte (Deutsch / Englisch)  | `src/lib/i18n/de.ts`, `src/lib/i18n/en.ts`                |
| Kontaktadresse, Sitz, Name  | `src/lib/site.ts`                                         |
| Domain, Suchmaschinen (SEO) | `src/lib/site.ts`, `src/lib/seo.ts`, `Seo.svelte`         |
| Aufbau der Seite            | `src/lib/components/Home.svelte`                          |
| Scroll-Animation: Zeichnung | `src/lib/components/EpochsScene.svelte`                   |
| Scroll-Animation: Ablauf    | `src/lib/components/Epochs.svelte`                        |
| Arbeitsweise (Bild haftet)  | `src/lib/components/Approach.svelte`                      |
| Einblenden beim Scrollen    | `src/lib/reveal.ts`, `src/app.css`                        |
| Logo                        | `src/lib/components/Logo.svelte`, `static/logo.svg`       |
| Schrift, Textstile          | `src/app.css`                                             |
| Statuten                    | `statuten/statuten.typ` → `npm run statuten`              |

Deutsch ist die Hauptsprache (`/`), Englisch liegt unter `/en/`. `en.ts` muss
dieselben Schlüssel haben wie `de.ts`; `npm run check` meldet, wenn etwas fehlt.

Die Schrift Jost steht unter der SIL Open Font License (`statuten/fonts/OFL.txt`).
