# Changelog

Alle nennenswerten Änderungen an diesem Projekt.
Format nach [Keep a Changelog](https://keepachangelog.com/de/1.0.0/), Versionierung nach SemVer.

## [1.28.0] – 2026-07-29

### Added
- **Sprechertext für alle 22 Folien** im Presenter-Modus. Ausformulierter, gesprochener Text
  (zusammen rund 1.900 Wörter, grob 17 Minuten) — bewusst als *frei nachsprechen, nicht vorlesen*
  gekennzeichnet, was auch in der Panel-Kopfzeile steht. Geschrieben nach den Regeln aus
  `vidacta-textqualitaet`: kurze Sätze und Verständlichkeit vor Stil, keine Signifikanz-Inflation,
  keine erfundenen Zahlen oder Namen, keine Zeitangaben.
- Presenter-Layout neu verteilt: **links Vorschau (kompakt) + Sprechertext (groß), rechts nächste
  Folie + Stichpunkt-Hinweise.** Die aktuelle Folie darf klein bleiben — der Trainer sieht sie am
  Beamer; im Presenter-Fenster ist der Text das Wichtigere.
- Sprechertext und Hinweise stehen **im selben Notiz-Block** je Folie (`<p class="script">` plus
  Stichpunkte) und werden beim Anzeigen getrennt. So laufen sie beim Pflegen nicht auseinander.

### Fixed
- **Kleine Fenster: die Hinweise fielen auf 28 px zusammen.** Der Media-Query stammte aus der Zeit
  vor dem Sprechertext und verteilte den Platz noch nach der alten Aufteilung. Jetzt gilt unter
  1080 px Breite *oder* 720 px Höhe: einspaltig, Vorschau klein, **Vorschau der nächsten Folie
  ganz aus** — wer das Fenster halb zieht, braucht Sprechertext und Hinweise lesbar, nicht zwei
  Miniaturbilder.
- Im kompakten Layout spannte sich die Vorschau-Bühne über die volle Spaltenbreite, während die
  klein skalierte Folie nur ein Drittel davon füllte — sie saß in einem breiten toten Rahmen.
  Bühnenbreite wird jetzt aus der Höhe gerechnet (16:10) und zentriert.

## [1.27.0] – 2026-07-29

### Added
- **Presenter-Modus für das Deck** (`praesentation.html?presenter`). Trainer-Ansicht auf dem
  Laptop-Display, während der Beamer nur die Folien zeigt: aktuelle Folie, **nächste Folie**,
  **Notizen zu genau dieser Folie**, Folienzähler, Aufdeck-Stand („2 / 3“), Timer und eine
  Anzeige, ob das Beamer-Fenster wirklich mithört. Steuerung per Pfeiltasten oder Knöpfe;
  das Beamer-Fenster folgt automatisch, und umgekehrt genauso.
- **Trainer-Notizen für alle 22 Folien** — der eigentliche inhaltliche Teil. Je Folie zwei bis
  vier Punkte: was zu sagen ist, worauf zu achten, wo die typische Falle liegt. Mit zwei
  hervorgehobenen Formen: *so kannst du es sagen* (blau) und *Falle* (rot), z. B. „keine
  Uhrzeiten nennen“ auf der Fahrplan-Folie oder „nicht sagen, das ist schon alles da“ bei den
  VIDACTA-Skills. Liegen in einem `<template>`, werden also im Beamer-Fenster nie gerendert.
- **Fragment-Stand ist jetzt Teil der Adresse:** `#13` springt auf Folie 13, `#13.1` zusätzlich
  mit einem aufgedeckten Element. Damit ist der Wiedereinstieg nach einer Pause exakt möglich —
  und die Vorschau im Presenter kann denselben Stand zeigen wie der Beamer.

### Changed
- **Aufgedeckte Elemente bleiben je Folie erhalten.** Bisher setzte das Zurückblättern den
  Aufdeck-Stand nicht zurück, aber es gab auch keinen Zustand, den man wiederherstellen konnte —
  eine besuchte Folie kam mit allem Aufgedeckten zurück, unabhängig davon, wie weit man gekommen
  war. Jetzt merkt sich das Deck den Stand pro Folie: zurück und wieder vor zeigt genau das, was
  vorher zu sehen war, und der Stand ist als Zahl übertragbar — was die Synchronisation der
  Fenster überhaupt erst ermöglicht.
- Die Folien-Engine kennt drei Betriebsarten derselben Datei: ohne Parameter (Beamer/Standalone),
  `?presenter` (Trainer-Ansicht) und `?embed` (nackte Folie für die Vorschau-Rahmen, ohne
  Bedienelemente und ohne Mitreden im Sync).

### Technisches
- Synchronisiert wird über **`BroadcastChannel`** — same-origin, kein Server, läuft also auf
  GitHub Pages. Reichweite ist damit bewusst **ein Browser** (mehrere Fenster/Tabs), nicht mehrere
  Geräte: Für Teilnehmergeräte bräuchte es einen Realtime-Dienst, damit einen API-Key im
  öffentlichen Repo und einen weiteren Auftragsverarbeiter — für ein Komfort-Feature das falsche
  Tauschgeschäft. Beamer und Screenshare lösen das Problem ohnehin.
- Echo-Schutz beim Anwenden fremder Zustände (`applying`-Flag), damit zwei Fenster sich nicht
  gegenseitig aufschaukeln; ein spät geöffnetes Fenster fragt per `hello` den aktuellen Stand ab.
- Vorschau-Rahmen rendern in fester Bühnengröße (1280 × 800) und werden per `transform: scale()`
  eingepasst, damit die Vorschau proportional dem Beamerbild entspricht.

### Fixed
- **Die Vorschau der nächsten Folie war unsichtbar.** Als Flex-Item mit `flex: 1 1 auto` in einem
  Panel, das selbst nur so hoch wie sein Inhalt ist, kollabierte die Bühne auf Höhe 0 — der
  Rahmen war schlicht leer, ohne dass etwas „kaputt“ aussah. Behoben über ein festes
  Seitenverhältnis (16 / 10) plus `flex: 0 0 auto`.

## [1.26.0] – 2026-07-29

### Added
- **Neues Modul „Vertiefung 3 · Modelle & Werkzeuge"** – beantwortet die drei Fragen, die im
  Workshop kommen und auf der Site nirgends standen:
  - **Das Modell ist nur der Kopf.** Das Sprachmodell kann genau eines: aus Text neuen Text
    machen. Keine Hände, kein Dateizugriff, kein Gedächtnis über das Gespräch hinaus. Alles
    andere – Datei öffnen, Web durchsuchen, sich etwas notieren, Schritte planen – kommt vom
    **Programm drumherum**, dem *Harness*. Damit ist erklärt, was vorher wie Magie wirkte:
    Desktop, Cowork und Claude Code sind **dasselbe Modell in unterschiedlichen Gestellen**.
    Claude wird in Cowork nicht klüger, er bekommt mehr in die Hand – und es bringt deshalb
    nichts, im Chat „mehr Mühe" zu verlangen, wenn eigentlich ein Werkzeug fehlt.
    Daran hängt die Verantwortungs-Eskalation: ein Modell, das nur redet, kann sich *irren*;
    eines, das *handelt*, kann etwas *anstellen*. Das ist der Grund, warum Prompt Injection
    erst ab Cowork ein echtes Thema ist.
  - **Welches Claude-Modell wofür.** Opus (knifflig, viel Material, lange Aufträge) · Sonnet
    (der Bürostandard) · Haiku (kurz und schnell), mit der Faustregel „Voreinstellung stehen
    lassen, wechseln nur wenn dich etwas *stört*" und dem wichtigeren Satz: ein klarer Prompt
    an das kleinste Modell schlägt einen vagen Prompt an das größte.
  - **Und die anderen Anbieter?** ChatGPT, Gemini, Copilot eingeordnet – alle nach demselben
    Grundprinzip. **Bewusst ohne Rangliste**, weil die in Monaten falsch wäre. Die Regel, auf
    die es ankommt: bei VIDACTA arbeiten wir mit Claude, ein anderes Werkzeug ist nicht
    automatisch erlaubt – nicht wegen der Qualität, sondern weil für jedes Werkzeug geklärt sein
    muss, wer die Daten bekommt. Mit dem konstruktiven Ausweg: gute Werkzeug-Idee einbringen
    statt still nutzen.
- Zwei Ausklapper zu Fragen, die sonst offen bleiben: warum Modellnamen ständig wechseln (merk
  dir die drei Rollen, nicht die Nummern – die verlässliche Liste ist das Auswahlmenü im eigenen
  Zugang) und was „länger nachdenken" bringt (beim Denken viel, beim Wissen wenig).
- Übung zur Modellwahl an eigenen Aufgaben plus Spickzettel mit sechs Fragen und Kurzantworten.
- Vertiefungs-Track auf der Startseite von zwei auf **drei Module** erweitert (Karte,
  Fortschrittsanzeige, Beschreibung); `app.js` kennt das Modul als `id: 12`; Vertiefung 2 führt
  jetzt dorthin weiter statt zurück zur Übersicht; Vertiefung 1 verweist an der Stelle, wo sie
  „das stärkste verfügbare Modell" empfiehlt, auf die konkrete Antwort in Vertiefung 3.
- **Modul 6 hat jetzt einen ersten Teil, der alle betrifft: „Wo arbeitet Claude eigentlich?"**
  Die Frage „wo ist meine Datei jetzt?" war site-weit nirgends beantwortet – nur beiläufig in
  einem Beispiel-Prompt („in diesem Ordner"). Die Antwort hängt am Werkzeug, und genau das ist
  die Verwirrung: **Chat = kein Verzeichnis** (Upload, auf dem Rechner ändert sich nichts) ·
  **Cowork = eigener Arbeitsbereich** (herunterladen, nicht liegen lassen) · **Claude Code =
  echter Ordner** (hier wird wirklich verändert). Dazu die Regel, die überall gilt: das fertige
  Ergebnis gehört in die Team-Ablage, weil ein Chatverlauf *deiner* ist – die Kollegin nächste
  Woche kann darin nicht suchen, und im Urlaub ist das Ergebnis praktisch weg.
  Modul 6 heißt deshalb jetzt **„Dateien, Ordner & Claude Code"**; Claude Code bleibt als
  zweiter Teil ausdrücklich Ausblick. Titel in `index.html`, `app.js` und den Nachbar-Modulen
  nachgezogen.
- **Art.-50-Abschnitt in Modul 7.** KI-Kennzeichnung stand bisher **nur im Aufbau-Track** – wer
  kein Marketing macht, erfuhr davon nichts, obwohl die Pflicht ab dem 2. August 2026 greift.
  Der neue Abschnitt trennt sauber: ein selbst überarbeiteter Text ist kein Thema, **jedes
  KI-Bild und -Video nach außen** trägt das eingebrannte Icon. Ausdrücklich als interne
  Vorsichtsmaßnahme gekennzeichnet, nicht als Rechtsauslegung, mit dem Hinweis „im Zweifel
  Marketing fragen, nicht selbst entscheiden". Dazu die inhaltliche Begründung: Wir werben um
  Menschen, die eine Lebensentscheidung treffen – wer erst nach dem Erstkontakt merkt, dass die
  Person im Video nie existiert hat, verliert Vertrauen in uns, nicht nur in die Anzeige.
- **Modul 5: „Woher kommen unsere Skills?"** Modul 5 erklärte, *was* ein Skill ist, aber nicht,
  dass es **VIDACTA-eigene** gibt. Neu: die Unterscheidung mitgeliefert (allgemeine Fähigkeiten)
  ↔ von VIDACTA gebaut (unser Ton, unser Fachwissen, unsere Anzeigenregeln), der Hinweis, dass
  sie zentral an die Team-Zugänge verteilt werden, und woran man sie merkt (Claude berücksichtigt
  unsere Regeln von sich aus). **Bewusst als „Stand: im Aufbau" gekennzeichnet** – die Verteilung
  ist noch nicht ausgerollt, und die Seite verspricht nichts, was noch nicht ankommt. Dazu zwei
  Einschränkungen, die sonst missverstanden werden: ein Skill macht das Ergebnis verlässlicher,
  nicht fehlerfrei – und er ändert nichts an der Ampel.

### Fixed
- **Modul 6: Erklärtext nannte eine andere Dateiendung als der Prompt.** Der kopierbare Auftrag
  erzeugt `uebersicht.docx`, der Erklär-Ausklapper darunter sprach von `uebersicht.md`. Wer dem
  Text folgt, sucht die falsche Datei.

## [1.25.0] – 2026-07-29

### Changed
- **Das Deck war zwei Decks in einem.** Die Folien-Kommentare verrieten die Entstehung:
  `1 · 2 · 3 · 4 · 5 · NEU · NEU · NEU · 6 · 7 · 8 · 9 · NEU · 10 · 11`. Die vier
  v1.7.0-Ergänzungen waren eingeschoben, nicht eingeordnet – daraus folgten drei Brüche, die
  den Eindruck „planlos" erzeugten: **„Regel Nr. 1" und „Regel Nr. 2" standen nicht zusammen**
  (dazwischen Live-Prompt und Anwendungsfälle – eine Nummerierung, die man aufreißt, wirkt
  zufällig); **„Was Claude ist – und was nicht" kam nach dem Halluzinations-Merksatz**, also
  Warnung vor Einordnung; und es gab **zwei Fahrplan-Folien** (Anfang und Ende) mit
  überlappendem Inhalt. Das Deck hat jetzt **sechs benannte Kapitel** mit zwei
  Trennfolien, die Erwartungs-Einordnung steht vor der Warnung, und die beiden Fahrplan-Folien
  sind zu einer verschmolzen. Kapitelname und Kapitelgrenzen sind sichtbar (Anzeige in der
  Fußzeile, Kerben in der Fortschrittsleiste).
- **Vier Zeitangaben widersprachen einer getroffenen Entscheidung.** „Keine Zeitangaben"
  (Festlegung 29.07.) war in v1.9.0 site-weit an 34 Stellen umgesetzt – im Deck aber nicht:
  „Heute Abend kannst du …", „Vormittag … Nachmittag …", „Live-Moment 3 · **2 Minuten**",
  „Heute **Nachmittag**: delegieren". Alle vier entfernt.
- **Der Fahrplan war unvollständig:** „Neun Module" und neun Chips, obwohl die Schulung
  **16 Seiten** in drei Tracks hat. Vertiefung und Aufbau tauchten erst auf der vorletzten
  Folie im Nebensatz auf. Jetzt zeigt die Folie alle drei Tracks.

### Added
- **Neues Kapitel „Wie das Ding funktioniert"** – drei Folien, die drei Fragen beantworten,
  die auf der ganzen Site fehlten:
  - **Was ist KI?** Claude sagt das nächste Wort-Häppchen voraus, gelernt aus sehr viel Text –
    kein Nachschlagewerk, keine Datenbank, keine Suchmaschine. Damit ist Regel Nr. 2 nicht mehr
    nur eine Warnung, sondern eine **Folge**: wer aus dem Gedächtnis erzählt, klingt auch dann
    flüssig, wenn ein Detail daneben ist.
  - **Modell ≠ Programm (Harness).** Das Modell kann nur Text erzeugen – keine Hände, kein
    Dateizugriff, kein Gedächtnis über den Chat hinaus. Werkzeuge, Notizen und Schrittplanung
    kommen vom Programm drumherum. Deshalb sind Desktop, Cowork und Claude Code **dasselbe
    Modell in unterschiedlichen Gestellen**; Claude wird nicht klüger, er bekommt mehr in die
    Hand. Daran hängt die Verantwortungs-Eskalation: ein Modell, das nur redet, kann sich
    irren – eines, das *handelt*, kann etwas anstellen.
  - **Welches Modell wofür.** Opus (wenn's schwierig wird) · Sonnet (der Alltag) · Haiku
    (wenn's flott gehen soll), mit der Faustregel „die Voreinstellung passt fast immer, wechsle
    erst, wenn dich etwas *stört*". Bewusst **mit Stand-Datum** versehen (Juli 2026) und mit dem
    Hinweis, dass im eigenen Zugang das Auswahlmenü gilt – damit die Seite bei einem
    Modellwechsel nicht still falsch wird. Das war auf der **gesamten Site** bisher nirgends
    erklärt (0 Treffer für Opus/Sonnet/Haiku).
- **Art.-50-Folie im Grundlagen-Track.** KI-Kennzeichnung stand bisher **nur im Aufbau-Track** –
  wer kein Marketing macht, hörte davon nichts. Die Folie trennt, was die meisten brauchen:
  ein selbst überarbeiteter Text ist unkritisch, **jedes KI-Bild und -Video** trägt das
  eingebrannte Icon. Ausdrücklich als interne Hausregel und Vorsichtsmaßnahme gekennzeichnet,
  nicht als Rechtsauslegung.
- **Folie „Wo liegen eigentlich meine Dateien?"** – die Antwort hängt am Werkzeug, und genau das
  verwirrt: Chat = kein Verzeichnis, du lädst hoch · Cowork = eigener Arbeitsbereich · Claude
  Code = ein echter Ordner auf dem Rechner. Dazu die eine Regel, die überall gilt: das fertige
  Ergebnis gehört dorthin, wo das Team es findet – nicht in den Download-Ordner.
- **Folie zu den VIDACTA-Skills.** Erklärt, was ein Skill ist (eine Arbeitsanleitung, die Claude
  schon kennt) und dass eigene VIDACTA-Skills zentral an die Team-Zugänge verteilt werden.
  **Bewusst im Aufbau-Zustand formuliert** – die Verteilung ist noch nicht ausgerollt, und die
  Seite verspricht nichts, was noch nicht ankommt (dieselbe Vorsicht wie beim gestrichenen
  Aufbaukurs-Versprechen in v1.15.0). Ohne interne Namen, weil das Repo public ist.

### Fixed
- **Zwei Labelgrößen fielen auf dem Handy unter die Lesbarkeitsgrenze.** Gemessen bei
  320/375/414 px: `.versus .box .tag` auf **10,5 px** (Altbefund, seit v1.6.0 im Deck) und das
  neue `.trio .box h4 .when` auf **9,6 px**. Ursache in beiden Fällen: die Labelgröße hing als
  `em`-Anteil an der Box, und bei kleinen Viewports fällt die Box auf ihr `clamp`-Minimum – die
  Labels schrumpfen also mit. Beide haben jetzt einen eigenen `clamp` mit harter Untergrenze
  (12 px). Dieselbe Fehlerklasse wie die auf 6,9 px heruntergerechnete SVG-Schrift in v1.7.0.
- Statischer Folien-Zähler im HTML stand auf „1 / 11" (wird vom JS überschrieben, war also nur
  vor dem Skriptlauf sichtbar) – jetzt korrekt „1 / 22".

## [1.24.0] – 2026-07-29

### Added
- **Aufbau 5, Regel 1: der überzeugendere Grund stand nicht drin.** Das Register nennt zwei Gründe für
  die Lead-Regel und markiert ausdrücklich einen als „den harten": **Lead-Formulare können keine Dateien
  annehmen** – zu einer Bewerbung gehören aber Zeugnisse und Nachweise, sie kann dort also gar nicht
  vollständig ankommen. Die Schulung nannte nur den zweiten Grund („DSGVO-konforme Erfassung"). Damit
  fehlte das Argument, das sofort einleuchtet und nicht abgewogen wird: „DSGVO" klingt nach Bürokratie,
  „die Bewerbung kommt nicht an" ist unwiderlegbar. Beide Gründe stehen jetzt da, in dieser Reihenfolge –
  die Überschrift heißt entsprechend nicht mehr „(DSGVO)".
- **Die Ausnahme ist jetzt begründet.** Warum VI- und Arbeitgeber-Leads über Lead-Formulare laufen dürfen,
  stand nirgends: Dort fallen **keine Bewerbungsunterlagen** an, es geht um eine erste Kontaktanfrage.
  Ohne diesen Satz wirkte die Ausnahme willkürlich.

### Fixed
- **Google fehlte beim Verbot.** Das Register sagt „niemals über Meta- **oder Google**-Instant-/
  Lead-Formulare" – die Schulung nannte an allen drei Stellen nur Meta. Ausgerechnet die Lücke, die
  niemand auf dem Schirm hat. Jetzt in Regel 1, im Prüf-Prompt und in der Fehler-Tabelle ergänzt.
- **Der Prüf-Prompt hätte wieder Erlaubtes als Verstoß gemeldet** – derselbe Fehlertyp wie bei
  „schulgeldfrei" in v1.23.0, nur eine Zeile weiter: Punkt 3 fragte pauschal, ob Bewerbungen über die
  Website laufen, und hätte damit einen zulässigen International-Lead über ein Lead-Formular
  beanstandet. Jetzt mit der Ausnahme und der Rückfrage, welcher Fall vorliegt.
- **EMPLOYMENT-Begründung präzisiert.** „gesetzlich/plattformseitig vorgeschrieben" → **Vorgabe der
  Plattform** zur Diskriminierungsvermeidung. Ein Gesetz, das dem Werbetreibenden das Alter
  vorschreibt, gibt es nicht; Meta erzwingt die Regel. Dazu der Satz, dass der Gedanke ohnehin passt –
  eine Ausbildung steht nicht nur 20- bis 35-Jährigen offen.

## [1.23.0] – 2026-07-29

### Fixed
- **Die Prüf-Prompts kannten die neuen Verbote nicht** – Folgefehler von v1.21.0: Dort wurde die
  Verbotsliste erweitert, aber die zwei Prompts, mit denen man Skripte und Anzeigen-Ideen
  gegenchecken lässt, blieben auf dem alten Stand. Ein Skript mit „mit Bildungsgutschein förderfähig"
  hätte die Prüfung glatt passiert. Beide Prompts fragen jetzt einzeln nach Geld, **Förder-Zusagen**
  und **Wirkversprechen** und verlangen wörtliche Fundstellen.
- **Der Anzeigen-Prüf-Prompt hätte Erlaubtes als Verstoß gemeldet.** Er listete „schulgeldfrei" unter
  den verbotenen Geld-Aussagen – im Anzeigentext ist die Angabe aber freigegeben. Jetzt als eigener
  Prüfpunkt formuliert: *im Anzeigentext erlaubt, im Bild oder Video-Overlay verboten – sag mir, wo es
  steht.* Damit prüft der Prompt genau die Unterscheidung, die zählt.
- **Aufbau 4: Erledigt-Haken aus der Übung entfernt** („Notiere: … ✅"). **Check-Regel 4c ergänzt:**
  In Übungsblöcken hat ein ✅ generell nichts zu suchen, weil dort steht, was noch zu *tun* ist.
  Regel 4b griff nur bei „Frage? ✅" und hat diesen Fall übersehen. Die Regel prüft gezielt
  `.exercise`-Blöcke — der Selbst-Check in Modul 8 bleibt damit korrekt unbehelligt, weil seine Haken
  vor Aussagen zum Bejahen stehen und außerhalb einer Übung.

### Added
- **Aufbau 4: die GEMA-Falle wird jetzt erklärt, nicht nur benannt.** Bisher stand dort „keine Musik
  aus Instagram/TikTok (GEMA-Falle)" ohne Grund. Der Denkfehler ist aber naheliegend – *„die Musik ist
  doch in der App eingebaut"* – und genau der löst sich erst mit der Erklärung: Die
  Plattform-Bibliotheken sind für **organische Beiträge** lizenziert, nicht für **bezahlte Anzeigen**.
  Technisch geht es, rechtlich nicht. Ein Verbot ohne Begründung wird beim ersten Zeitdruck umgangen.
- **Aufbau 4: Antwort auf die Frage nach der Marken-Stimme.** „Eine Stimme pro Reel" sichert
  Konsistenz *innerhalb* eines Videos – ob es darüber hinaus eine festgelegte Stimme gibt, blieb offen.
  Es gibt keine (Auskunft Dominik, 29.07.); das steht jetzt ausdrücklich da, mit dem praktischen Tipp,
  gut funktionierende Stimmen zu notieren.

## [1.22.0] – 2026-07-29

### Fixed
- **🔴 Die Icon-Position widersprach dem dokumentierten Stand.** `legal/themen/ai-act.md` legt fest:
  **oben rechts**, innerhalb der Safe Zone. Die Schulung plante es im Briefing-Beispiel **unten** ein
  („Unten Platz für Logo und KI-Icon lassen") – wer das Briefing verwendet, hätte die Kennzeichnung an
  der falschen Stelle vorgesehen. An allen vier Stellen korrigiert (Prompt, Format-Liste, Briefing-
  Beispiel, Übung): KI-Icon oben rechts, Logo unten, mit Begründung – so bleibt die Kennzeichnung
  sichtbar, auch wenn die Plattform unten etwas überlagert.
- **Der Safe-Zone-Begriff war im kopierbaren Prompt umgekehrt.** Der erklärende Text war richtig, der
  Prompt sagte „Safe Zones oben/unten frei lassen" – die Safe Zone ist aber der *sichere* Bereich, in
  den der Inhalt gehört; frei bleiben die Ränder mit Plattform-UI. Wer nur den Prompt kopierte, gab der
  KI eine widersprüchliche Anweisung. Jetzt beides konsistent, mit dem Denkfehler ausdrücklich benannt.
- **„(Ampel!)" war beim Personen-Hinweis der falsche Verweis.** Die Ampel regelt, was man *eingibt* –
  bei der Frage, wer im fertigen Bild *zu sehen* ist, geht es um Persönlichkeitsrecht. Jetzt als eigene
  Frage erklärt, samt dem Punkt, warum KI-Menschen nicht nach echten Vorlagen entstehen sollen.

### Added
- **Die lizenzierte Bildbibliothek als erste Option.** Die Seite legte nahe, dass KI-Erzeugung der Weg
  ist – dabei liegen mehrere hundert lizenzierte Adobe-Stock-Motive bereit, die **kein KI-Icon
  brauchen**, weil sie nicht KI-generiert sind. Neuer Kasten mit der Entscheidungshilfe: Stock ist der
  rechtlich einfachere Weg, KI der flexiblere (Szenen, die es nicht gibt · viele Varianten in einem Stil
  · exakt auf die Marke zugeschnitten).
- **Die zwei Sprachfassungen des KI-Icons.** Das Register führt eine deutsche und eine englische Fassung
  für internationale Kampagnen – bei VIDACTA International kein Randfall. Die Schulung kannte nur „die
  Icons". Dateipfade bleiben draußen (public Repo), die Unterscheidung steht drin. Dazu die Klarstellung,
  was „eingebrannt" heißt: fest im Bild, nicht nur ein Häkchen im Anzeigenmanager.

### Changed
- **Compliance-Kurzcheck hakt sich nicht mehr selbst ab.** Acht Prüfpunkte trugen je ein ✅ – dieselbe
  Logik wie die Fälle in Modul 4 und Aufbau 1. Jetzt leere Kästchen und je ein Punkt pro Zeile statt
  einer Fließtext-Kette; zwei Punkte sind dabei präziser geworden (Icon-Sprachfassung und Position,
  Förder-Zusagen).

## [1.21.0] – 2026-07-29

### Fixed
- **🔴 Die Schulung verbot etwas, das freigegeben ist.** Abgleich mit `legal/themen/werbe-claims.md`
  (Stand 27.07.): Dort ist **„schulgeldfrei" im Anzeigen-TEXT erlaubt** (Primary Text, Headline, RSA)
  und nur **im Bild/Overlay verboten** — Festlegung Dominik vom 14.07.2026. Diese Unterscheidung fehlte
  auf der ganzen Site (null Treffer). Aufbau 5 trug sogar die Überschrift „gilt für Bild, Video **&
  Text**" und führte in der Fehler-Tabelle *„‚Schulgeldfrei!' im Anzeigentext"* als typischen Fehler auf
  — die Schulung lehrte damit aktiv, dass etwas falsch sei, was ausdrücklich freigegeben ist, und nahm
  dem Marketing ein starkes Argument. Jetzt differenziert in Aufbau 5 (eigener Sonderfall-Kasten),
  Aufbau 2 (Kurzfassung mit Verweis) und Aufbau 4 (Klarstellung, warum im Voiceover trotzdem die
  strengere Regel gilt: gesprochenes Wort gehört zum Creative). **Aufbau 3 war bereits korrekt**
  („Auf Bild/Video dürfen keine Aussagen zu Geld stehen") und blieb unverändert.

### Added
- **Aufbau 5, Regel 2 vollständig aufgebaut.** Drei Verbote aus dem Register fehlten komplett:
  - **Förder-Zusagen** („mit Bildungsgutschein förderfähig") — im Register der einzige rot markierte
    Claim, weil **Trägerzulassung ≠ Maßnahmenzulassung**. Seit der AZAV-Zulassung vom 07.07. der
    naheliegendste Claim überhaupt; „AZAV" kam auf der Site vorher nicht ein einziges Mal vor.
  - **Vergütungs-Zusagen** waren nur als „Vergütung" in einer Aufzählung genannt, jetzt mit Begründung.
  - **Gesundheitliche Wirkversprechen** („wir bilden aus, wir behandeln nicht").
- **Die Positivliste — das eigentlich Fehlende.** Die Seite sagte nur, was verboten ist. Jetzt als
  grüner Block: *staatlich anerkannter Abschluss · Standorte · Lernplattform und 3D-Anatomie ·
  Praxispartner · Capital-Auszeichnung* — plus dem Satz, dass diese Liste genauso wichtig ist wie die
  Verbote. Dasselbe Muster wie bei der Ampel-Begründung heute: Ein Verbot ohne die positive Seite
  macht mutlos oder wird umgangen.
- **Konsistenz-Check: Regel 11 für Claim-Vollständigkeit** (jetzt 11 Regelgruppen). Prüft, dass Aufbau 5
  die Text/Bild-Trennung, die drei Verbote und die Positivliste enthält — mit Positiv- und Negativprobe
  getestet. Dazu ein Rückverweis im Register: wer die Claim-Regeln ändert, muss die Schulung mitziehen.

## [1.20.0] – 2026-07-29

### Fixed
- **Aufbau 1: zwei Ampel-Checks nahmen ihre Antwort vorweg** – dasselbe Muster („Alles grün? ✅"), das
  in v1.13.0 aus Modul 4 entfernt wurde. Jetzt echte Fragen: welche Farbe hatte die Seite und woran
  hast du das erkannt · waren beide Seiten wirklich öffentlich zugänglich. **Konsistenz-Check
  nachgeschärft:** Regel 4 hatte nur den exakten Modul-4-Satz hinterlegt, deshalb wanderte das Muster
  unbemerkt weiter. Neue Regel 4b prüft das **Muster** (Fragezeichen direkt vor einem Haken) und ist mit
  Positiv- und Negativprobe getestet. Regel 9 meldet fehlende Dateien jetzt sauber statt zu abbrechen.

### Added
- **Aufbau 1: der Handgriff, ohne den die Tabu-Regel nicht einhaltbar ist.** Die Seite sagt richtig, dass
  die Erweiterung sieht, was im Tab steht – auch hinter einem Login – und erklärt Postfach und
  Personalunterlagen zum Tabu. Nur *wie* man das verhindert, stand nirgends: Wer zwischen Tabs wechselt
  (Fachartikel → kurz ins Postfach → zurück), denkt im entscheidenden Moment nicht daran. Jetzt als
  Gewohnheit formuliert: Erweiterung nur öffnen, wenn du sie brauchst – und schließen, *bevor* du in
  Postfach, internes Portal oder Personalakte wechselst. Das konkrete Wie zeigt die IT bei der
  Einrichtung; bewusst ohne Beschreibung einer Oberfläche, die abweichen kann.
- **Aufbau 1: Prompt Injection ist eingeordnet statt neu eingeführt.** Es war das dritte Beispiel auf der
  Site (nach Modul 4 und 7) – ohne jeden Querverweis, obwohl der Modulkopf „Grundlagen vorausgesetzt"
  sagt. Jetzt mit Bezug auf beide Module und der Begründung, warum es im Browser besonders zählt:
  fremde Seiten sind dort der Normalfall.

## [1.19.0] – 2026-07-29

### Added
- **Vertiefung 2: Teilen per Link ist als eigene Kategorie kenntlich gemacht.** Bisher stand als Regel
  nur „vorher prüfen und anonymisieren (Ampel!)" – das ist die Regel für *Eingaben*. Ein geteilter
  Artefakt-Link geht aber nach **außen**: Wer ihn hat, sieht den Inhalt, und ein Link lässt sich
  weitergeben, ohne dass man davon erfährt. Damit ist es etwas anderes als das Projekt-Teilen, das seit
  v1.12.1 innerhalb der Abteilung erlaubt ist – dort weiß man, wer Zugriff hat. Neuer roter Kasten mit
  der Konsequenz: vor dem Teilen nach außen den Inhalt **komplett** durchlesen, und zwar nicht nur auf
  Personendaten, sondern auch auf interne Zahlen, Preise und unabgestimmte Formulierungen. Der
  Selbst-Test-Fall dazu wurde mitgezogen.
- **Vertiefung 2: geplante Aufgaben mit Prompt Injection verknüpft.** Das Modul warnte „automatisch
  heißt nicht ungeprüft", ließ aber die eigentliche Zuspitzung aus: Sucht eine geplante Aufgabe im Web
  oder liest sie Dateien, verarbeitet sie fremde Inhalte **ohne dass jemand zusieht** – genau das
  Risiko aus Modul 4, nur ohne Nutzer davor. Mit Konsequenzen: eng zuschneiden, keine Aktionen nach
  außen automatisieren, Ergebnisse regelmäßig durchsehen.
- **Trainer-Leitfaden: zwei Vorbereitungspunkte.** Verfügbare Funktionen im eigenen Plan vorab
  durchklicken (Vertiefung 2 relativiert die Verfügbarkeit an vier Stellen, weil sie von außen nicht
  feststellbar ist – im Workshop lässt sich das durch eine klare Ansage ersetzen). Dazu: Plätze zählen
  und bei knappen Zugängen zu zweit arbeiten lassen, was für alle Übungen funktioniert.

## [1.18.0] – 2026-07-29

### Changed
- **Vertiefung 1: Studienangaben weicher gefasst.** Die Seite lehrt ausdrücklich, „Quellenangaben,
  Links, DOIs und Studien immer zu prüfen" – und berichtet im roten Kasten, dass bei der Recherche für
  dieses Modul eine KI eine Studie samt DOI erfunden hat. Gleichzeitig nannte sie selbst zwei
  konkrete, aber unbelegte Angaben: „rund 20 Prozentpunkte" Trefferquoten-Verlust und „Chroma
  Research, an 18 KI-Modellen". Beides ist jetzt ohne Zahl und ohne Institutsnamen formuliert – der
  Effekt und sein Fachname („Lost in the Middle") bleiben, ebenso die Faustregel. Dazu ein Satz, der
  die Auslassung begründet: eine einzelne Prozentzahl würde je nach Modell und Aufgabe ohnehin anders
  ausfallen. Auch „1 Million Tokens" ist raus – eine Zahl, die veraltet.
- **Vertiefung 1: „Dauerwissen ins Projekt" ist kein Freibrief mehr.** Die Seite erklärt das
  Kontextfenster, riet aber dreimal „ins Projekt damit", ohne zu erwähnen, dass Projektanweisungen und
  Wissens-Dateien bei *jeder* Anfrage mit auf dem Schreibtisch liegen. Damit klang das Projekt wie ein
  unbegrenzter Speicher – im Widerspruch zu Modul 3, das seit v1.12.0 „ein Projekt = ein Zweck" sagt.

### Added
- **Vertiefung 1: neuer Abschnitt „Das längere ‚Nachdenken' – wann es wirklich hilft".** Bislang war
  es nur ein Halbsatz. Jetzt mit dem Satz, den man dafür schreibt, und einer Gegenüberstellung, wofür
  es sich lohnt (mehrstufige Aufgaben, Rechnen und Logik, langen Text gegen Vorgaben prüfen,
  Widersprüche finden) und wofür nicht (Faktenfragen, Umformulieren, Tagesaktuelles). Kern ist der
  Merksatz: **Nachdenken hilft beim Denken, nicht beim Wissen** – eine erfundene Zahl bleibt erfunden,
  sie klingt danach nur besser begründet. Genau deshalb ersetzt es das Gegenprüfen nicht.

## [1.17.0] – 2026-07-29

### Fixed
- **🔴 Sechs von 23 Copy-Buttons lieferten nur ein Bruchstück.** Beim Prüfen der Typografie
  aufgefallen: Ein **gerades** `"` im `data-copy`-Attribut beendet den Attributwert vorzeitig. Der
  Prompt in Modul 2 brach zum Beispiel bei „Kommunikation mit Patienten" ab — der Rest landete als
  ungültiges Markup im Tag. Im Browser fällt das nicht auf, weil die Seite trotzdem rendert und der
  Button vorhanden ist; nur der *kopierte* Text war unvollständig. Betroffen: Modul 2 (von heute,
  v1.9.0), Vertiefung 1 (2×), Aufbau 3, 4 und 5. Alle Attribute aus dem sichtbaren Text
  regeneriert — geprüft, dass Attribut und Text bei allen 23 Prompts jetzt zeichengleich sind.
- **Einfache Anführungszeichen und Apostrophe vervollständigt (7 Stellen).** Nach den doppelten
  waren auch diese halbfertig: 3 öffnende `‚` standen da, aber **null** schließende `‘` — dafür 7
  gerade `'`. Davon waren drei Schließer (`‚Sie’` → `‚Sie‘`) und vier echte Auslassungs-Apostrophe
  („So machen wir’s", „geht’s"), die U+2019 brauchen. Beide Fälle lassen sich sicher unterscheiden:
  nach offenem `‚` ist es ein Schließer, zwischen zwei Buchstaben ein Apostroph.

### Added
- **Modul 8: Challenge-Variante D für Lehrkräfte** (Doppelstunde planen, Handout in einfacher
  Sprache, fachliche Prüfung inkl. „keine erfundenen Normen"). A–C decken Marketing, Verwaltung und
  Bewerbermanagement ab — der Schulbetrieb fehlte, und das wiegt in der Abschlussaufgabe schwerer
  als in den Modulen davor.
- **Konsistenz-Check um zwei Regelgruppen erweitert** (jetzt 10): einfache Anführungszeichen und
  Apostrophe (die erste Fassung prüfte nur die doppelten und übersah 7 Stellen) sowie
  **data-copy-Integrität** — genau der Fehler, den ein Browser-Test nicht sichtbar macht.

### Changed
- **Modul 8: kein Zertifikat-Versprechen mehr.** „Ein Abschluss-Vermerk / Zertifikat kann über das
  Schulungs-Team ausgestellt werden" → „Wenn du einen Vermerk für deine Unterlagen brauchst, sprich
  dein Schulungs-Team an." Der Trainer-Leitfaden führt das als *optional*.

## [1.16.0] – 2026-07-29

### Fixed
- **Ampel-Definition in Modul 7 und im Deck an Modul 1 angeglichen.** Drei Befunde waren
  Folgefehler der eigenen Änderungen von heute: v1.11.0 hatte „interne Dokumente ohne Personenbezug"
  in Modul 1 von Gelb nach **Grün** verschoben — Modul 7 und die Deck-Folie führten sie weiter unter
  Gelb. Damit war dasselbe Material auf drei Seiten unterschiedlich einsortiert, und zwar genau in
  den Modulen, die die Ampel definieren. Beide nachgezogen, dazu der Hinweis auf **indirekte**
  Erkennbarkeit (Herkunft + Ereignis), der bislang nur in Modul 1 stand.
- **Realistische Personendatensätze aus Modul 7 und dem Deck entfernt.** „Frau Santos, geb.
  12.03.1991, … wohnhaft in Essen" → „Maria Musterfrau" (wie in Modul 1 seit v1.10.0), und die
  Quiz-Fälle „Frau Müller, geb. 1988, Diagnose …" beschreiben den Fall jetzt statt einen Datensatz
  vorzuführen („eine E-Mail, in der Name, Geburtsdatum und eine Diagnose stehen") — für ein Quiz
  genauso anschaulich. **Behalten** wurden die Herkunftsangaben in Modul 7 („die Bewerberin aus
  Kolumbien"): dort ist die Herkunft nicht schmückendes Detail, sondern der Lerngegenstand — die
  Beispiele zeigen ja gerade, dass Herkunft + Ereignis eine Person identifizierbar machen.
- **Fünfte Gender-Variante geglättet:** „Datenschutzbeauftragte**:r**" in der Checkliste. Die
  Suche in v1.10.0 hatte nur die `:n`-Form erfasst.

### Changed
- **Modul 7 begründet die Ampel jetzt selbst.** Das Pflichtmodul wiederholte die Regel, ohne den
  Grund zu nennen — der Ausklapper dazu stand nur in Modul 1. Neuer Kurz-Kasten mit dem
  entscheidenden Punkt: Es geht **nicht** ums Training, sondern darum, dass jeder Upload Daten aus
  dem Haus gibt. Mit Anker-Verweis auf die Langfassung.
- **Prompt Injection klingt in Modul 7 und Modul 4 nicht mehr unterschiedlich.** Modul 7 sagte
  „Claude ist darauf trainiert, das zu unterscheiden", Modul 4 (v1.13.0) „die Grenze ist nicht
  trennscharf". Modul 7 ist der Anker, auf den Modul 4 verweist — jetzt gleiche Tonalität, plus
  Rückverweis auf den Agenten-Modus.

## [1.15.0] – 2026-07-29

### Fixed
- **Deutsche Anführungszeichen site-weit vervollständigt: 272 Schließer korrigiert.** Geöffnet wurde
  überall typografisch korrekt mit `„`, geschlossen aber mit dem geraden Zoll-Zeichen `"` statt mit
  `“` — im Fließtext sichtbar schief, weil das öffnende Zeichen gebogen und das schließende senkrecht
  ist. Aufschlussreich war, *wo* es schon stimmte: in den `data-copy`-Attributen der Prompt-Blöcke.
  Dort **musste** der Autor typografische Zeichen nehmen, weil ein gerades `"` das Attribut beendet
  hätte; im Fließtext fehlte dieser Zwang. Beim Geviertstrich-Durchgang am 27.07. war das übersehen
  worden, obwohl der Textqualitäts-Skill die Regel führt.
  Korrigiert per Zustandsautomat, der HTML-Tags sowie `<script>`- und `<style>`-Blöcke ausspart und
  nur ersetzt, wenn davor ein `„` offen ist. Ergebnis: 274 Öffner und 274 Schließer über alle 19
  Seiten, **0 gerade Zeichen** im sichtbaren Text, HTML-Attribute unangetastet (4661 gerade Zeichen
  in Tags unverändert), 0 Fälle ohne zugehörigen Öffner.

### Changed
- **Modul 6: kein Versprechen mehr auf einen Kurs, den es noch nicht gibt.** Statt „für Interessierte
  gibt es einen eigenen, tieferen Aufbaukurs" jetzt „kommen genug Interessierte zusammen, richten wir
  einen ein" — `state/current_state.md` führt ihn ausdrücklich nur als Absicht („ggf.").
- **Modul 6: Beispiel-Datei ist kein Markdown mehr.** `uebersicht.md` ließ sich für die
  ausdrücklich nicht-technische Zielgruppe nicht einmal sinnvoll öffnen; jetzt eine Word-Datei.
- **Modul 6 verweist auf Modul 4.** Die „drei Details" (klarer Ort · neue statt veränderte Datei ·
  Schutzsatz) sind dasselbe Prinzip wie „Wo landet das Ergebnis?" aus v1.13.0 — hier nur konkreter.
  Der Querverweis verbindet beide Stellen statt sie unabhängig nebeneinander zu stellen.

## [1.14.0] – 2026-07-29

### Changed
- **Modul 5 gibt keine Unbedenklichkeits-Erklärung mehr ab.** Der Schluss-Tipp nannte einen Connector
  zu einem Vorlagen-Ordner „datenschutzrechtlich unkritisch" – eine rechtliche Zusage, die eine
  Schulungsseite nicht geben kann, und im Widerspruch zu dem, was Modul 1 seit v1.10.0 sagt („jeder
  Upload gibt Daten aus dem Haus"). Ein Connector ist dabei der weitreichendste Fall, weil er eine
  **ganze Quelle** anbindet statt einer geprüften Datei. Jetzt: „der einfachste Fall, erfahrungsgemäß
  am schnellsten freigegeben" – die Bewertung machen IT und Datenschutz.
- **Skills werden erklärt, statt nur genannt.** Sie stehen im Modultitel, bekamen aber vier Sätze,
  und das Beispiel („aus Daten eine saubere Tabelle bauen") beschrieb etwas, das Claude **ohne** Skill
  kann – der eigentliche Nutzen blieb damit unsichtbar. Jetzt „Skills – festgelegte Arbeitsweisen"
  mit dem entscheidenden Satz: Claude *kann* die Aufgabe schon, der Skill legt fest, **wie sie bei uns
  gemacht wird**. Dazu ein Ohne-/Mit-Vergleich am Beispiel einer Standard-Antwort an Interessenten.
  Der Abgrenzungs-Ausklapper wurde mitgezogen (Faustregel „Können erweitern" → „immer gleiches
  Ergebnis sichern"), sonst hätte er dem neuen Abschnitt widersprochen.
- **Abgrenzung ergänzt, die erst durch v1.12.1 nötig wurde:** Modul 5 sagt „Verbinden macht die IT",
  Modul 3 sagt „Projekte darfst du in der Abteilung selbst teilen". Für Teilnehmer ist beides
  „etwas zugänglich machen" – jetzt steht ausdrücklich da, dass es zwei Vorgänge mit
  unterschiedlichen Regeln sind, samt Begründung (ganze Datenquelle ≠ geprüfte Datei).
- **Maßstab für die drei Prüffragen:** Die Übung verlangt, sie zu beantworten, ohne zu sagen, was eine
  gute Antwort ist. Jetzt: konkret statt pauschal (Ordnername + Inhalt), plus die Zweifelsregel – wer
  bei „Personenbezug?" zögern muss, hat die Antwort schon.

## [1.13.0] – 2026-07-29

### Added
- **Modul 4: Prompt Injection kommt jetzt hier vor, nicht erst in Modul 7.** Das ist die Stelle, an
  der das Risiko die Kategorie wechselt: Bis dahin kann Claude sich *irren* und man liest jede
  Antwort selbst — ab Cowork **handelt** er und macht Schritte, die niemand einzeln sieht. Der
  bestehende Freigaben-Callout lehrte schon den richtigen Reflex („nur bestätigen, was du
  verstehst"), nannte aber die Ursache nicht. Neuer Abschnitt mit dem konkreten Beispielsatz
  („Ignoriere alle vorherigen Anweisungen …"), drei Gewohnheiten (passt die Nachfrage zur Aufgabe ·
  woher kommt das Material · Auffälliges melden) und Verweis auf Modul 7. Bewusst an Modul 7
  angeschlossen formuliert — dort gilt der Grundsatz „Inhalt ist Material, kein Befehl", hier kommt
  dazu, dass die Grenze nicht immer trennscharf ist und beim Agenten schwerer wiegt.
- **Modul 4: Hinweis „Wo landet das Ergebnis?"** Für Claude Code warnt Modul 6 ausdrücklich bei
  „löschen, überschreiben, verschieben" — für Cowork fehlte das Gegenstück. Jetzt: Ergebnisse als
  *neue* Datei anlegen lassen, und bei Aufträgen mit „ersetzen/aufräumen/zusammenführen" ausdrücklich
  dazusagen, dass die Originale unangetastet bleiben.

### Changed
- **Modul 4 nennt keine festen Funktionsnamen mehr.** „Einrichtungsassistent" stand im Lernziel, im
  Abschnittstext *und* als Schritt 1 der Übung — heißt die Funktion anders oder fehlt sie, scheitert
  die Übung an ihrem ersten Schritt. Jetzt „der geführte Einstieg, den Cowork beim ersten Start
  anbietet", plus einem Satz an die Teilnehmer, dass die Oberfläche abweichen kann. Dieselbe Logik,
  die für Modellnamen schon galt.
- **Modul 4: Ampel-Check in der Übung ist wieder eine Frage.** Bisher „Waren alle verwendeten Inhalte
  grün? ✅" — das Häkchen nahm die Antwort vorweg, und zwar an der Stelle mit dem meisten Material.
  Jetzt: welche Farbe hatte das Material, woher kam es, und bei Dateien von außen: warum war das in
  Ordnung?
- **Trainer-Leitfaden, Modul 4:** Hinweis, den geführten Einstieg vorab selbst anzusehen, und der
  Kernsatz des Blocks (Claude *irrt* sich vorher, *handelt* ab hier).

## [1.12.1] – 2026-07-29

### Changed
- **Projekte teilen ist jetzt eine Regel statt einer offenen Frage** (Festlegung Dominik, 29.07.):
  innerhalb der eigenen Abteilung erlaubt, darüber hinaus vorher abstimmen. Der Hinweis in Modul 3
  formulierte bisher nur die Frage („gehört vielleicht trotzdem nicht in ein Projekt mit zwanzig
  Personen") – für Teilnehmer, die eine klare Ansage brauchen, war das zu weich. Der
  Datenschutz-Teil bleibt: geteilte Projekte teilen auch die Wissens-Dateien mit.
- **Trainer-Leitfaden:** Teilen-Regel bei Modul 3 hinterlegt, dazu der Prüf-Punkt („Wissens-Datei
  macht zuverlässiger, nicht fehlerfrei"). Bei Modul 1 die Rückfrage vermerkt, die verlässlich
  kommt – *„die Firmen-Version trainiert doch nicht mit unseren Daten"* – samt Ein-Satz-Antwort.
  Letzte Zeitangabe entfernt („lieber 10 Minuten mehr investieren" → „mehr Zeit als woanders").

## [1.12.0] – 2026-07-29

### Added
- **Modul 3: Prüf-Hinweis ergänzt** – die Seite erzeugte die stärkste Verlässlichkeits-Illusion der
  Schulung und war das einzige Inhaltsmodul ohne „du bleibst verantwortlich". Zwei Stellen wirkten
  zusammen: die Beispiel-Anweisung „sag offen, wenn etwas nicht in den Dateien steht" und der Satz
  „genauer und konsistenter" direkt darunter. Beides stimmt einzeln, gelesen wird daraus aber
  „hinterlegte Quelle = verlässlich". Jetzt ausdrücklich: die Anweisung senkt die Fehlerquote, sie
  garantiert nichts – und ein Fehler fällt hier **schwerer** auf, weil die Antwort nach dem eigenen
  Wissen klingt. Mit konkreter Handlung: Stichprobe gegen die Wissens-Datei, vor allem bei Zahlen,
  Fristen und Zuständigkeiten.
- **Modul 3: Hinweis zu geteilten Projekten.** Der Tipp empfiehlt Projekte zum Teilen im Team –
  damit sehen alle Projektmitglieder auch die Wissens-Dateien. Die Ampel beantwortet „darf das
  hinein?", beim Teilen kommt „und wer sieht es danach?" hinzu. Ein anonymisiertes internes Dokument
  ist für die KI unbedenklich, gehört aber nicht zwangsläufig in ein Projekt mit zwanzig Personen.
- **Modul 3: Ausklapper „Wie viel gehört in ein Projekt – und wann ist es zu viel?"** Bisher fehlte
  jeder Hinweis darauf, dass Wissens-Dateien Kontext kosten; Anfänger neigen dazu, alles
  hineinzuwerfen. Jetzt: zwei bis fünf gepflegte Dateien zu einem Thema schlagen zwanzig, Faustregel
  „ein Projekt = ein Zweck", plus dem bislang fehlenden Querverweis auf Vertiefung 1.
- **Modul 3: zwei weitere Projekt-Ideen** aus Schulbetrieb („Unterrichtsvorbereitung") und
  Verwaltung („Verwaltung & Schriftverkehr") – die drei bisherigen kamen alle aus dem
  Anerkennungsbereich. Ausklapper-Titel entsprechend von „Drei" auf „Fünf" korrigiert.

## [1.11.0] – 2026-07-29

### Changed
- **Ampel präzisiert: Gelb war an einer Stelle zu streng.** „Interne Dokumente ohne
  Namen/Kontaktdaten" stand unter Gelb – ohne Personenbezug greift der Datenschutz dort aber gar
  nicht. Solche Dokumente (Abläufe, Vorlagen, Checklisten) sind jetzt **grün**, mit der Bedingung
  „solange keine Person darin vorkommt". Gelb ist dafür klarer auf seinen eigentlichen Fall
  zugeschnitten: *enthält* Personenbezug, den du vorher entfernst. Neu dabei der Hinweis auf
  **indirekte** Erkennbarkeit (Standort + Datum + Beruf) – die Lücke, an der die Anonymisierung im
  Alltag scheitert und die Modul 7 im Quiz schon abfragt.
- **Neuer Hinweis „Zwei Fragen, die oft verwechselt werden".** Die Verschiebung nach Grün würde
  sonst eine neue Lücke öffnen: Kalkulationen, Verträge und Strategiepapiere enthalten häufig keine
  Personendaten, sind also grün im Sinne der Ampel – gehören aber trotzdem nicht in jedes Werkzeug.
  Personenbezug und Vertraulichkeit sind zwei verschiedene Prüfungen; das steht jetzt ausdrücklich da.

## [1.10.0] – 2026-07-29

### Changed
- **Anonymisierungs-Beispiel in Modul 1 ist jetzt erkennbar fiktiv.** Der Rot-Fall zeigte
  „Fatima Al-Rashid, geb. 12.03.1994, Krankenschwester aus Syrien, E-Mail fatima.a@…" – einen
  realistisch klingenden Personendatensatz, auf einer **öffentlich erreichbaren** Seite (das Repo
  ist public, weil der Org-Plan keine privaten Pages kann), und im Widerspruch zur eigenen
  Empfehlung „Muster Mustermann statt echter Personen" zwei Absätze darüber. Jetzt „Maria
  Musterfrau" mit ausdrücklichem Hinweis „frei erfundenes Beispiel"; Herkunftsland entfernt (für
  die Illustration unnötig, transportiert ein Stereotyp, und Herkunft ist selbst eine sensible
  Angabe). Struktur bleibt erhalten – Name + Geburtsdatum + Kontakt sind ja genau das, was den
  Fall rot macht – und ein Schlusssatz benennt das Prinzip: rot wird es durch die *Kombination*.
- **Ampel-Begründung nachgeschärft** (Modul 1 + FAQ in Modul 0). Bisher hieß es „Inhalte werden
  nicht zum Training verwendet – *trotzdem* gilt die Ampel", ohne das „trotzdem" zu erklären. Wer
  die Einstellung kennt, hält die Regel dann für Übervorsicht. Neuer Ausklapper „Warum ist das so
  streng?" mit vier Gründen in einfacher Sprache: Daten verlassen das Haus · Gesundheitsdaten sind
  besonders geschützt · für die Aufgabe braucht Claude den Namen nie · wir müssen Auskunft geben
  können. Ohne Paragraphen-Nummern.
- **Sperrige Gender-Konstruktion geglättet:** 4× „die/den bzw. der/dem Datenschutzbeauftragte:n"
  → „die Datenschutzbeauftragten". Es sind tatsächlich zwei Personen, damit ist der Plural auch
  sachlich richtiger. Die übrigen 11 Doppelpunkt-Formen (Kolleg:innen, Bewerber:innen,
  Interessent:innen) bleiben – die Brand Guideline verwendet sie selbst, das ist gesetzte CI.
- Modul 1: „Die Oberfläche in 60 Sekunden" → „im Überblick" (letzte Zeitangabe der Site).

### Added
- **Modul 1: Meldeweg für den Fall, dass doch etwas Rotes hochgeht.** Modul 7 hat den
  vollständigen Weg, aber Modul 1 ist das Modul, in dem zum ersten Mal wirklich hochgeladen und
  geübt wird – und der erste Reflex bei einem Fehler ist genau der falsche. Deshalb hier kurz:
  **nicht löschen**, stoppen, am selben Tag melden, notieren was drinstand, Verweis auf Modul 7.

## [1.9.0] – 2026-07-29

### Changed
- **Alle Zeitangaben entfernt** (34 Stellen): die „⏱️ ca. X Minuten" in allen 16 Modul-Köpfen und die
  Minuten in den 18 Übungs-Tags. Das Tempo hängt an der Gruppe, und die Angaben widersprachen sich
  gegenseitig. Zusätze in den Übungs-Tags bleiben erhalten („Denkaufgabe", „Korrektur",
  „Compliance-Check") – nur die Minuten sind weg.
- **Ampel-Zeichen bei Qualitätsvergleichen ersetzt.** 🔴/🟢 markierten an mehreren Stellen nicht
  Erlaubnis oder Risiko, sondern *Textqualität* – ausgerechnet in Modul 2, direkt nach der
  Ampel-Einführung in Modul 1. Umgestellt auf ✗/✓ mit neutralen Rahmen:
  - Modul 2: „Vage ↔ Klar" als Callout-Paar und im Tabellenkopf
  - Vertiefung 1: „Schwach ↔ Stark", zwei Paare
  - Deck: „Vage ↔ Klar" und „Was Claude ist ↔ ist nicht"
  - Aufbau 4: gutes ↔ schlechtes Skript, jetzt über `.infocard`
  - Vertiefung 1 „🟢 Deine fünf Gegenmittel" → 💡, Vertiefung 2 „🟢 VIDACTA-Beispiel" → 📌 (5×)
  Die Callout-Klassen `danger`/`tip` waren dort auch sachlich falsch: ein vager Prompt ist keine
  *Gefahr*. Farbig bleiben ausschließlich Verbote, Pflichten und die Ampel-Einordnung selbst.
- **Deck: farbiger Streifen der Ampelfolie zurückgeholt.** `.deck .ampel-card { border-color: … }`
  hat dieselbe Spezifität wie `.ampel-card.g/.a/.r` in `style.css` und gewinnt als späteres
  Stylesheet – die wichtigste Folie des Decks trug ihre Ampelfarben deshalb nur in den Punkten,
  nicht im Rand. Jetzt explizit im Deck-CSS gesetzt, mit Kommentar zur Ursache.

### Added
- **Modul 2: zweiter K-A-F-T-Prompt aus dem Schulbetrieb** (Doppelstunde vorbereiten) neben dem
  Beispiel aus dem Bewerbermanagement – damit sich beide Arbeitsbereiche wiederfinden.
- **Modul 2: neuer Abschnitt „Der häufigste Fall im Alltag: deinen eigenen Text verbessern lassen".**
  Alle bisherigen Beispiele ließen Claude etwas Neues schreiben; im Alltag ist der Ausgangspunkt
  meist ein eigener Entwurf. Mit kopierbarem Prompt (erst Schwächen benennen, dann verbessern,
  keine Fakten ändern, bei fehlender Information nachfragen) und der Datenschutz-Warnung, die
  genau hier hingehört: der eigene Entwurf enthält oft echte Personendaten.
- CSS-Muster `.callout.nein` / `.callout.ja` für Qualitätsvergleiche ohne Ampelfarben.

## [1.8.0] – 2026-07-29

### Changed
- **Ampelfarben sind jetzt allein der Datenschutz-Ampel vorbehalten.** Die grün/gelb/rot-Karten
  standen an 13 Stellen – aber nur an 8 davon bewertet die Farbe wirklich eine Erlaubnis oder ein
  Risiko. In Modul 0 lernte der Teilnehmer das Schema deshalb zuerst mit der *falschen* Bedeutung
  (dort stufte es Fähigkeiten ein), obwohl die 🚦 Ampel laut Trainer-Leitfaden der rote Faden des
  ganzen Tages ist. Fünf Blöcke auf ein neutrales Kartenmuster umgestellt:
  - Modul 0 „Stark / Mit Vorsicht / Nicht dafür da" – Fähigkeiten, keine Datenfreigabe
  - Modul 3 „Projekt lohnt sich / Normaler Chat reicht" – zwei gleichwertige Wege, Gelb war keine Warnung
  - Modul 5 „Bevor etwas verbunden wird: drei Fragen" – Farbe war reine Dekoration, jetzt nummeriert 1/2/3
  - Modul 6 „Könnte sich lohnen / Eher nicht nötig" – Entscheidungshilfe
  - Vertiefung 1 „Gute Gewohnheiten / Der ‚Neustart'-Trick" – zwei Tipps
  Unverändert farbig bleiben die acht Blöcke mit echter Erlaubnis- oder Risiko-Aussage:
  Datenschutz-Ampel in Modul 1, Modul 7 und im Deck, Browser-Ampel (Aufbau 1), Ton-Regeln und
  Skript-Vergleich (Aufbau 4), DSGVO-Lead-Wege (Aufbau 5), Vertrauens-Check (Vertiefung 1).
- **Modul 0: zweiter Beispiel-Prompt neutral formuliert.** Er beschrieb VIDACTA nur als
  „Bildungsunternehmen für die Anerkennung ausländischer Pflegekräfte" – wer an einer unserer
  Berufsfachschulen arbeitet, fand sich darin nicht wieder und bekam entsprechend unpassende
  Vorschläge. Jetzt Schulen *und* Anerkennungsbegleitung, dazu der Hinweis, den ersten Satz an
  den eigenen Bereich anzupassen.
- **Trainer-Leitfaden: fester Tagesablauf entfernt.** Die Uhrzeiten-Tabelle widersprach den
  Modul-Angaben (20-Minuten-Slot für Deck-Intro *und* ein 15-Minuten-Modul) und gab ein Tempo vor,
  das an der Gruppe hängt. Ersetzt durch Reihenfolge + Gewichtung (nie streichen / Kern mit viel
  Übungszeit / kann ins Selbstlernen) samt Kurz-Variante – ohne Zeitangaben.

### Added
- CSS-Muster `.infogrid` / `.infocard` für neutrale Karten, mit optionalem Nummern-Badge `.idx`.
  Ein Kommentar im Stylesheet hält fest, warum dort keine Ampelfarben verwendet werden.
- CSS-Muster `.hint` für einen kurzen Hinweis direkt unter einem Prompt-Block.

## [1.7.1] – 2026-07-27

### Fixed
- **Präsentation: „Live-Moment"-Pillen liefen über die volle Folienbreite** (1072 px statt
  263–361 px, auf allen drei Live-Folien). Ursache: `.live-badge` ist `inline-flex`, wird als
  Flex-Item von `.slide` aber **blockifiziert** (`inline-flex` → `flex`) und dann von
  `align-items: stretch` auf Containerbreite gezogen. Fix: `align-self: flex-start`.
  Geprüft bei 1280×800, 1920×1080 und 375×812 – Pillen sitzen exakt auf Inhaltsbreite.

## [1.7.0] – 2026-07-27

### Added
Content-Audit über alle 19 Seiten (6 parallele Fach-Reviewer + adversariale Gegenprobe gegen
die VIDACTA-Regeln), **49 geprüfte Ergänzungen eingebaut**. Die dünnsten Seiten waren
Präsentation, Modul 8, Aufbau 1 und Aufbau 4 (Bewertung 2 von 5).

- **Eröffnungs-Deck: 11 → 15 Folien.** Vier inhaltliche Lücken geschlossen, die eine
  Workshop-Eröffnung nicht haben darf: „Das machen Kolleg:innen heute schon" (konkrete
  Anwendungsfälle statt abstraktem Nutzen), **„Claude kann sich überzeugend irren"** als Regel Nr. 2
  direkt nach dem ersten Live-Prompt, „Was Claude ist – und was nicht" (keine Rechts-/
  medizinische/amtliche Auskunft) und ein Cowork-Vorgeschmack. Dazu das vierte Tages-Versprechen
  (Ergebnisse prüfen) und ein konkreter Ausblick auf Vertiefung und Aufbau-Track.
- **Modul 8** (dünnste Grundlagen-Seite): Spick-Hilfe „So sieht ein guter Durchlauf aus" mit
  Beispiel-Prompt, „Ich hänge fest – wo schaue ich nach?", fünf typische Stolperfallen und eine
  Ergebnis-Check-Tabelle (Prüf-Frage / gut gelaufen / Warnsignal).
- **Modul 7:** Anonymisieren-Vorher/Nachher inkl. Warnung vor identifizierenden Kombinationen,
  Übung 7b mit den kniffligen Grauzonen-Fällen.
- **Modul 4:** Tabelle mit fünf Büroalltags-Aufträgen, zweiter kopierbarer Beispiel-Auftrag
  (Info-Nachmittag), „Was tun, wenn das Ergebnis nicht passt?".
- **Modul 5:** Vorher-nachher-Tabelle zum Connector-Nutzen, Abgrenzung Wissens-Datei/Connector/Skill,
  Muster-Anfrage an die IT.
- **Modul 3:** Tabelle „Gute Projektanweisungen schreiben", drei Projekt-Ideen, zwei FAQ-Blöcke
  (Chat-Upload vs. Wissens-Datei, veraltete Inhalte).
- **Modul 0/1/2/6:** Vorher/Nachher-Beispiel (Stichpunkte → E-Mail), „Claude ist keine Suchmaschine",
  Warnung „Anonymisieren heißt vorher – nicht durch Claude", Ampel-Quiz mit Auflösung,
  Vage/Klar-Tabelle für drei Alltagsaufgaben, Prompt-FAQ, „Was macht diesen Auftrag sicher?".
- **Aufbau 1:** vier Marketing-Anwendungsfälle mit Standard-Prompt, konkretes
  Prompt-Injection-Beispiel, Browser-Ampel (welche Seiten darf Claude mitlesen), zweite Übung.
- **Aufbau 4:** Längentabelle Reel → Skript, gutes vs. schlechtes VO-Skript im Direktvergleich,
  Prüf-Prompt für verbotene Claims, Korrektur-Übung „Skript-Klinik", Musik-Briefing-Prompt.
- **Aufbau 2/3/5:** Zuordnungstabelle Aufgabe → Werkzeug, Abgrenzung Connector vs. Werkzeug,
  Muster-Lösung zur Denkaufgabe, Briefing-Vorlage als Prompt, gutes vs. schwaches Briefing,
  Prüf-Prompt für Anzeigen-Ideen, Tabelle „Typische Fehler – und was stattdessen".
- **Vertiefung 1/2:** Vertrauens-Check (wie viel Prüfung braucht welches Ergebnis – klar abgegrenzt
  von der Eingabe-Ampel), drei Alltagsfragen zum Kontext, Selbst-Test mit fünf Situationen,
  Einstiegs-Empfehlung „Womit fange ich an?".

Alle Ergänzungen nutzen ausschließlich bestehende Bausteine und Fakten aus der Schulung –
keine neuen Produktnamen, Zahlen oder UI-Beschreibungen.

## [1.6.3] – 2026-07-27

### Fixed
Mobil-Audit über alle 19 Seiten bei 320/375/414 px – vier Befunde behoben:

- **Diagramme waren auf dem Handy unlesbar:** Die SVG-Beschriftungen wurden auf ~7 px
  heruntergerechnet. Unter 640 px bekommen sie jetzt eine Mindestbreite von 640 px und die Figur
  scrollt seitlich (gleiches Muster wie `.table-scroll`) – Text effektiv ~11,6 px. Die
  Bildunterschrift bleibt per `position: sticky` stehen und ergänzt den Hinweis
  „seitlich wischen, um alles zu sehen".
- **Copy-Buttons zu klein:** 25 px hoch (unter jeder Touch-Empfehlung). Auf Mobil jetzt 38 px
  und unter den Prompt-Text gesetzt, statt oben rechts über dem Text zu schweben.
- **Deck-Folie 6 (Ampel) wurde abgeschnitten:** Auf schmalen/niedrigen Displays scrollen die
  Folien jetzt (oben ausgerichtet, kompaktere Karten, ausgeblendeter Tastatur-Hinweis).
- **Lange deutsche Komposita sprengten das Layout** („Stellen-/Ausbildungsanzeigen" ergab
  32 px Überlauf auf aufbau-5, Prompt-Tokens 5 px auf aufbau-4): global
  `overflow-wrap: break-word`, in Prompts `anywhere`.
- Zusätzlich: Kopfzeile bei ≤380 px kompakter (stand 7 px über), Silbentrennung
  (`hyphens: auto`) für Fließtext auf Mobil – deutlich ruhigerer Flattersatz.

## [1.6.2] – 2026-07-27

### Changed
- Startseite: Der Deck-Hinweis war ein loser Absatz unter dem Workbrain-Banner und wirkte
  unplatziert. Ersetzt durch eine **Trainer-Karte** (`.trainer-card`) im Raster des
  Promo-Banners: gleiche Breite, heller Untergrund mit Sky-Akzentkante links, Eyebrow
  „Für Trainer", Titel und eigener Button. Kontrast in Hell und Dunkel über WCAG AA,
  bricht auf Mobil sauber um.

## [1.6.1] – 2026-07-27

### Changed
- Startseite: Trainer-Hinweis mit Link auf das Eröffnungs-Deck (`praesentation.html`)
  unter dem Workbrain-Banner – das Deck ist jetzt von der Site aus erreichbar.

## [1.6.0] – 2026-07-27

### Added
- **Workshop-Eröffnungs-Deck `praesentation.html`** (animierte Browser-Präsentation für den
  Trainer, 11 Folien): eigene Folien-Engine ohne Build-Step (Pfeiltasten/Klick, Fragments,
  Fortschrittsbalken, Hash-Deep-Links, `prefers-reduced-motion`-sicher), Dark-Navy-Look auf Basis
  der vorhandenen Design-Tokens (`data-theme="dark"` + style.css). **Drei markierte
  „Live-Momente"**, bei denen alle Teilnehmer an ihrem eigenen Claude-Team-Seat mitmachen:
  erster Prompt (Copy-Button wie auf der Site), Ampel-Zuruf-Quiz mit aufdeckbaren Antworten,
  „Mach du den Prompt besser". Inhalte 1:1 aus den Modulen (kein neuer Faktenstand).
- Trainer-Leitfaden: Intro-Block zum Deck + Checklisten-Punkt „Vor dem Workshop".

## [1.5.0] – 2026-07-27

### Added
- **Modul 7: neuer Abschnitt „Versteckte Anweisungen in Dokumenten & Webseiten"** (Prompt
  Injection für Nicht-Techniker: Material ≠ Auftrag, Vorsicht bei fremden Dateien, Abbrechen &
  Melden) – das Risiko stand bisher nur im Browser-Modul (Aufbau 1); Folgeabschnitt umnummeriert.
- **Modul 8: Challenge-Variante C „Bewerber-Kommunikation"** (Beratung/Bewerbermanagement) mit
  bewusstem Anonymisierungs-Schritt – die Rolle mit dem höchsten Datenschutz-Risiko hatte keine
  eigene Abschlussaufgabe.
- **Aufbau 3: Alltagskleidung-Regel** (VIDACTA-Kontext = Alltagskleidung, keine Kasacks/Scrubs;
  Schule ≠ Klinik; positiv briefen) als Gestaltungsregel, QA-Punkt und Compliance-Kurzcheck-Eintrag.
- **Modul 2: zweiter Profi-Kniff „Claude zuerst fragen lassen"** (Rückfragen-Trick).
- **Trainer-Leitfaden: Abschnitt Vertiefungs-Track** (Selbstlernen als Standard oder
  60–90-Minuten-Kurzblock) + Checklisten-Punkt „Nach dem Workshop" – der Track aus v1.3.0 fehlte
  im Leitfaden komplett.
- Modul 0: Websuche als Abhilfe bei aktuellen Themen erwähnt (Ampel-Karte „Mit Vorsicht") und
  FAQ-Eintrag, dass der Lern-Fortschritt nur lokal im Browser gespeichert wird.
- Modul 7: Querverweis auf Vertiefung 1 (Halluzinationen im Detail) – analog zu den bestehenden
  Querverweisen aus Modul 2 und 3.

### Fixed
- Aufbau 3: QA-Punkt „realistische Pflege-/Arbeitssituation" lenkte Richtung Klinik-Optik –
  ersetzt durch „Schul-/Lern-Kontext, Alltagskleidung statt Kasack".
- Trainer-Leitfaden: „Klарmachen" enthielt zwei kyrillische Homoglyphen (а/р) → „Klarmachen".

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
