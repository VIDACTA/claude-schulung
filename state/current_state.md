# Current State — Claude-Schulung

**Stand:** 2026-07-29
**Version:** 1.8.0 (lokal verifiziert; **noch nicht gepusht** = noch nicht live)
**Mobil geprüft:** 320 / 375 / 414 px über alle 19 Seiten, kein Überlauf (erneut mit v1.7.0)
**Content-Tiefe geprüft:** Audit aller Seiten am 27.07. (6 Reviewer + Gegenprobe), 49 Ergänzungen eingebaut

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
- [x] **v1.6.0–1.6.3:** Workshop-Eröffnungs-Deck `praesentation.html`, auf der Startseite verlinkt,
      Mobil-Audit (Diagramme lesbar, Touch-Ziele, Wortumbruch)
- [x] **v1.7.0 Content-Ausbau:** 49 geprüfte Ergänzungen aus dem Seiten-Audit – Deck 11 → 15 Folien,
      Modul 8 von Challenge-Liste zu vollem Abschlussmodul, Aufbau 1/4 mit Anwendungsfällen und
      Beispielen, überall Tabellen/FAQ/Übungen statt reiner Aufzählungen
- [x] **v1.8.0 Ampel-Bereinigung:** Grün/Gelb/Rot gilt nur noch dort, wo die Farbe eine Erlaubnis
      oder ein Risiko bewertet (8 Blöcke). Fünf Blöcke, die Fähigkeiten, gleichwertige Alternativen
      oder Prüffragen zeigten, laufen jetzt über das neutrale Muster `.infogrid`/`.infocard`
      (Modul 0, 3, 5, 6, Vertiefung 1). Dazu: Beispiel-Prompt in Modul 0 deckt Schulen und
      Anerkennungsbegleitung ab; fester Tagesablauf aus dem Trainer-Leitfaden entfernt
- [x] Live: https://vidacta.github.io/claude-schulung/ (Stand v1.7.1)

## Offen / nächste Schritte
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
