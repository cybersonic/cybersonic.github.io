 (function() {
      var storageKey = 'lucli-theme';
      var root = document.documentElement;
      var toggle = document.getElementById('theme-toggle');

      function applyTheme(theme) {
        if (!theme) return;
        root.setAttribute('data-theme', theme);
        try { localStorage.setItem(storageKey, theme); } catch (e) {}
        if (toggle) {
          toggle.textContent = theme === 'dark' ? '☀️ Light mode' : '🌙 Dark mode';
        }
      }

      var stored = null;
      try { stored = localStorage.getItem(storageKey); } catch (e) {}

      if (stored === 'light' || stored === 'dark') {
        applyTheme(stored);
      } else {
        var prefersDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
        applyTheme(prefersDark ? 'dark' : 'light');
      }

      if (toggle) {
        toggle.addEventListener('click', function() {
          var current = root.getAttribute('data-theme') === 'dark' ? 'dark' : 'light';
          var next = current === 'dark' ? 'light' : 'dark';
          applyTheme(next);
        });
      }
    })();