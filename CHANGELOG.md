# Changelog

Alle nennenswerten Änderungen an diesem Projekt.
Format nach [Keep a Changelog](https://keepachangelog.com/de/1.0.0/), Versionierung nach SemVer.

## [1.4.0] – 2026-07-27

### Changed
- **Raleway selbst gehostet** (`fonts/`, Quelle @fontsource, SIL Open Font License; 5 Gewichte,
  Subsets latin + latin-ext): Google-Fonts-Einbindung von allen 18 Seiten entfernt – keine
  IP-Übertragung an Google-Server mehr. Die Schulung lehrt die Datenschutz-Ampel; jetzt hält
  sich die Site selbst daran.
- **Deutsche Typografie:** Geviertstriche (—) site-weit durch Halbgeviertstriche (–) ersetzt
  (alle HTML-Seiten, app.js, README, Trainer-Leitfaden).
- Vertiefung 1: Modell-Aussagen versionsfest formuliert („jede neue Modell-Generation" statt
  konkreter Versionsnamen wie „Opus 4.8") – der Text veraltet nicht mehr mit jedem Modellwechsel.
- Modul 8: „Wie es weitergeht" verlinkt jetzt Vertiefungs- und Aufbau-Track; die
  „Weiter"-Navigation führt zu Vertiefung 1 statt zurück zur Übersicht (durchgehender Lernpfad).
- Startseite: Hero-Text nennt die Tracks in Seiten-Reihenfolge (Grundlagen → Vertiefung → Aufbau);
  Fortschrittslabel präzisiert („Grundlagen-Modulen", auch in app.js).

### Added
- Favicon (VIDACTA-Zeichen `vidacta-mark.svg`) auf allen 18 Seiten.

### Fixed
- Modul 0: verunglückter Satz („nichts installieren-verstehen") korrigiert.
- Vertiefung 1: Tippfehler „prompted" → „promptet".

## [1.3.0] – 2026-07-24

### Added
- **Vertiefungs-Track „Claude verstehen & voll ausnutzen"** (eigener Bereich auf der Startseite,
  eigener Fortschrittsbalken; bestehende Module 0–8 unverändert):
  - **Vertiefung 1 – Wie Claude wirklich funktioniert:** KI-Grundwissen (Sprachmodell = Wort-Vorhersage,
    „Sprach-Genie, kein Fakten-Tresor"), zusätzliche gute/schlechte Prompt-Beispiele (K-A-F-T),
    „Was ist Kontext?" (Kontextfenster/Schreibtisch-Analogie, Tokens), **Kontextmüdigkeit / Context Rot /
    „Dumb Zone"** mit **erklärendem Inline-SVG-Chart** (Fehlerquote ↑ je länger der Chat; grün/gelb/rot,
    bewusst ohne Messwerte) + Gegenmittel, und **Halluzinationen** (3 Ursachen inkl. „Raten wird belohnt",
    5 Gegenmittel mit „Nicht-wissen erlauben" zuerst, ehrliche Einordnung neuerer Modelle wie Opus 4.8:
    gemildert, nicht gelöst). Faktenbasis via verifizierter Recherche (Chroma „Context Rot" 2025,
    „Lost in the Middle" Liu et al. 2023) — keine erfundenen Zahlen, kein Fest-Nageln an Versionen.
  - **Vertiefung 2 – Claude Desktop voll ausnutzen:** Projekte (Wiederholung), Artefakte (Galerie +
    Teilen per Link), Routinen, Anpassen (inkl. Stile) und Geplant (Cloud-Lauf) — jeweils mit
    VIDACTA-Beispiel, Sidebar-Übersichts-Diagramm, „Spickzettel"-Tabelle und ehrlichem Hinweis, dass
    Routinen/Geplant sich je nach Version/Produkt überschneiden.
- Startseite: dritter Bereich („Vertiefung") + dritter Fortschrittsbalken; Hero-Text ergänzt.
  Querverweise aus Modul 2 → Vertiefung 1 und Modul 3 → Vertiefung 2 (in den Durchklick-Fluss eingehängt).
- `app.js`: Vertiefungs-Liste (IDs 10–11), dritter Fortschrittsbalken, dezente Chart-Reveal-Animation
  (IntersectionObserver, `prefers-reduced-motion`-sicher; Kurve ist ohne JS/Animation trotzdem sichtbar).
- `style.css`: theme-fähige Chart-Stile (`svg.dia .curve/.zone*/.axis` …) und leichte Tabellen-Stile.

### Fixed
- Startseiten-„Erledigt"-Haken wurde nur im ersten Modul-Grid gesetzt (`querySelector` →
  `querySelectorAll`); jetzt korrekt in allen Bereichen (Grundlagen, Vertiefung, Aufbau).

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
