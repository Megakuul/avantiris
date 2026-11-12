import type { Messages } from './index';

export const en: Messages = {
	meta: {
		title: 'Avantiris – Think tank for AI and the future of society',
		description:
			'Avantiris is an independent, non-profit think tank from Switzerland. We study how large language models are changing work and life in Switzerland.',
		locale: 'en_GB',
		keywords: [
			'Avantiris',
			'think tank',
			'artificial intelligence',
			'AI',
			'large language models',
			'LLM',
			'future of work',
			'automation',
			'society',
			'Switzerland',
			'Thun'
		]
	},
	slogan: 'Think tank for AI and the future of society',
	nav: {
		programmes: 'Programmes',
		approach: 'Approach',
		association: 'Association',
		language: 'Language'
	},
	epochs: {
		scroll: 'Scroll',
		stages: [
			{ year: '−10 000', label: 'Field', text: 'Work is done by hand.' },
			{ year: '1800', label: 'Factory', text: 'Machines take over the muscle.' },
			{ year: '1970', label: 'Office', text: 'Work moves into the head.' },
			{ year: '2022', label: 'Model', text: 'Language models take on the first knowledge work.' },
			{ year: '20??', label: 'Open', text: 'And what will people do then?' }
		]
	},
	mission: {
		label: 'Mission',
		title: 'We study what large language models are doing to Switzerland.',
		paragraphs: [
			'Avantiris is an independent, non-profit Swiss think tank. We research how artificial intelligence – large language models (LLMs) above all – is changing work, the economy and the way people live together in Switzerland.',
			'To do so we collect data, set different perspectives side by side and think possible developments through to the end: from the changes of the next few years to the question of what people do in a largely automated world. What we find, we publish.'
		]
	},
	programmes: {
		label: 'Programmes',
		title: 'Three programmes, three time horizons.',
		items: [
			{
				title: 'Work in transition',
				horizon: 'short to medium term',
				method: 'empirical',
				text: 'We measure how paid work in Switzerland is changing today and over the coming years: which tasks language models already take on, which occupations are shifting and where new tasks emerge.'
			},
			{
				title: 'Scenarios',
				horizon: 'medium to long term',
				method: 'empirical, scenario-based',
				text: 'What happens when physical and mental work are automated? On an empirical basis we develop possible future scenarios for the economy and society, and examine what they would mean for Switzerland.'
			},
			{
				title: 'Humans and meaning',
				horizon: 'long term',
				method: 'philosophical',
				text: 'What do people do when machines do the work? Where do they find meaning? And how do we have to change as a society? This programme leaves empirical ground and asks the fundamental questions.'
			}
		]
	},
	approach: {
		label: 'Approach',
		title: 'Research, educate, take a position.',
		items: [
			{
				title: 'Research',
				text: 'We produce and publish analyses, studies and proposed solutions.'
			},
			{
				title: 'Educate',
				text: 'We organise events, talks, courses and other educational formats.'
			},
			{
				title: 'Exchange',
				text: 'We seek dialogue with the public, education, science, business, politics and public authorities.'
			},
			{
				title: 'Collaborate',
				text: 'We work with organisations that pursue similar goals.'
			},
			{
				title: 'Take a position',
				text: 'We comment factually and independently of party politics, for example in public consultations and with position papers.'
			}
		]
	},
	association: {
		label: 'Association',
		title: 'Independent and non-profit.',
		facts: [
			{ term: 'Legal form', text: 'Association under Art. 60 ff. of the Swiss Civil Code' },
			{ term: 'Seat', text: 'Thun, Switzerland' },
			{ term: 'Purpose', text: 'Exclusively charitable, not for profit' },
			{ term: 'Stance', text: 'Neutral in party politics and religion' },
			{
				term: 'Transparency',
				text: 'Contributions from legal entities above CHF 5,000 per year are disclosed in the annual report.'
			}
		],
		membershipTitle: 'Become a member',
		membership:
			'Any natural or legal person who supports the purpose of the association can join – as an active member with voting rights or as a supporting member. Applications are sent in writing to the board.',
		contact: 'Contact',
		statutes: 'Statutes (PDF, German)'
	},
	footer: {
		top: 'Back to top'
	}
};
