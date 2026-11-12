import { locales } from '#lib/i18n/index.ts';
import { absoluteUrl, alternates } from '#lib/seo.ts';

// Written to /sitemap.xml at build time: the list of pages for search
// engines, one entry per language, each pointing to its translations.
export const prerender = true;

export function GET() {
	const lastmod = new Date().toISOString().slice(0, 10);
	const links = alternates()
		.map(({ hreflang, href }) => `<xhtml:link rel="alternate" hreflang="${hreflang}" href="${href}"/>`)
		.join('\n\t\t');

	const urls = locales
		.map(
			(locale) => `	<url>
		<loc>${absoluteUrl(locale)}</loc>
		<lastmod>${lastmod}</lastmod>
		${links}
	</url>`
		)
		.join('\n');

	const xml = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xhtml="http://www.w3.org/1999/xhtml">
${urls}
</urlset>
`;

	return new Response(xml, { headers: { 'Content-Type': 'application/xml' } });
}
