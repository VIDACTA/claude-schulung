# Current State — Claude-Schulung

**Stand:** 2026-07-27
**Version:** 1.6.0 (lokal verifiziert; Deploy = Push auf `main`, GitHub Pages)

## Wo wir stehen

- [x] Alle drei Tracks live: Grundlagen (Modul 0–8), Vertiefung (1–2), Aufbau (1–5) + Workbrain-Pitch
- [x] Trainer-Leitfaden (docs/trainer-leitfaden.md)
- [x] **v1.4.0 Überarbeitung:** Raleway selbst gehostet (Google Fonts raus, DSGVO), Favicon,
      deutsche Typografie (Geviertstrich → Halbgeviertstrich), Lernpfad Modul 8 → Vertiefung/Aufbau
      verlinkt, Vertiefung 1 versionsfest formuliert, Text-Fixes (Modul 0, „promptet")
- [x] **v1.5.0 Inhalts-Ausbau:** Prompt-Injection-Abschnitt (Modul 7), Challenge-Variante C
      Bewerber-Kommunikation (Modul 8), Alltagskleidung-Regel (Aufbau 3), Rückfragen-Kniff
      (Modul 2), Websuche-Hinweis + Fortschritts-FAQ (Modul 0), Vertiefungs-Track im
      Trainer-Leitfaden, Querverweis Modul 7 → Vertiefung 1, Homoglyphen-Fix
- [x] Live: https://vidacta.github.io/claude-schulung/ (v1.3.0 verifiziert deployed; v1.4.0 nach Push)

## Offen / nächste Schritte

- ~~Animierte Präsentation zur Schulungsseite~~ → **erledigt in v1.6.0**: `praesentation.html`
  (Workshop-Eröffnungs-Deck mit 3 Live-Momenten am eigenen Team-Seat). Dominiks Feedback nach
  dem ersten echten Einsatz einarbeiten.
- Echte Screenshots aus der Team/Enterprise-Umgebung einsetzen (aktuell beschriftete SVG-Schemata —
  bewusst gewählt, funktioniert; echte Screenshots wären „nice to have").
- Interne Ansprechpartner + Richtlinien-Links in Modul 7 eintragen (nur für interne Version —
  auf der Public-Site bewusst keine Personennamen).
- Feedback der ersten Schulung einarbeiten; ggf. Aufbaukurs Claude Code.

## Geklärte Entscheidungen

- Zielgruppe: reine Nicht-Techniker · Sprache: Deutsch · Plan im Haus: Team/Enterprise
- Navigation: Seite pro Modul · Stack: statisches HTML/CSS/JS, kein Build-Step
- Repo public (Org-Plan kann keine privaten Pages) → keine Personennamen/Interna auf der Site
- Fonts: selbst gehostet aus @fontsource (SIL OFL), Subsets latin + latin-ext, Gewichte 400–800
- Modell-Aussagen in Inhalten versionsfest halten (kein Fest-Nageln an Modellnamen)
