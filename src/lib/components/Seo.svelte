<script lang="ts">
	import { locales, messages, type Locale } from '#lib/i18n/index.ts';
	import { absoluteAsset, absoluteUrl, alternates, structuredData } from '#lib/seo.ts';
	import { site } from '#lib/site.ts';

	/*
	 * Everything search engines and link previews read from the <head>.
	 * The texts come from `meta` in the i18n files, the addresses from site.ts.
	 */
	let { lang }: { lang: Locale } = $props();

	let meta = $derived(messages[lang].meta);
	let url = $derived(absoluteUrl(lang));
	let image = absoluteAsset(site.shareImage.file);

	// "<" is escaped so that no text can ever close the script tag early.
	let jsonLd = $derived(JSON.stringify(structuredData(lang)).replace(/</g, '\\u003c'));
</script>

<svelte:head>
	<title>{meta.title}</title>
	<meta name="description" content={meta.description} />
	<meta name="keywords" content={meta.keywords.join(', ')} />
	<meta name="author" content={site.name} />
	<meta name="publisher" content={site.name} />
	<meta name="application-name" content={site.name} />
	<meta name="apple-mobile-web-app-title" content={site.name} />

	<!-- Allow indexing with full-size previews and snippets of any length. -->
	<meta
		name="robots"
		content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1"
	/>

	<!-- One official address per language, and where the other languages live. -->
	<link rel="canonical" href={url} />
	{#each alternates() as alternate (alternate.hreflang)}
		<link rel="alternate" hreflang={alternate.hreflang} href={alternate.href} />
	{/each}

	<!-- Open Graph: previews on LinkedIn, Facebook, WhatsApp, Signal, Slack … -->
	<meta property="og:type" content="website" />
	<meta property="og:site_name" content={site.name} />
	<meta property="og:title" content={meta.title} />
	<meta property="og:description" content={meta.description} />
	<meta property="og:url" content={url} />
	<meta property="og:locale" content={meta.locale} />
	{#each locales.filter((locale) => locale !== lang) as locale (locale)}
		<meta property="og:locale:alternate" content={messages[locale].meta.locale} />
	{/each}
	<meta property="og:image" content={image} />
	<meta property="og:image:type" content="image/png" />
	<meta property="og:image:width" content={String(site.shareImage.width)} />
	<meta property="og:image:height" content={String(site.shareImage.height)} />
	<meta property="og:image:alt" content={meta.title} />

	<!-- X / Twitter and others that read these tags. -->
	<meta name="twitter:card" content="summary_large_image" />
	<meta name="twitter:title" content={meta.title} />
	<meta name="twitter:description" content={meta.description} />
	<meta name="twitter:image" content={image} />
	<meta name="twitter:image:alt" content={meta.title} />

	<!-- eslint-disable-next-line svelte/no-at-html-tags -->
	{@html `<script type="application/ld+json">${jsonLd}</` + `script>`}
</svelte:head>
