// Mobile navigation toggle. The menu is visible by default; this only
// collapses it on small screens once JS is available.
const toggle = document.querySelector('.nav-toggle');
const menu = document.getElementById('site-menu');

if (toggle && menu) {
  document.documentElement.classList.add('js');

  toggle.addEventListener('click', () => {
    const open = toggle.getAttribute('aria-expanded') === 'true';
    toggle.setAttribute('aria-expanded', String(!open));
    menu.classList.toggle('is-open', !open);
  });

  document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape' && menu.classList.contains('is-open')) {
      toggle.setAttribute('aria-expanded', 'false');
      menu.classList.remove('is-open');
      toggle.focus();
    }
  });
}
