# Session Log — Claude-Schulung

## 2026-07-22 — Projektstart & Etappe 1

- Brainstorming durchgeführt (Zielgruppe, Format, Umfang, Ablage geklärt).
- `implementation_plan.md` erstellt und genehmigt.
- Entscheidungen: Nicht-Techniker · Team/Enterprise · Seite-pro-Modul · Deutsch · statisch/no-build.
- Projekt-Init: PROJECT_META.json, README, CHANGELOG, state/, logs/.
- Site-Gerüst (index/style/app) + Modul 0/1 als Muster gebaut.
- Alle 9 Module (0–8) ausformuliert + Trainer-Leitfaden (docs/).
- 4 beschriftete SVG-Oberflächendiagramme statt Platzhalter (Modul 0/1/3/5).
- Release **v1.0.0**, live auf GitHub Pages: https://vidacta.github.io/claude-schulung/
- Commits: 0fde04a (Grundgerüst+Modul 0/1), 70d2c87 (Module 2–8+Leitfaden, v1.0.0), 4232ada (SVG-Diagramme).
- Offen: echte Screenshots, Modul-7-Ansprechpartner, optional Zertifikat/Druckansicht.

## 2026-07-22 (später) — v1.1.0: Aufbau-Track Kreativ & Marketing

- Fix: Weiter-Link Modul 1 → Modul 2 (war „in Arbeit").
- Neuer Bereich „Aufbau" auf der Startseite + zweiter Fortschrittsbalken (app.js: AUFBAU-Liste, ids 20–24).
- 5 Aufbau-Module: Claude im Browser (Chrome-Ext.), Connectors & KI-Werkzeuge, Higgsfield (Bild/Video),
  ElevenLabs (Ton/Sprache/Musik), Social Ads Meta & Google.
- Verbindliche Regeln eingebaut: KI-Kennzeichnung (Art. 50), keine Versprechen, Azubi-Leads nur
  Website/v-forms, Meta-EMPLOYMENT-Targeting, eine Stimme/Reel, BGM −15 dB, GEMA-Falle, Read-only-Default.
- Interne IDs/Keys/Namen bewusst NICHT auf der Public-Site („beim Team erfragen").
- Trainer-Leitfaden + Doku (PROJECT_META/CHANGELOG/README/state) aktualisiert.

## 2026-07-22 (noch später) — v1.2.0: Workbrain-Pitch

- Pitch-Seite `workbrain.html` (ADR-009 Ringaufbau) im Pitch-Stil: Problem/Vision, konzentrisches
  Ring-Diagramm (0–3), Wissensfluss (einordnen→PR→Kurator, DSGVO-Gate), Nutzen-Karten, CTA.
- Neue Pitch-Stile in style.css (Navy-Hero, Promo-Banner, Ring-Legende, Benefit-Cards).
- Promo-Banner auf der Startseite verlinkt den Pitch.
- Ringe nur konzeptuell benannt; keine Admin-Details/Team-/Repo-Interna auf der Public-Site.

## 2026-07-24 — v1.3.0: Vertiefungs-Track (Nachtrag)

- Vertiefung 1 (Wie Claude wirklich funktioniert: Kontext, Context Rot, Halluzinationen) +
  Vertiefung 2 (Desktop voll ausnutzen: Projekte, Artefakte, Routinen, Anpassen, Geplant).
- Details im CHANGELOG [1.3.0]; Session dokumentiert im Brain (2026-07-24).
- Commits: b399b18 (v1.2.0), f10b816 (Three.js-Hero), 73afa00 (v1.3.0).

## 2026-07-27 — v1.4.0 + v1.5.0: Komplett-Überarbeitung

- **v1.4.0 (Technik/Typografie):** Raleway selbst gehostet (`fonts/`, @fontsource, OFL) — Google
  Fonts von allen 18 Seiten entfernt (DSGVO); ~250 Geviertstriche → Halbgeviertstriche
  (vidacta-textqualitaet-Audit); Favicon; Lernpfad Modul 8 → Vertiefung/Aufbau verlinkt;
  Vertiefung 1 versionsfest formuliert; Text-Fixes (Modul-0-Satz, „promptet").
- **v1.5.0 (Inhalt, 9 Punkte):** Prompt-Injection-Abschnitt Modul 7 (+ Querverweis Vertiefung 1);
  Challenge-Variante C Bewerber-Kommunikation (Modul 8); Alltagskleidung-Regel Aufbau 3
  (Gestaltung/QA/Kurzcheck); Rückfragen-Kniff Modul 2; Websuche-Hinweis + Fortschritts-FAQ
  Modul 0; Vertiefungs-Track im Trainer-Leitfaden ergänzt; Homoglyphen-Fix („Klарmachen").
- Verifikation je Release: lokaler PHP-Preview-Server, Netzwerk-Check (keine externen Requests),
  20 interne Linkziele HTTP 200, Konsole sauber; Live-Check nach Push bestanden.
- Commits: 287cbf8 (v1.4.0), 145300d (v1.5.0).
- Neuer Auftrag am Session-Ende: **animierte Präsentation zur Schulungsseite** (Scoping offen).

## 2026-07-27 (Nachmittag) — v1.6.0–1.7.0: Deck, Mobil-Audit, Content-Ausbau

- **v1.6.0/1.6.1/1.6.2:** Workshop-Eröffnungs-Deck `praesentation.html` (Folien-Engine ohne
  Build-Step, 3 Live-Momente am eigenen Team-Seat), auf der Startseite als Trainer-Karte verlinkt.
- **v1.6.3 Mobil-Audit** (320/375/414/768/1280 px, alle 19 Seiten): SVG-Diagramme waren mit ~7 px
  Beschriftung unlesbar → Mindestbreite + seitliches Scrollen mit sticky Caption; Copy-Buttons
  25 → 38 px; Deck-Ampelfolie wurde abgeschnitten → Folien scrollen; lange deutsche Komposita
  sprengten das Layout → `overflow-wrap: break-word` + `hyphens: auto`; Kopfzeile ≤380 px kompakter.
- **v1.7.0 Content-Audit:** 6 parallele Fach-Reviewer + adversariale Gegenprobe → Bewertung je Seite
  (Präsentation, Modul 8, Aufbau 1 und 4 lagen bei 2/5). **49 Ergänzungen** eingebaut: Deck 11 → 15
  Folien (Anwendungsfälle, „Claude kann sich überzeugend irren", Was Claude nicht ist,
  Cowork-Vorgeschmack), Modul 8 mit Spick-Hilfe/Stolperfallen/Ergebnis-Check, Modul 7 mit
  Anonymisierungs-Beispiel und Grauzonen-Übung, Beispiel-Tabellen und Prüf-Prompts in Modul 3–5
  und im gesamten Aufbau-Track, Selbst-Tests in beiden Vertiefungen.
- Verifikation: Tag-Balance aller Seiten, Typografie-Scan (Geviertstrich/Homoglyphen/
  Anführungszeichen), 49 Inhalts-Marker, Mobil-Durchlauf mit geöffneten Accordions, Konsole sauber.
- Commits: 287cbf8 (1.4.0), 145300d (1.5.0), 9913d2b (docs), 81d931c (1.6.0), 99c0617 (1.6.1),
  c648c91 (1.6.2), bd48f06 (1.6.3), 6ea2d87 (1.7.0).

## 2026-07-28 — v1.7.1: Layout-Fix im Eröffnungs-Deck

- **„Live-Moment"-Pillen liefen über die volle Folienbreite** (1072 px statt 263–361 px, alle drei
  Live-Folien). Ursache: `.live-badge` ist `inline-flex`, wird als Flex-Item von `.slide` aber
  **blockifiziert** (`inline-flex` → `flex`) und von `align-items: stretch` gestreckt.
  Fix: `align-self: flex-start` mit erklärendem CSS-Kommentar.
- Verifiziert bei 1280×800 (Beamer), 1920×1080 und 375×812 — Pillen exakt auf Inhaltsbreite,
  kein Seitenüberlauf; übrige direkte Folien-Kinder gegengeprüft.
- Commits: ff9233b.
