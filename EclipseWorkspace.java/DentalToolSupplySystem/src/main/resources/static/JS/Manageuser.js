document.addEventListener("DOMContentLoaded", function () {
  const searchInput = document.getElementById("searchInput");
  const tableBody = document.getElementById("userTableBody");

  searchInput.addEventListener("input", function () {
    const keyword = searchInput.value.trim();

    fetch(`/admin/api/users?keyword=${encodeURIComponent(keyword)}`)
      .then(response => response.json())
      .then(users => {
        tableBody.innerHTML = "";

        users.forEach(user => {
          const row = document.createElement("tr");
          row.innerHTML = `<td>${user.name}</td><td>${user.email}</td>`;
          tableBody.appendChild(row);
        });

        if (users.length === 0) {
          tableBody.innerHTML = `<tr><td colspan="2">No users found</td></tr>`;
        }
      })
      .catch(error => {
        console.error("Error fetching users:", error);
      });
  });
});
