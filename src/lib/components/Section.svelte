<script lang="ts">
	import type { Snippet } from 'svelte';
	import { reveal } from '#lib/reveal.ts';

	// A numbered page section: rule on top, small label, big headline, content.
	let {
		id,
		number,
		label,
		title,
		children
	}: { id: string; number: string; label: string; title: string; children: Snippet } = $props();
</script>

<section {id} class="border-t-2 border-black py-20 md:py-28">
	<div class="page">
		<div use:reveal>
			<p class="label mb-6">{number} — {label}</p>
			<h2 class="heading mb-12 max-w-4xl md:mb-16">{title}</h2>
		</div>
		{@render children()}
	</div>
</section>
