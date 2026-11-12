<script lang="ts">
	import { resolve } from '$app/paths';
	import { locales, pathFor, type Locale, type Messages } from '#lib/i18n/index.ts';
	import { site } from '#lib/site.ts';
	import Logo from './Logo.svelte';

	let { lang, t }: { lang: Locale; t: Messages } = $props();
</script>

<header class="fixed inset-x-0 top-0 z-50 border-b-2 border-black bg-white">
	<div class="page flex h-16 items-center justify-between">
		<a href={resolve(pathFor(lang))} class="flex items-center gap-3" aria-label={site.name}>
			<Logo animated class="h-7" />
			<span class="display text-lg">{site.name}</span>
		</a>

		<nav class="label flex items-center gap-8 text-black!">
			<a href="#programme" class="hidden hover:underline md:block">{t.nav.programmes}</a>
			<a href="#arbeitsweise" class="hidden hover:underline md:block">{t.nav.approach}</a>
			<a href="#verein" class="hidden hover:underline md:block">{t.nav.association}</a>

			<span class="flex gap-2" aria-label={t.nav.language}>
				{#each locales as locale (locale)}
					<a
						href={resolve(pathFor(locale))}
						hreflang={locale}
						aria-current={locale === lang ? 'true' : undefined}
						class={locale === lang ? 'underline underline-offset-4' : 'hover:underline'}
					>
						{locale}
					</a>
				{/each}
			</span>
		</nav>
	</div>
</header>
