import type { Handle } from '@sveltejs/kit/hooks';
import { localeFromPath } from '#lib/i18n/index.ts';

// Runs while the pages are prerendered: writes the right <html lang="…">.
export const handle: Handle = ({ event, resolve }) => {
	const lang = localeFromPath(event.url.pathname);
	return resolve(event, {
		transformPageChunk: ({ html }) => html.replace('%lang%', lang)
	});
};
