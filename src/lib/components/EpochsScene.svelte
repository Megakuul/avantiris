<script lang="ts">
	/*
	 * The drawing for the opening animation – no logic, only shapes.
	 *
	 * Canvas: 1200 × 800, the horizon is at y = 620.
	 * Landscape (hatched) stays, civilisation (solid black) changes.
	 *
	 * Classes that Epochs.svelte animates:
	 *   .era-1 … .era-4   one group per epoch
	 *   .piece            rises from behind the horizon
	 *   .fade             fades in (smoke, network nodes)
	 *   .draw             line that is drawn (network links)
	 *   .sun-arm          rotates the sun across the sky
	 *   .eye              the rhombus that closes around the sun at the end (CSS, see below)
	 */
	import Figure from './Figure.svelte';

	// `finale` is true once the last scene is reached: the eye draws itself.
	let { finale = false, class: className = '' }: { finale?: boolean; class?: string } = $props();

	const HORIZON = 620;

	// Fir trees of the village: [x, height]
	const firs = [
		[470, 70],
		[500, 48],
		[820, 82],
		[850, 54],
		[1010, 60]
	];

	// Office towers: [x, width, floors]. One floor is 16 high, one window column 14 wide.
	const FLOOR = 16;
	const towers = [
		[434, 56, 12],
		[504, 84, 18],
		[602, 56, 9],
		[672, 84, 20],
		[770, 70, 14],
		[854, 56, 16],
		[924, 84, 11],
		[1022, 56, 7],
		[1092, 70, 13]
	];

	// Data centres: [x, width, height]
	const halls = [
		[420, 270, 50],
		[710, 290, 64],
		[1020, 140, 40]
	];

	// The model: layers of a small neural network, every node linked to the next layer.
	const layers = [
		{ x: 560, ys: [400, 455, 510] },
		{ x: 680, ys: [372, 427, 482, 537] },
		{ x: 800, ys: [372, 427, 482, 537] },
		{ x: 920, ys: [400, 455, 510] }
	];
	const nodes = layers.flatMap((layer) => layer.ys.map((y) => ({ x: layer.x, y })));
	const links = layers.slice(0, -1).flatMap((layer, i) =>
		layer.ys.flatMap((y1) =>
			layers[i + 1].ys.map((y2) => ({ x1: layer.x, y1, x2: layers[i + 1].x, y2 }))
		)
	);
</script>

<svg viewBox="0 0 1200 800" class={[className, { finale }]} aria-hidden="true">
	<defs>
		<pattern id="hatch" width="7" height="7" patternUnits="userSpaceOnUse" patternTransform="rotate(35)">
			<line y2="7" stroke="black" stroke-width="1.4" />
		</pattern>
		<pattern id="windows" width="14" height="16" y="12" patternUnits="userSpaceOnUse">
			<rect x="4" y="4" width="6" height="8" fill="white" />
		</pattern>
		<!-- Everything that rises or sinks is cut off at the horizon. -->
		<clipPath id="above-horizon">
			<rect x="-2000" y="-1000" width="5200" height={1000 + HORIZON} />
		</clipPath>
	</defs>

	<!-- Sun: sits on an arm that turns around a point far below the horizon. -->
	<g class="sun-arm">
		<circle cx="706" cy="270" r="32" />
	</g>

	<!-- Mountains: outline, with the shadow side hatched. -->
	<g class="mountains">
		<polygon points="300,620 520,330 790,620" />
		<polygon points="520,330 790,620 570,620" class="shade" />
		<polygon points="900,620 1080,360 1290,620" />
		<polygon points="1080,360 1290,620 1120,620" class="shade" />
		<polygon points="40,620 210,410 400,620" />
		<polygon points="210,410 400,620 240,620" class="shade" />
		<polygon points="660,620 840,400 1040,620" />
		<polygon points="840,400 1040,620 880,620" class="shade" />
	</g>

	<!-- The eye that closes around the sun in the last scene (= the logo). -->
	<path class="eye" d="M631 232.5 690 195 808 270 690 345 572 270Z" pathLength="1" />

	<g clip-path="url(#above-horizon)">
		<!-- 1 · Field: a village -->
		<g class="era-1 solid">
			<polygon class="piece" points="560,620 560,575 546,575 610,528 674,575 660,575 660,620" />
			<polygon class="piece" points="700,620 700,588 740,560 780,588 780,620" />
			<polygon class="piece" points="900,620 900,540 912,496 924,540 924,590 975,590 975,620" />
			{#each firs as [x, height] (x)}
				<polygon class="piece" points="{x - 15},620 {x},{HORIZON - height} {x + 15},620" />
			{/each}
		</g>

		<!-- 2 · Factory: sawtooth roofs, chimneys, workers' houses -->
		<g class="era-2 solid">
			<polygon class="piece" points="420,620 426,470 442,470 448,620" />
			<polygon
				class="piece"
				points="470,620 470,545 530,505 530,545 590,505 590,545 650,505 650,545 710,505 710,545 770,505 770,545 800,545 800,620"
			/>
			<polygon class="piece" points="830,620 837,400 857,400 864,620" />
			<polygon class="piece" points="890,620 896,440 912,440 918,620" />
			<polygon
				class="piece"
				points="950,620 950,588 975,566 1000,588 1025,566 1050,588 1075,566 1100,588 1100,620"
			/>
			<polygon class="fade" points="850,385 930,385 950,360 870,360" />
			<polygon class="fade" points="900,345 1000,345 1020,320 920,320" />
			<polygon class="fade" points="960,305 1080,305 1100,280 980,280" />
		</g>

		<!-- 3 · Office: a skyline -->
		<g class="era-3">
			{#each towers as [x, width, floors] (x)}
				{@const height = floors * FLOOR}
				<g class="piece">
					<rect class="solid" {x} y={HORIZON - height} {width} {height} />
					<rect {x} y={HORIZON - height} {width} {height} fill="url(#windows)" />
				</g>
			{/each}
		</g>

		<!-- 4 · Model: windowless data centres and the network above them -->
		<g class="era-4">
			{#each halls as [x, width, height] (x)}
				<g class="piece">
					<rect class="solid" {x} y={HORIZON - height} {width} {height} />
					<rect class="solid" x={x + 20} y={HORIZON - height - 10} width="36" height="10" />
					<rect class="solid" x={x + 70} y={HORIZON - height - 10} width="36" height="10" />
					<line class="stripe" x1={x} x2={x + width} y1={HORIZON - height + 12} y2={HORIZON - height + 12} />
				</g>
			{/each}
			{#each links as link, i (i)}
				<line class="draw" {...link} pathLength="1" />
			{/each}
			{#each nodes as node, i (i)}
				<rect class="fade" x={node.x - 6} y={node.y - 6} width="12" height="12" />
			{/each}
		</g>
	</g>

	<!-- Ground -->
	<g class="ground">
		<line x1="-2000" x2="3200" y1="620" y2="620" stroke-width="3" />
		<line x1="-2000" x2="3200" y1="634" y2="634" />
		<line x1="-2000" x2="3200" y1="654" y2="654" />
		<line x1="-2000" x2="3200" y1="684" y2="684" />
		<line x1="-2000" x2="3200" y1="728" y2="728" />
	</g>

	<!-- The human being: always there, always the same size, with a long shadow. -->
	<polygon class="shadow" points="300,620 480,684 420,684" />
	<g class="solid">
		<Figure x={300} y={620} />
	</g>
</svg>

<style>
	svg {
		overflow: visible;
		fill: black;
	}

	.mountains polygon {
		fill: white;
		stroke: black;
		stroke-width: 2;
	}

	.mountains .shade,
	.shadow {
		fill: url(#hatch);
	}

	.ground line,
	.draw {
		stroke: black;
		stroke-width: 1.5;
	}

	/* Black shapes get a thin white edge so they stay readable in front of each other. */
	.solid :global(:is(polygon, circle)),
	rect.solid {
		stroke: white;
		stroke-width: 3;
		paint-order: stroke;
	}

	.stripe {
		stroke: white;
		stroke-width: 2;
	}

	.eye {
		fill: none;
		stroke: black;
		stroke-width: 16;
	}

	/*
	 * Starting positions. They are set here (not in JavaScript) so that the
	 * very first paint already shows the empty landscape.
	 */
	.sun-arm {
		transform-origin: 706px 890px;
		transform: rotate(-58deg);
	}

	.piece {
		transform: translateY(400px);
	}

	.fade {
		opacity: 0;
	}

	.draw,
	.eye {
		stroke-dasharray: 1;
		stroke-dashoffset: 1;
	}

	/* The eye is not tied to the scrollbar: once the last scene is reached it
	   draws itself in its own time, so it cannot be scrolled past unseen. */
	.eye {
		transition: stroke-dashoffset 0.4s ease-in;
	}

	.finale .eye {
		stroke-dashoffset: 0;
		transition: stroke-dashoffset 1.4s ease-in-out;
	}
</style>
