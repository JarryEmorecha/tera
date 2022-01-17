window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesDissertations = document.getElementById('datatablesDissertations');
    if (datatablesDissertations) {
        new simpleDatatables.DataTable(datatablesDissertations);
    }
});
