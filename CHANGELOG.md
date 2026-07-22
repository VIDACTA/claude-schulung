# Changelog

Alle nennenswerten Änderungen an diesem Projekt.
Format nach [Keep a Changelog](https://keepachangelog.com/de/1.0.0/), Versionierung nach SemVer.

## [1.2.0] – 2026-07-22

### Added
- **Workbrain-Pitch-Seite** (`workbrain.html`): erklärt das Mitarbeiter-Claude-Produkt (ADR-009) im
  Pitch-Stil — Problem, Vision („mehrere Gedächtnisse, die sich teilen"), konzentrisches
  Ring-Diagramm (0 öffentlich-fähig · 1 intern · 2 Abteilung · 3 GF), Wissensfluss (einordnen → PR →
  Kurator, DSGVO-Gate), Nutzen-Karten, CTA. Navy-Pitch-Hero + Ring-Legende (neue Pitch-Stile in CSS).
- Startseite: Promo-Banner „Workbrain — unser mitwachsendes Firmengehirn" verlinkt den Pitch.
- Bewusst ohne interne Admin-Details/IDs auf der öffentlichen Seite (Ringe konzeptuell benannt).

## [1.1.0] – 2026-07-22

### Added
- **Aufbau-Track „Kreativ- & Marketing-Werkzeuge"** (rollenspezifisch, eigener Fortschrittsbalken):
  - Aufbau 1: Claude im Browser (Chrome-Erweiterung) inkl. Browser-Sicherheit/Prompt-Injection.
  - Aufbau 2: Connectors & KI-Werkzeuge (Überblick, Claude als Steuerzentrale, Credits/Kosten).
  - Aufbau 3: Bilder & Videos mit Higgsfield — KI-Kennzeichnungspflicht (Art. 50), Claim-Regeln, Safe Zones, Reel 9:16.
  - Aufbau 4: Ton, Sprache & Musik mit ElevenLabs — deutsche VO, eine Stimme/Reel, BGM −15 dB, GEMA-Falle.
  - Aufbau 5: Social Ads Meta & Google — DSGVO-Lead-Regeln (nur Website/v-forms), EMPLOYMENT-Targeting, GA4/generate_lead, Read-only-Default.
- Startseite: zweiter Bereich + zweiter Fortschrittsbalken; `app.js` um Aufbau-Liste erweitert.
- Trainer-Leitfaden um Aufbau-Track ergänzt.

## [1.0.0] – 2026-07-22

### Added
- Projekt-Init: Doku-Struktur, `implementation_plan.md` aus Brainstorming.
- Site-Gerüst: `index.html`, `style.css`, `app.js`, Komponenten (Ampel-Regel, Tipp/Achtung-Boxen, Copy-Buttons, Fortschritt).
- Alle 9 Module ausformuliert (Modul 0–8): Willkommen, Desktop Basics, Prompten, Projekte & Wissen,
  Cowork, Skills & Connectors, Claude Code (Ausblick), Sicherheit & DSGVO, Abschluss-Challenge.
- Trainer-Leitfaden für Ganztags-Workshop (`docs/trainer-leitfaden.md`).
- Veröffentlichung auf GitHub Pages: <https://vidacta.github.io/claude-schulung/>

### Hinweise
- Screenshots sind aktuell Platzhalter — echte Bilder aus der Team/Enterprise-Umgebung folgen.
