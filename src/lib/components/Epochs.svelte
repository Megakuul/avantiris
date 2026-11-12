<script lang="ts">
  import { onMount } from "svelte";
  import {
    createTimeline,
    onScroll,
    stagger,
    type AnimationParams,
  } from "animejs";
  import type { Messages } from "#lib/i18n/index.ts";
  import EpochsScene from "./EpochsScene.svelte";

  /*
   * Opening animation: while the visitor scrolls, the picture stays pinned
   * and civilisation changes – field, factory, office, model – until only
   * the human being and an open question are left.
   *
   * The drawing is in EpochsScene.svelte, the texts in the i18n files.
   * This file only says WHEN things move.
   */
  let {
    name,
    slogan,
    t,
  }: { name: string; slogan: string; t: Messages["epochs"] } = $props();

  let root: HTMLElement;
  let finale = $state(false);

  // The timeline runs from 0 to END. Scrolling through the section plays it.
  // Each epoch appears while the one before it sinks, so the picture never
  // stands empty. `height` is how far its pieces start below the horizon.
  const eras = [
    { enter: 300, exit: 1300, height: 140 },
    { enter: 1300, exit: 2300, height: 240 },
    { enter: 2300, exit: 3300, height: 340 },
    { enter: 3300, exit: 4300, height: 90 },
  ];
  // The last scene gets a long stretch of scrolling in which nothing moves away.
  const FINALE = 4300;
  const END = 5600;

  onMount(() => {
    if (window.matchMedia("(prefers-reduced-motion: reduce)").matches) return;

    const timeline = createTimeline({
      defaults: { ease: "inOutCubic" },
      // The lower `sync`, the more softly the picture glides after the scrollbar.
      autoplay: onScroll({
        target: root,
        enter: "top top",
        leave: "bottom bottom",
        sync: 0.2,
      }),
      onUpdate: (self) => (finale = self.currentTime >= FINALE),
    });

    // Adds a step for all elements matching `selector` (and skips it if there are none).
    const step = (selector: string, params: AnimationParams, at: number) => {
      const targets = root.querySelectorAll(selector);
      if (targets.length) timeline.add(targets, params, at);
    };

    // Texts: each one slides in when its scene starts and leaves when the scene ends.
    const showText = (stage: number, at: number) =>
      step(
        `[data-stage="${stage}"]`,
        { opacity: [0, 1], translateY: [24, 0], duration: 300 },
        at + 150,
      );
    const hideText = (stage: number, at: number) =>
      step(
        `[data-stage="${stage}"]`,
        { opacity: [1, 0], translateY: [0, -24], duration: 200 },
        at,
      );

    // An invisible full-length step fixes the length of the timeline.
    step(".sticky", { opacity: [1, 1], duration: END, ease: "linear" }, 0);
    step(".sun-arm", { rotate: [-58, 0], duration: FINALE, ease: "linear" }, 0);
    step(".scroll-hint", { opacity: [1, 0], duration: 150 }, 50);
    hideText(0, 150);

    eras.forEach(({ enter, exit, height }, i) => {
      const era = `.era-${i + 1}`;

      showText(i + 1, enter);
      step(
        `${era} .piece`,
        { translateY: [height, 0], duration: 450, delay: stagger(20) },
        enter,
      );
      step(
        `${era} .draw`,
        { strokeDashoffset: [1, 0], duration: 300, delay: stagger(4) },
        enter + 250,
      );
      step(
        `${era} .fade`,
        { opacity: [0, 1], duration: 150, delay: stagger(8) },
        enter + 350,
      );

      hideText(i + 1, exit - 50);
      step(`${era} .fade`, { opacity: [1, 0], duration: 150 }, exit - 150);
      step(
        `${era} .draw`,
        { strokeDashoffset: [0, 1], duration: 200 },
        exit - 150,
      );
      step(
        `${era} .piece`,
        { translateY: [0, height], duration: 350, delay: stagger(10) },
        exit,
      );
    });

    // Finale: the sun has arrived. The eye around it is drawn by CSS (see
    // EpochsScene) as soon as `finale` turns true.
    showText(eras.length + 1, FINALE);

    return () => timeline.revert();
  });
</script>

<!-- Tall section = scroll distance. Without motion it is just one screen. -->
<section bind:this={root} class="h-[340vh] motion-reduce:h-auto">
  <div class="sticky top-0 h-svh overflow-hidden bg-white">
    <EpochsScene
      {finale}
      class="scene absolute bottom-0 left-1/2 w-full min-w-160 -translate-x-1/2"
    />

    <div class="captions page relative pt-24 md:pt-28">
      <div class="relative">
        <div data-stage="0">
          <h1 class="display text-[12vw] md:text-8xl lg:text-9xl">{name}</h1>
          <p class="subtitle mt-5">{slogan}</p>
        </div>

        {#each t.stages as stage, i (stage.year)}
          <div data-stage={i + 1} class="caption absolute top-0 left-0">
            <p class="label mb-4">
              0{i + 1} / 0{t.stages.length} — {stage.label}
            </p>
            <p class="display text-6xl md:text-8xl lg:text-9xl">{stage.year}</p>
            <p class="subtitle mt-5">{stage.text}</p>
          </div>
        {/each}
      </div>
    </div>

    <p
      class="scroll-hint label absolute right-5 bottom-6 md:right-10 motion-reduce:hidden"
    >
      {t.scroll} ↓
    </p>
  </div>
</section>

<style>
  /*
	 * The scene spans the screen width. On phones it keeps a minimum width
	 * (min-w-160, the sides are cropped), on very wide screens it stops
	 * growing so the sky is not pushed out of view.
	 */
  section :global(.scene) {
    max-width: 170svh;
  }

  /*
	 * Phones held sideways: there is no room to stack text above the picture,
	 * so the picture moves to the right half and the text stays small on the left.
	 */
  @media (orientation: landscape) and (max-height: 520px) {
    section :global(.scene) {
      right: 0;
      left: auto;
      min-width: 0;
      max-width: 110svh;
      translate: none;
    }

    .captions {
      max-width: 50%;
      margin-left: 0;
      padding-top: 5.5rem;
    }

    .captions :global(.display) {
      font-size: 2.5rem;
    }

    .captions :global(.subtitle) {
      margin-top: 0.5rem;
      font-size: 1rem;
    }
  }

  /* Starting state; the timeline takes over from here. */
  .caption {
    opacity: 0;
  }
</style>
