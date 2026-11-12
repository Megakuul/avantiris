/*
 * use:reveal – the element fades in and rises a little when it scrolls into view.
 *
 * The look of it is in app.css ([data-reveal]). Nothing is hidden unless this
 * code runs, so the page stays complete without JavaScript, and visitors who
 * prefer reduced motion simply see everything in place.
 */
export function reveal(node: HTMLElement | SVGElement) {
	if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;
	// Already on screen when the page loads: leave it alone, no flicker.
	if (node.getBoundingClientRect().top < window.innerHeight) return;

	node.dataset.reveal = 'hidden';

	const observer = new IntersectionObserver(
		([entry]) => {
			if (!entry.isIntersecting) return;
			node.dataset.reveal = 'shown';
			observer.disconnect();
		},
		// Start a little after the element's top edge has entered the screen.
		{ rootMargin: '0px 0px -10% 0px' }
	);
	observer.observe(node);

	return { destroy: () => observer.disconnect() };
}
