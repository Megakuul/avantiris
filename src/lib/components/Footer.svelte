<script lang="ts">
	import { asset } from '$app/paths';
	import type { Messages } from '#lib/i18n/index.ts';
	import { site } from '#lib/site.ts';
	import Logo from './Logo.svelte';

	let { t }: { t: Messages } = $props();
</script>

<footer class="bg-black py-16 text-white">
	<div class="page">
		<Logo class="mb-8 h-16" />
		<p class="display text-4xl md:text-7xl">{site.name}</p>
		<p class="mt-4 text-lg text-balance text-neutral-400">{t.slogan}</p>

		<div class="label mt-16 flex text-neutral-400! flex-wrap gap-x-8 gap-y-3 border-t border-neutral-700 pt-6">
			<span>Verein {site.name}</span>
			<a href={asset(site.statutes)} class="hover:underline">{t.association.statutes}</a>
			<a href="#top" class="hover:underline md:ml-auto">{t.footer.top} ↑</a>
		</div>
	</div>
</footer>
