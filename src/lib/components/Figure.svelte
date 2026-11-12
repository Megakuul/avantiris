<svelte:options namespace="svg" />

<script lang="ts">
	// The human figure used in the opening scene and in programme C:
	// a head above a body that tapers to a point – half of the logo's
	// rhombus with its pupil. 90 units tall, standing at (x, y).
	let { x, y, scale = 1 }: { x: number; y: number; scale?: number } = $props();
</script>

<g transform="translate({x} {y}) scale({scale})">
	<circle cx="0" cy="-80" r="10" />
	<polygon points="-17,-64 17,-64 0,0" />
</g>
