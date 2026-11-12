// German is the source text. en.ts must have exactly the same shape –
// TypeScript reports any key that is missing there.
export const de = {
	meta: {
		title: 'Avantiris – Think Tank für KI und die Zukunft der Gesellschaft',
		description:
			'Avantiris ist ein unabhängiger, gemeinnütziger Think Tank. Wir erforschen, wie grosse Sprachmodelle die Arbeit und das Zusammenleben in der Schweiz verändern.',
		// Language tag for link previews (Open Graph).
		locale: 'de_CH',
		keywords: [
			'Avantiris',
			'Think Tank',
			'Denkfabrik',
			'künstliche Intelligenz',
			'KI',
			'Sprachmodelle',
			'LLM',
			'Zukunft der Arbeit',
			'Automatisierung',
			'Gesellschaft',
			'Schweiz',
			'Thun'
		]
	},
	slogan: 'Think Tank für KI und die Zukunft der Gesellschaft',
	nav: {
		programmes: 'Programme',
		approach: 'Arbeitsweise',
		association: 'Verein',
		language: 'Sprache'
	},
	epochs: {
		scroll: 'Scrollen',
		// One entry per scene of the opening animation, in order.
		stages: [
			{ year: '−10 000', label: 'Acker', text: 'Arbeit ist Handarbeit.' },
			{ year: '1800', label: 'Fabrik', text: 'Maschinen übernehmen die Kraft.' },
			{ year: '1970', label: 'Büro', text: 'Die Arbeit wandert in den Kopf.' },
			{ year: '2022', label: 'Modell', text: 'Sprachmodelle übernehmen erste Kopfarbeit.' },
			{ year: '20??', label: 'Offen', text: 'Und was macht dann der Mensch?' }
		]
	},
	mission: {
		label: 'Auftrag',
		title: 'Wir untersuchen, was grosse Sprachmodelle mit der Schweiz machen.',
		paragraphs: [
			'Avantiris ist ein unabhängiger, gemeinnütziger Schweizer Think Tank. Wir erforschen, wie künstliche Intelligenz – allen voran grosse Sprachmodelle (LLMs) – die Arbeit, die Wirtschaft und das Zusammenleben der Menschen in der Schweiz verändert.',
			'Dafür erheben wir Daten, stellen unterschiedliche Perspektiven nebeneinander und denken mögliche Entwicklungen zu Ende: von den Veränderungen der nächsten Jahre bis zur Frage, was der Mensch in einer weitgehend automatisierten Welt tut. Was wir herausfinden, veröffentlichen wir.'
		]
	},
	programmes: {
		label: 'Programme',
		title: 'Drei Programme, drei Zeithorizonte.',
		items: [
			{
				title: 'Arbeit im Wandel',
				horizon: 'kurz- bis mittelfristig',
				method: 'empirisch',
				text: 'Wir erheben, wie sich die Erwerbsarbeit in der Schweiz heute und in den kommenden Jahren verändert: welche Tätigkeiten Sprachmodelle bereits übernehmen, welche Berufe sich wandeln und wo neue Aufgaben entstehen.'
			},
			{
				title: 'Szenarien',
				horizon: 'mittel- bis langfristig',
				method: 'empirisch, in Szenarien',
				text: 'Was geschieht, wenn körperliche und geistige Arbeit automatisiert werden? Auf empirischer Grundlage entwickeln wir mögliche Zukunftsszenarien für Wirtschaft und Gesellschaft und prüfen, was sie für die Schweiz bedeuten würden.'
			},
			{
				title: 'Mensch und Sinn',
				horizon: 'langfristig',
				method: 'philosophisch',
				text: 'Was tut der Mensch, wenn Maschinen die Arbeit erledigen? Worin findet er Sinn? Und wie müssen wir uns als Gesellschaft verändern? Dieses Programm verlässt die Empirie und stellt die grundsätzlichen Fragen.'
			}
		]
	},
	approach: {
		label: 'Arbeitsweise',
		title: 'Forschen, vermitteln, Stellung nehmen.',
		items: [
			{
				title: 'Forschen',
				text: 'Wir erarbeiten und veröffentlichen Analysen, Studien und Lösungsansätze.'
			},
			{
				title: 'Vermitteln',
				text: 'Wir organisieren Veranstaltungen, Vorträge, Kurse und weitere Bildungsangebote.'
			},
			{
				title: 'Austauschen',
				text: 'Wir suchen den Dialog mit Bevölkerung, Bildung, Wissenschaft, Wirtschaft, Politik und Behörden.'
			},
			{
				title: 'Zusammenarbeiten',
				text: 'Wir arbeiten mit Organisationen zusammen, die ähnliche Ziele verfolgen.'
			},
			{
				title: 'Stellung nehmen',
				text: 'Wir äussern uns sachlich und parteipolitisch unabhängig, etwa in Vernehmlassungen und mit Positionspapieren.'
			}
		]
	},
	association: {
		label: 'Verein',
		title: 'Unabhängig und gemeinnützig.',
		facts: [
			{ term: 'Rechtsform', text: 'Verein nach Art. 60 ff. ZGB' },
			{ term: 'Sitz', text: 'Thun' },
			{ term: 'Zweck', text: 'Ausschliesslich gemeinnützig, ohne Gewinnabsicht' },
			{ term: 'Haltung', text: 'Parteipolitisch und konfessionell neutral' },
			{
				term: 'Transparenz',
				text: 'Zuwendungen juristischer Personen über CHF 5’000 pro Jahr legen wir im Jahresbericht offen.'
			}
		],
		membershipTitle: 'Mitglied werden',
		membership:
			'Mitglied kann jede natürliche oder juristische Person werden, die den Vereinszweck unterstützt – als Aktivmitglied mit Stimmrecht oder als Fördermitglied. Aufnahmegesuche gehen schriftlich an den Vorstand.',
		contact: 'Kontakt',
		statutes: 'Statuten (PDF)'
	},
	footer: {
		top: 'Nach oben'
	}
};
