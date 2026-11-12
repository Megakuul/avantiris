<script lang="ts">
	// The Avantiris mark: an eye built from a sharp rhombus, looking ahead.
	// Colour follows the surrounding text colour, size comes from `class`.
	let { animated = false, class: className = '' }: { animated?: boolean; class?: string } =
		$props();
</script>

<svg viewBox="0 0 48 32" fill="none" aria-hidden="true" class={[className, { animated }]}>
	<!-- The path starts in the middle of an edge so the drawn line closes cleanly. -->
	<path
		class="frame"
		d="M13.5 9.5 24 3 45 16 24 29 3 16Z"
		pathLength="1"
		stroke="currentColor"
		stroke-width="3"
	/>
	<circle class="pupil" cx="27" cy="16" r="6" fill="currentColor" />
</svg>

<style>
	.pupil {
		transform-box: fill-box;
		transform-origin: center;
	}

	@media (prefers-reduced-motion: no-preference) {
		.animated .frame {
			stroke-dasharray: 1;
			animation: draw 0.9s ease-out both;
		}

		.animated .pupil {
			animation: look 1.5s 0.5s ease-in-out both;
		}
	}

	/* The outline is drawn … */
	@keyframes draw {
		from {
			stroke-dashoffset: 1;
		}
		to {
			stroke-dashoffset: 0;
		}
	}

	/* … then the pupil opens in the centre and turns to look ahead. */
	@keyframes look {
		0% {
			transform: translateX(-3px) scale(0);
		}
		45% {
			transform: translateX(-3px) scale(1);
		}
		100% {
			transform: translateX(0) scale(1);
		}
	}
</style>
