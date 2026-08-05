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

## 2026-07-29 — v1.8.0 → v1.24.0: alle 16 Modulseiten einzeln durchgegangen

Auftrag Dominik: „wir gehen heute jedes modul einzeln durch. und dann sprechen wir noch über die
präsentation." Modus auf Rückfrage festgelegt: Ich fasse jede Seite zusammen und nenne meine
Auffälligkeiten, Dominik entscheidet. Jede Änderung sofort verifiziert, committet, gepusht und live
gegen das Repo gediffed. **Die Präsentation ist noch offen.**

**Die vier gravierendsten Funde:**

1. **Die Schulung verbot etwas, das freigegeben ist.** `legal/themen/werbe-claims.md` erlaubt
   „schulgeldfrei" im Anzeigen-**TEXT** (nur im Bild/Overlay verboten, Festlegung 14.07.2026). Die
   Unterscheidung fehlte site-weit, und Aufbau 5 führte es in der Fehler-Tabelle als *typischen
   Fehler* auf. Dazu fehlten drei Verbote — darunter das einzige rot markierte: **Förder-Zusagen**
   („mit Bildungsgutschein förderfähig", weil Trägerzulassung ≠ Maßnahmenzulassung; „AZAV" kam auf
   der Site nicht einmal vor) — **und die komplette Positivliste** der freigegebenen Angaben.
2. **6 von 23 Copy-Buttons lieferten nur ein Bruchstück.** Ein gerades `"` im `data-copy`-Attribut
   beendet den Wert vorzeitig (Modul 2 brach bei „Kommunikation mit Patienten" ab). Im Browser
   unsichtbar; die frühere Prüfung hatte Buttons *gezählt*, nicht ihren Inhalt verglichen.
3. **KI-Icon-Position widersprach dem Register** (oben rechts ↔ Briefing plante unten), und der
   Safe-Zone-Begriff war im kopierbaren Prompt umgekehrt („frei lassen" statt „dort gehört der
   Inhalt hin") — der erklärende Text war richtig, der Prompt sagte das Gegenteil.
4. **Ampel-Definition lief zwischen Modul 1, Modul 7 und Deck auseinander** — Folgefehler der eigenen
   v1.11.0-Änderung, gefunden erst durch den neuen Konsistenz-Check.

**Vier Muster über alle Seiten:** Regel ohne Begründung (Ampel, GEMA-Falle, Lead-Wege) · Verbot ohne
die positive Seite · Verlässlichkeit suggeriert, wo Prüfen nötig bleibt · Abweichung vom Register.

**Entscheidungen Dominik:** Projekte innerhalb der Abteilung teilen erlaubt · keine Zeitangaben mehr
(34 Stellen entfernt) · Ampelfarben nur für Erlaubnis/Verbot/Pflicht · Register-Stand bei
„schulgeldfrei" · Claim-Lücken alle in Aufbau 5 · Studienzahlen weicher fassen · keine feste
Marken-Stimme.

**Zwei neue Werkzeuge:** `konsistenz-check.ps1` im Repo (11 Regelgruppen, 0 Befunde) und
`.claude/scripts/fix-quotes.ps1` (272 doppelte + 7 einfache Anführungszeichen korrigiert).

**Eigene Fehler:** drei Folgefehler aus v1.10.0/v1.11.0 (nur Modul 1 angepasst, Modul 7 und Deck
vergessen) · ein selbst erzeugtes kaputtes `data-copy` · Prüf-Prompts nach v1.21.0 nicht nachgezogen
(hätten Erlaubtes als Verstoß gemeldet) · Zahlwort-Fehler, von der eigenen Verifikation gefangen.

- Commits: 2f02f0b (1.8.0), 6b3e0b3 (1.9.0), 39d3700 (1.10.0), df087bd (1.11.0), 2be69b5 (1.12.0),
  dbf0133 (1.12.1), c23c5a8 (1.13.0), 60f2ca0 (1.14.0), 435e3d4 (1.15.0), 045cf6d (1.16.0),
  51776d5 (Check-Script), 6f354da (1.17.0), 6472ff2 (1.18.0), c8826e6 (1.19.0), b965688 (1.20.0),
  2168d96 (1.21.0), 1d78e1c (1.22.0), 1c601ad (1.23.0), 3b6ed8b (1.24.0).

## 2026-08-05 — Präsentationstechnik-Learnings aus dem Workspace-Brain
- docs/learnings-praesentationstechnik.md neu (8 Gotchas/Lessons, Migration ADR-018)
- Commits: 18cd5de
