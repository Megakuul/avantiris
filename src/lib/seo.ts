import { defaultLocale, locales, messages, pathFor, type Locale } from '#lib/i18n/index.ts';
import { site } from '#lib/site.ts';

// Full address of a file in static/, e.g. the preview picture.
export function absoluteAsset(file: string) {
	return `${site.url}/${file}`;
}

// Full address of a language version, always with a slash at the end
// (the pages are written as /en/index.html).
export function absoluteUrl(locale: Locale) {
	const path = pathFor(locale);
	return site.url + (path.endsWith('/') ? path : `${path}/`);
}

// Every language version with its address. `x-default` tells search engines
// which one to show when none of the languages fits the visitor.
export function alternates() {
	return [
		...locales.map((locale) => ({ hreflang: locale as string, href: absoluteUrl(locale) })),
		{ hreflang: 'x-default', href: absoluteUrl(defaultLocale) }
	];
}

// Structured data (schema.org) for one language version: who the organisation
// is, what the website is and what this page is.
export function structuredData(locale: Locale) {
	const t = messages[locale];
	const url = absoluteUrl(locale);
	const organisation = `${site.url}/#organization`;
	const website = `${site.url}/#website`;

	return {
		'@context': 'https://schema.org',
		'@graph': [
			{
				'@type': 'NGO',
				'@id': organisation,
				name: site.name,
				url: `${site.url}/`,
				slogan: t.slogan,
				description: t.meta.description,
				logo: { '@type': 'ImageObject', url: absoluteAsset('icon-512.png'), width: 512, height: 512 },
				image: absoluteAsset(site.shareImage.file),
				address: { '@type': 'PostalAddress', addressLocality: site.seat, addressCountry: 'CH' },
				areaServed: { '@type': 'Country', name: 'Switzerland' },
				knowsAbout: t.meta.keywords,
				...(site.email ? { email: site.email } : {}),
				...(site.profiles.length ? { sameAs: site.profiles } : {})
			},
			{
				'@type': 'WebSite',
				'@id': website,
				name: site.name,
				url: `${site.url}/`,
				inLanguage: locales,
				publisher: { '@id': organisation }
			},
			{
				'@type': 'WebPage',
				'@id': `${url}#webpage`,
				url,
				name: t.meta.title,
				description: t.meta.description,
				inLanguage: locale,
				isPartOf: { '@id': website },
				about: { '@id': organisation },
				primaryImageOfPage: absoluteAsset(site.shareImage.file)
			}
		]
	};
}
