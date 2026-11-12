import { de } from './de';
import { en } from './en';

// German is the primary language and lives at "/", English at "/en".
// To add a language: copy de.ts, translate it, add it here and add a
// route folder next to src/routes/en.
export const messages = { de, en };

export type Locale = keyof typeof messages;
export type Messages = typeof de;

export const locales = Object.keys(messages) as Locale[];
export const defaultLocale: Locale = 'de';

// Where each language lives. Must match the folders in src/routes.
const paths = { de: '/', en: '/en' } as const;

export function pathFor(locale: Locale) {
	return paths[locale];
}

export function localeFromPath(pathname: string): Locale {
	const first = pathname.split('/')[1];
	return locales.find((locale) => locale === first) ?? defaultLocale;
}
