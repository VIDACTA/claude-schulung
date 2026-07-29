# Current State — Claude-Schulung

**Stand:** 2026-07-29
**Version:** 1.26.0 (lokal verifiziert; Deploy = Push auf `main`, GitHub Pages)
**Typografie:** deutsche Anführungszeichen vollständig (0 gerade Schließer, 0 ohne Öffner) —
prüfbar mit `.claude/scripts/fix-quotes.ps1 -Path C:\Dev\claude-schulung -Include '*.html'`
**Konsistenz:** `konsistenz-check.ps1` — 11 Regelgruppen über alle 20 Seiten, 0 Befunde (29.07.);
Regeln prüfen Muster statt exakter Sätze, mit Positiv-/Negativprobe getestet
**Copy-Buttons:** alle Prompts geprüft, Attribut und sichtbarer Text zeichengleich
**Layout gemessen (29.07.):** Deck bei 320/375/414/1280/1366/1920 px, Seiten bei
320/375/414/768/1280 px — kein Überlauf, keine Schrift unter 11 px
**Content-Tiefe geprüft:** Audit aller Seiten am 27.07. (6 Reviewer + Gegenprobe), 49 Ergänzungen eingebaut

> ⚠️ **Beide Prüf-Scripts brauchen UTF-8 MIT BOM.** Sie enthalten deutsche Anführungszeichen im
> Code; ohne BOM liest Windows PowerShell 5.1 die Datei als ANSI und stirbt mit einem
> Parser-Fehler — genau auf dem Aufrufweg, der hier dokumentiert ist. Beide waren am 29.07.
> davon betroffen und sind gefixt. Nach jeder Script-Änderung in **beiden** Shells gegenprüfen
> (`powershell -File …` und `pwsh -File …`).

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
- [x] **v1.9.0 Farbsprache + Modul 2:** keine Zeitangaben mehr (34 Stellen); 🔴/🟢 nur noch für
      Erlaubnis, Verbot und Pflicht – Qualitätsvergleiche laufen über ✗/✓ (`.callout.nein/.ja`);
      Ampelstreifen der Deck-Folie zurückgeholt; Modul 2 um einen K-A-F-T-Prompt aus dem
      Schulbetrieb und den Abschnitt „eigenen Text verbessern lassen" erweitert
- [x] **v1.10.0 Modul 0/1/7:** Anonymisierungs-Beispiel erkennbar fiktiv (kein realistischer
      Personendatensatz auf der öffentlichen Seite); Ampel-Begründung nachgeschärft („Warum ist das
      so streng?" – Daten verlassen das Haus, Gesundheitsdaten, Name nie nötig, Auskunftspflicht);
      Meldeweg „nicht löschen, melden" schon in Modul 1; Gender-Konstruktion bei den
      Datenschutzbeauftragten geglättet
- [x] **v1.11.0 Ampel präzisiert:** interne Dokumente ohne Personenbezug von Gelb nach Grün, Gelb
      klarer auf „enthält Personenbezug, den du entfernst" zugeschnitten (inkl. indirekter
      Erkennbarkeit); neuer Hinweis, dass Personenbezug und Vertraulichkeit zwei verschiedene
      Prüfungen sind
- [x] **v1.12.0 Modul 3:** Prüf-Hinweis („Wissens-Datei ist keine Garantie", Stichprobe),
      Teilen-Hinweis („wer sieht es danach?"), Ausklapper zur Projekt-Größe („ein Projekt = ein
      Zweck") mit Querverweis auf Vertiefung 1, zwei Projekt-Ideen aus Schulbetrieb und Verwaltung
- [x] **v1.13.0 Modul 4:** Prompt Injection schon im Cowork-Modul (dort wechselt das Risiko die
      Kategorie: Claude *irrt* sich vorher, *handelt* ab hier), Hinweis „wo landet das Ergebnis",
      keine festen Funktionsnamen mehr („geführter Einstieg" statt „Einrichtungsassistent"),
      Ampel-Check ohne vorweggenommene Antwort
- [x] **v1.14.0 Modul 5:** keine Unbedenklichkeits-Erklärung mehr („datenschutzrechtlich unkritisch"
      → IT/Datenschutz entscheiden), Skills mit Ohne-/Mit-Vergleich erklärt statt nur genannt,
      Abgrenzung Projekt-Teilen ↔ IT-Verbindung, Maßstab für die drei Prüffragen
- [x] **v1.15.0 Modul 6 + Typografie:** kein Versprechen mehr auf einen noch nicht existierenden
      Aufbaukurs, Beispieldatei als Word statt Markdown, Querverweis auf Modul 4 — dazu site-weit
      272 Anführungszeichen-Schließer korrigiert (`"` → `“`)
- [x] **v1.16.0 Modul 7 + Konsistenz-Check:** Ampel-Definition in Modul 7 und Deck an Modul 1
      angeglichen (Folgefehler aus v1.11.0), realistische Personendatensätze ersetzt, Ampel-Begründung
      auch im Pflichtmodul, Prompt-Injection-Tonalität mit Modul 4 abgeglichen
- [x] **v1.17.0 Modul 8 + zwei Funde:** 6 von 23 Copy-Buttons lieferten ein Bruchstück (gerades `"`
      beendete das `data-copy`-Attribut) — alle repariert und im Check verankert; einfache
      Anführungszeichen und Apostrophe vervollständigt; Challenge-Variante D für Lehrkräfte;
      kein Zertifikat-Versprechen mehr
- [x] **v1.18.0 Vertiefung 1:** unbelegte Studienzahlen weicher gefasst (die Seite lehrt selbst
      Quellenprüfung), „ins Projekt damit" mit Kontext-Vorbehalt versehen, neuer Abschnitt zum längeren
      „Nachdenken" — Merksatz: hilft beim Denken, nicht beim Wissen
- [x] **v1.19.0 Vertiefung 2:** Teilen per Link als eigene Kategorie („verlässt das Haus", anders als
      Projekt-Teilen in der Abteilung), geplante Aufgaben mit Prompt Injection verknüpft (fremde Inhalte
      ohne Aufsicht), zwei Vorbereitungspunkte im Trainer-Leitfaden
- [x] **v1.20.0 Aufbau 1:** zwei Ampel-Checks nahmen die Antwort vorweg (Muster aus Modul 4 gewandert —
      Check prüft jetzt das Muster, nicht den Satz); Handgriff-Regel „Erweiterung schließen, bevor du ins
      Postfach wechselst"; Prompt Injection mit Modul 4/7 verknüpft statt neu eingeführt
- [x] **v1.21.0 Aufbau 2/4/5 — Claim-Regeln gegen das Rechts-Register abgeglichen:** „schulgeldfrei" ist
      im Anzeigentext freigegeben (war site-weit pauschal verboten, in Aufbau 5 sogar als Fehler-Beispiel);
      drei fehlende Verbote ergänzt (Förder-Zusagen als rot markiertes, Vergütung, Wirkversprechen);
      Positivliste der freigegebenen Angaben eingefügt; Check-Regel 11 sichert die Vollständigkeit
- [x] **v1.22.0 Aufbau 3 gegen `legal/themen/ai-act.md` abgeglichen:** KI-Icon gehört **oben rechts**
      (Briefing plante es unten ein), Safe-Zone-Begriff im Prompt war umgekehrt, zwei Icon-Sprachfassungen
      ergänzt, lizenzierte Stock-Bibliothek als erste Option (kein KI-Icon nötig), Personen-Hinweis vom
      Ampel-Verweis gelöst, Kurzcheck mit leeren Kästchen
- [x] **v1.23.0 Aufbau 4/5:** Prüf-Prompts kannten die neuen Verbote nicht (Folgefehler v1.21.0) und
      hätten „schulgeldfrei" im Anzeigentext als Verstoß gemeldet; GEMA-Falle erklärt statt nur benannt
      (organische Posts ≠ bezahlte Anzeigen); keine feste Marken-Stimme — steht jetzt auf der Seite;
      Check-Regel 4c gegen Erledigt-Haken in Übungsblöcken
- [x] **v1.24.0 Aufbau 5:** der „harte" Grund für die Lead-Regel ergänzt (Lead-Formulare nehmen keine
      Dateien an — Bewerbung kommt gar nicht an), Google beim Verbot mitgenannt, Ausnahme VI/VB begründet,
      Prüf-Prompt hätte einen zulässigen International-Lead beanstandet, EMPLOYMENT als Plattform-Vorgabe
      präzisiert
- [x] **Alle 16 Modulseiten durchgegangen** (Grundlagen 0–8, Vertiefung 1–2, Aufbau 1–5)
- [x] **v1.25.0 Deck neu strukturiert:** aus zwei zusammengewachsenen Decks sechs benannte Kapitel
      (Kapitelanzeige + Kerben in der Fortschrittsleiste); „Regel Nr. 1/2" stehen zusammen,
      Erwartungs-Einordnung vor der Halluzinations-Warnung, ein Fahrplan statt zwei; vier
      Zeitangaben entfernt, die der Festlegung „keine Zeitangaben" widersprachen; sechs neue
      Folien (KI-Grundprinzip, Harness, Modellwahl, Art. 50, Ablage, VIDACTA-Skills)
- [x] **v1.26.0 Inhalte:** neues Modul **Vertiefung 3 · Modelle & Werkzeuge** (Harness,
      Modellwahl, Anbieter-Einordnung); **Modul 6** um Teil 1 „Wo arbeitet Claude?" erweitert und
      zu „Dateien, Ordner & Claude Code" umbenannt; **Art. 50** jetzt auch im Grundlagen-Track
      (Modul 7); **Modul 5** um „Woher kommen unsere Skills?" ergänzt
- [x] Live: https://vidacta.github.io/claude-schulung/

## Offen / nächste Schritte

**🟡 Vor dem Workshop zu klären (steht im Trainer-Leitfaden als Vorbereitungspunkt):**
- Verfügbare Desktop-Funktionen im eigenen Plan durchklicken und in Vertiefung 2 konkret benennen —
  die Seite relativiert die Verfügbarkeit an vier Stellen, weil das von außen nicht feststellbar ist.
- **Plätze vs. Teilnehmerkreis:** Jede Übung setzt einen eigenen Zugang voraus, die Schulung richtet
  sich laut README an Marketing, Vertrieb, Verwaltung und GF. Der Leitfaden nennt „zu zweit
  arbeiten" als Behelf — ob Zugänge dazukommen, ist eine Planungsentscheidung.
- Klärender Satz im Leitfaden zur **Skills-Verwechslung**: Die Skills im Brain sind Claude-Code-Skills,
  Modul 5 spricht von Desktop-Skills (angeboten, noch nicht beauftragt).

**⚪ Weiterhin offen:**
- Echte Screenshots aus der Team-Umgebung einsetzen (aktuell beschriftete SVG-Schemata — bewusst
  gewählt, funktioniert; echte Screenshots wären „nice to have").
- Interne Ansprechpartner + Richtlinien-Links in Modul 7 eintragen (nur für interne Version —
  auf der Public-Site bewusst keine Personennamen).
- Feedback der ersten Schulung einarbeiten; ggf. Aufbaukurs Claude Code (die Seite verspricht ihn
  seit v1.15.0 nicht mehr, sondern sammelt Interesse).

## Prüfen vor jedem Commit

```bash
powershell -ExecutionPolicy Bypass -File .\konsistenz-check.ps1
```

11 Regelgruppen über alle Seiten, Ziel „0 Befunde". Ergänzend die Typografie im Trockenlauf:
`C:\Dev\.claude\scripts\fix-quotes.ps1 -Path . -Include '*.html'`

## Geklärte Entscheidungen

- **Projekte teilen** (Dominik, 29.07.): innerhalb der eigenen Abteilung erlaubt, darüber hinaus
  vorher abstimmen — Datenschutz gilt unverändert, weil geteilte Projekte die Wissens-Dateien mitteilen
- **Keine Zeitangaben** auf der Site und im Leitfaden (29.07.): kein Tagesablauf, keine
  Modul-/Übungsminuten — das Tempo hängt an der Gruppe
- **Ampelfarben** nur für Erlaubnis, Verbot und Pflicht; Qualitätsvergleiche über ✗/✓
- **Claim-Regeln folgen dem Rechts-Register** (`legal/themen/werbe-claims.md`), nicht einer eigenen,
  strengeren Lesart: „schulgeldfrei" ist im Anzeigen**text** erlaubt, im Bild/Overlay verboten.
  Register-Änderungen ziehen die Schulung nach — dort steht ein Rückverweis, Check-Regel 11 überwacht es
- **Keine feste Marken-Stimme** (Dominik, 29.07.) — eine Stimme *pro Reel*, Auswahl je Thema
- **Interne Zahlen bleiben draußen** (Repo ist public): keine Seat-Zahlen, keine GA4-Property-IDs,
  keine Icon-Dateipfade — dafür der Verweis „beim Team erfragen"
- **Modellnamen: Rollen ja, Versionsnummern nein** (Dominik, 29.07.): Die Familien
  **Opus / Sonnet / Haiku** dürfen genannt werden — mit sichtbarem Stand-Datum und dem Hinweis,
  dass das Auswahlmenü im eigenen Zugang die verlässliche Liste ist. **Konkrete Versionsnummern
  („Sonnet 4.5") bleiben draußen**, weil sie die Seite bei jedem Release still falsch machen;
  Check-Regel 6 überwacht das und hat beim Bau von Vertiefung 3 genau das gefangen
- **Ablageort hängt am Werkzeug** (Dominik, 29.07.): Chat = kein Verzeichnis (Upload) · Cowork =
  eigener Arbeitsbereich · Claude Code = echter Ordner. Dazu die eine übergreifende Regel: das
  fertige Ergebnis gehört in die Team-Ablage, nicht in Downloads und nicht nur in den Chatverlauf
- **VIDACTA-Skills: „wird ausgerollt", nicht „ist da"** (Stand 29.07. abends): Der Verteilweg über
  den Plugin-Marketplace ([ADR-014](../../.claude/brain/decisions/014-skill-verteilung-plugin-marketplace.md))
  **steht** — GitHub App und Marketplace-Verbindung auf `claude-workspace` sind eingerichtet. Offen
  ist die **Freigabestufe je Plugin** (nur `methodik` + `fachwissen` sollen standardmäßig aktiv sein)
  und die App auf `vidacta-knowledge-base`. Deshalb sagt die Site „Schritt für Schritt freigegeben,
  frag das Team, was bei dir aktiv ist" statt „ist da" — dieselbe Vorsicht wie beim gestrichenen
  Aufbaukurs-Versprechen in v1.15.0. **Nachziehen, sobald die Zugriffsstufen gesetzt sind:**
  eine Stelle in `modul-5.html` (Callout „Stand") und eine im Deck (Folie 21)

- Zielgruppe: reine Nicht-Techniker · Sprache: Deutsch · Plan im Haus: Team/Enterprise
- Navigation: Seite pro Modul · Stack: statisches HTML/CSS/JS, kein Build-Step
- Repo public (Org-Plan kann keine privaten Pages) → keine Personennamen/Interna auf der Site
- Fonts: selbst gehostet aus @fontsource (SIL OFL), Subsets latin + latin-ext, Gewichte 400–800
- Modell-Aussagen in Inhalten versionsfest halten (kein Fest-Nageln an Modellnamen)
