<script lang="ts">
	import { asset } from '$app/paths';
	import { messages, type Locale } from '#lib/i18n/index.ts';
	import { reveal } from '#lib/reveal.ts';
	import { site } from '#lib/site.ts';
	import Approach from './Approach.svelte';
	import Epochs from './Epochs.svelte';
	import Footer from './Footer.svelte';
	import Header from './Header.svelte';
	import Programmes from './Programmes.svelte';
	import Section from './Section.svelte';
	import Seo from './Seo.svelte';

	// The whole one-page site. `lang` picks the dictionary from src/lib/i18n.
	let { lang }: { lang: Locale } = $props();
	let t = $derived(messages[lang]);
</script>

<Seo {lang} />

<Header {lang} {t} />

<main id="top">
	<Epochs name={site.name} slogan={t.slogan} t={t.epochs} />

	<Section id="auftrag" number="01" label={t.mission.label} title={t.mission.title}>
		<div class="grid gap-8 md:grid-cols-2 md:gap-16">
			{#each t.mission.paragraphs as paragraph, i (paragraph)}
				<p class="copy" use:reveal style:--reveal-delay="{i * 120}ms">{paragraph}</p>
			{/each}
		</div>
	</Section>

	<Section id="programme" number="02" label={t.programmes.label} title={t.programmes.title}>
		<Programmes t={t.programmes} />
	</Section>

	<Section id="arbeitsweise" number="03" label={t.approach.label} title={t.approach.title}>
		<Approach t={t.approach} />
	</Section>

	<Section id="verein" number="04" label={t.association.label} title={t.association.title}>
		<div class="grid gap-12 md:grid-cols-2 md:gap-16">
			<dl class="border-b border-black" use:reveal>
				{#each t.association.facts as fact (fact.term)}
					<div class="grid grid-cols-3 gap-4 border-t border-black py-4">
						<dt class="label pt-1">{fact.term}</dt>
						<dd class="col-span-2 font-medium">{fact.text}</dd>
					</div>
				{/each}
			</dl>

			<div use:reveal style:--reveal-delay="120ms">
				<h3 class="mb-4 text-2xl font-bold">{t.association.membershipTitle}</h3>
				<p class="copy mb-8">{t.association.membership}</p>

				{#if site.email}
					<p class="mb-8">
						<span class="label mr-3">{t.association.contact}</span>
						<a href="mailto:{site.email}" class="underline underline-offset-4">{site.email}</a>
					</p>
				{/if}

				<a
					href={asset(site.statutes)}
					class="label inline-block border-2 border-black bg-black px-6 py-4 text-white! hover:bg-white hover:text-black!"
				>
					{t.association.statutes} ↓
				</a>
			</div>
		</div>
	</Section>
</main>

<Footer {t} />
