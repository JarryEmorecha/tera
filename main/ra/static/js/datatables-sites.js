window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSites = document.getElementById('datatablesSites');
    if (datatablesSites) {
        new simpleDatatables.DataTable(datatablesSites);
    }
});
