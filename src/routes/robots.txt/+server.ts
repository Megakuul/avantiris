import { site } from '#lib/site.ts';

// Written to /robots.txt at build time: everything may be crawled,
// and the sitemap lists the pages.
export const prerender = true;

export function GET() {
	const text = `User-agent: *
Allow: /

Sitemap: ${site.url}/sitemap.xml
`;

	return new Response(text, { headers: { 'Content-Type': 'text/plain' } });
}
