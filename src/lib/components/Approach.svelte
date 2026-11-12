<script lang="ts">
	import { onMount } from 'svelte';
	import type { Messages } from '#lib/i18n/index.ts';
	import Figure from './Figure.svelte';

	/*
	 * The five ways of working. The texts scroll past, the drawing stays
	 * pinned next to them (on phones: above them) and changes to match the
	 * step that is currently in the middle of the screen.
	 *
	 * The pinning is plain CSS (`position: sticky`), so scrolling itself never
	 * waits for JavaScript. The script only notes which step is active.
	 */
	let { t }: { t: Messages['approach'] } = $props();

	let list: HTMLElement;
	let active = $state(0);
	// Steps are only dimmed once the script runs – without it all stay readable.
	let ready = $state(false);

	onMount(() => {
		// A step is active while it crosses a thin line in the middle of the screen.
		const observer = new IntersectionObserver(
			(entries) => {
				for (const entry of entries) {
					if (entry.isIntersecting) active = Number((entry.target as HTMLElement).dataset.step);
				}
			},
			{ rootMargin: '-50% 0px -50% 0px' }
		);
		for (const item of list.children) observer.observe(item);
		ready = true;

		return () => observer.disconnect();
	});
</script>

<div class="grid md:grid-cols-2 md:gap-16">
	<!-- The pinned drawing. Decoration only: the texts say the same thing. -->
	<div
		class="sticky top-16 z-10 flex items-center gap-6 border-b-2 border-black bg-white py-4 md:top-28 md:block md:self-start md:border-0 md:py-0"
		aria-hidden="true"
	>
		<svg
			viewBox="0 0 200 200"
			class="h-24 w-24 shrink-0 md:h-auto md:w-full md:max-w-sm"
			fill="none"
			stroke="currentColor"
			stroke-width="6"
		>
			<!-- 1 Research: looking closely at data -->
			<g class={['icon', active === 0 && 'on']}>
				<circle cx="85" cy="85" r="52" />
				<path d="M124 124 182 182" stroke-width="14" />
				<g fill="currentColor" stroke="none">
					<rect x="58" y="92" width="14" height="22" />
					<rect x="78" y="74" width="14" height="40" />
					<rect x="98" y="56" width="14" height="58" />
				</g>
			</g>

			<!-- 2 Educate: one speaks, others listen -->
			<g class={['icon', active === 1 && 'on']}>
				<path d="M10 176H190" />
				<g fill="currentColor" stroke="none">
					<Figure x={52} y={170} scale={1.5} />
					<Figure x={112} y={170} scale={0.7} />
					<Figure x={144} y={170} scale={0.7} />
					<Figure x={176} y={170} scale={0.7} />
				</g>
			</g>

			<!-- 3 Exchange: it goes both ways -->
			<g class={['icon', active === 2 && 'on']} stroke-width="10">
				<path d="M20 70H168M138 40 168 70 138 100" />
				<path d="M180 130H32M62 100 32 130 62 160" />
			</g>

			<!-- 4 Collaborate: two that share a part -->
			<g class={['icon', active === 3 && 'on']}>
				<path d="M70 40 130 100 70 160 10 100Z" />
				<path d="M130 40 190 100 130 160 70 100Z" />
				<path d="M100 70 130 100 100 130 70 100Z" fill="currentColor" />
			</g>

			<!-- 5 Take a position: a paper with a mark on it -->
			<g class={['icon', active === 4 && 'on']}>
				<path d="M44 16H156V184H44Z" />
				<path d="M66 52H134M66 80H134M66 108H112" />
				<rect x="104" y="132" width="30" height="30" fill="currentColor" stroke="none" />
			</g>
		</svg>

		<!-- Counter and progress ticks -->
		<div class="md:mt-8">
			<p class="label mb-3">0{active + 1} / 0{t.items.length}</p>
			<div class="flex gap-1.5">
				{#each t.items as item, i (item.title)}
					<span class={['tick h-1 w-6 md:w-10', i <= active ? 'bg-black' : 'bg-neutral-300']}></span>
				{/each}
			</div>
		</div>
	</div>

	<ol bind:this={list}>
		{#each t.items as item, i (item.title)}
			<li
				data-step={i}
				class={[
					'step flex min-h-[45svh] flex-col justify-center border-black py-10 md:min-h-[50vh]',
					i > 0 && 'border-t-2',
					ready && i !== active && 'dim'
				]}
			>
				<p class="label mb-4">0{i + 1}</p>
				<h3 class="mb-4 text-3xl font-bold md:text-5xl">{item.title}</h3>
				<p class="copy">{item.text}</p>
			</li>
		{/each}
	</ol>
</div>

<style>
	/* All drawings lie on top of each other; only the active one is visible. */
	.icon {
		opacity: 0;
		transform: scale(0.9);
		transform-origin: 100px 100px;
	}

	.icon.on {
		opacity: 1;
		transform: none;
	}

	.step.dim {
		opacity: 0.3;
	}

	/* Only opacity and transform change, so the browser can do it cheaply. */
	@media (prefers-reduced-motion: no-preference) {
		.icon {
			transition:
				opacity 0.25s ease-out,
				transform 0.35s ease-out;
		}

		.step {
			transition: opacity 0.3s ease-out;
		}

		.tick {
			transition: background-color 0.3s ease-out;
		}
	}
</style>
