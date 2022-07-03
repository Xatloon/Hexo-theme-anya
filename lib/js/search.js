document.querySelector(".search-form").addEventListener("submit", function (e) {
  e.preventDefault();
  window.open(
    `https://www.google.com/search?&q=site%3A${
      window.location.host
    }+${encodeURIComponent(
      document.querySelector('.search-form > input[name="keyword"]').val()
    )}`
  );
});
