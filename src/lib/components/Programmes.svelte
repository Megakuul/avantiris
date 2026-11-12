<script lang="ts">
	import type { Messages } from '#lib/i18n/index.ts';
	import { reveal } from '#lib/reveal.ts';
	import Figure from './Figure.svelte';

	let { t }: { t: Messages['programmes'] } = $props();

	// Drawing A: a field of tasks, the filled ones are already done by machines.
	const taken = [2, 5, 6, 11, 14, 15, 19, 23, 24, 28, 33, 37];
	const cells = Array.from({ length: 40 }, (_, i) => ({
		x: 14 + (i % 10) * 18,
		y: 22 + Math.floor(i / 10) * 20,
		filled: taken.includes(i)
	}));

	// Drawing B: one present, several possible futures.
	const futures = [14, 44, 76, 106];
</script>

<!--
	Three cards, each with a small drawing instead of a chart:
	A counts what is, B follows the paths that fork from today,
	C puts the human being in the middle of the eye. C is the only black card.
-->
<div class="grid md:grid-cols-3">
	{#each t.items as item, i (item.title)}
		{@const last = i === t.items.length - 1}
		<article
			use:reveal
			style:--reveal-delay="{i * 120}ms"
			class={[
				'-mt-0.5 flex flex-col border-2 border-black p-6 md:mt-0 md:-ml-0.5 md:p-8',
				last && 'bg-black text-white'
			]}
		>
			<svg viewBox="0 0 200 120" class="mb-8 w-full" fill="none" stroke="currentColor" stroke-width="2">
				{#if i === 0}
					{#each cells as cell, n (cell.x + ':' + cell.y)}
						<rect x={cell.x} y={cell.y} width="10" height="10" />
						{#if cell.filled}
							<rect class="pop" style:--n={n} x={cell.x} y={cell.y} width="10" height="10" fill="currentColor" />
						{/if}
					{/each}
				{:else if i === 1}
					<path class="line" pathLength="1" d="M10 60H60L110 30" />
					<path class="line" pathLength="1" d="M60 60 110 90" />
					{#each futures as y, n (y)}
						<path class="line" pathLength="1" style:--n={12} d="M110 {n < 2 ? 30 : 90}L184 {y}" />
						<rect class="pop" style:--n={26 + n * 3} x="180" y={y - 5} width="10" height="10" fill="currentColor" />
					{/each}
				{:else}
					<!-- Starts in the middle of an edge so the drawn line closes cleanly. -->
					<path class="line" pathLength="1" d="M56 34 100 8 188 60 100 112 12 60Z" stroke-width="6" />
					<g class="pop" style:--n={16} fill="currentColor" stroke="none">
						<Figure x={100} y={98} scale={0.8} />
					</g>
				{/if}
			</svg>

			<h3 class="mb-4 text-2xl font-bold md:text-3xl">{item.title}</h3>
			<p class={['mb-8 font-medium', last ? 'text-neutral-300' : 'text-neutral-600']}>{item.text}</p>

			<p class={['mt-auto text-sm font-medium', last ? 'text-neutral-400' : 'text-neutral-500']}>
				{item.horizon} · {item.method}
			</p>
		</article>
	{/each}
</div>

<style>
	/*
	 * When a card scrolls into view (see reveal.ts) its drawing builds up:
	 * lines are drawn, filled pieces appear one after the other.
	 * `--n` is the place in the queue, one step is 40 ms.
	 */
	@media (prefers-reduced-motion: no-preference) {
		.line {
			stroke-dasharray: 1;
			transition: stroke-dashoffset 0.6s ease-in-out;
		}

		.pop {
			transition: opacity 0.2s ease-out;
		}

		.line,
		.pop {
			transition-delay: calc(var(--reveal-delay, 0ms) + 400ms + var(--n, 0) * 40ms);
		}

		article:global([data-reveal='hidden']) .line {
			stroke-dashoffset: 1;
		}

		article:global([data-reveal='hidden']) .pop {
			opacity: 0;
		}
	}
</style>
