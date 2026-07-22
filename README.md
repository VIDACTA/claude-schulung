# Claude-Schulung

**🌐 Live: <https://vidacta.github.io/claude-schulung/>**

Interne Schulung für **VIDACTA-Mitarbeiter mit wenig bis keiner Vorerfahrung** zu:

- **Claude Desktop** — die Chat-App im Alltag
- **Cowork** — der Agenten-Modus, echte Aufgaben delegieren
- **Claude Code** — geführter Ausblick für Datei-/Ordner-Arbeit

**Zielgruppe:** reine Nicht-Techniker (Marketing, Vertrieb, Verwaltung, GF).
**Format:** durchklickbare Selbstlern-Site + Grundlage für Live-Workshop + Hands-on-Übungen.

## Aufbau

- `index.html` — Startseite mit Modul-Übersicht (Grundlagen + Aufbau)
- `modul-*.html` — Grundlagen, eine Seite je Modul (9 Module: 0–8)
- `aufbau-*.html` — Aufbau-Track Kreativ/Marketing (5 Module: Chrome-Extension, Connectors, Higgsfield, ElevenLabs, Meta/Google Ads)
- `style.css` — gemeinsames Design (VIDACTA-Markenfarben, Raleway)
- `app.js` — Fortschritt, Copy-Buttons, aufklappbare Boxen, Theme
- `docs/trainer-leitfaden.md` — Leitfaden für den Live-Workshop
- `implementation_plan.md` — Design-/Planungsdokument

## Lokal ansehen

Kein Build-Step nötig — `index.html` im Browser öffnen. Für saubere Navigation empfohlen:

```bash
python -m http.server 8000
```

Dann `http://localhost:8000` öffnen.

## Deployment

GitHub Pages aus dem `main`-Branch (Repo `VIDACTA/claude-schulung`). Kein Build.

## Status

Etappe 1 (Gerüst + Modul 0/1) im Aufbau — siehe `state/current_state.md`.
