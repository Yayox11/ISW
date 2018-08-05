$(document).ready(function() {
    $('#example').DataTable( {
        "language": {
            "lengthMenu": "Mostrar _MENU_ entradas por pagina",
            "zeroRecords": "No se ha encontrado nada",
            "info": "Mostrando página _PAGE_ de _PAGES_",
            "infoEmpty": "Sin registros",
            "infoFiltered": "(Fitrado de _MAX_ registros totales)",
            "loadingRecords": "Cargando...",
            "processing":     "Procesando...",
            "search":         "Buscar:",
            "paginate": {
                "first":      "Primero",
                "last":       "Ultimo",
                "next":       "Siguiente",
                "previous":   "Anterior"
            },
            "aria": {
                "sortAscending":  ": activar para ordenar columna ascendentemente",
                "sortDescending": ": activar para ordenar columna descendentemente"
            }
        }
    } );
} );
