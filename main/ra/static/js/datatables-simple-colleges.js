window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesColleges = document.getElementById('datatablesColleges');
    if (datatablesColleges) {
        new simpleDatatables.DataTable(datatablesColleges);
    }
});
