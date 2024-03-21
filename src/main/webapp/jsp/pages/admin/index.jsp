<script>
  const adminRoutes = [
    "/admin/books",
    "/admin/authors",
    "/admin/users",
    "/admin/checkouts",
    "/admin/fines"
  ];

  const currentURL = new URL(location.href);
  if (!(currentURL.pathname in adminRoutes)) {
    location.href = "/admin/books";
  }
</script>