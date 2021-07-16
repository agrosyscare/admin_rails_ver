$.extend( $.fn.dataTable.defaults, {
  responsive: true,
  pagingType: 'full_numbers',
  language: {
    decimal: "",
    emptyTable: "No hay datos disponibles",
    info: "Mostrando desde _START_ hasta _END_ de _TOTAL_ registros",
    infoEmpty: "Mostrando desde 0 hasta 0 de 0 registros",
    infoFiltered: "(filtrado de _MAX_ registros en total)",
    infoPostFix: "",
    thousands: ".",
    lengthMenu: "Mostrar _MENU_ registros",
    loadingRecords: "Cargando...",
    processing: "Procesando...",
    search: "Buscar:",
    zeroRecords: "No se encontraron resultados",
    paginate: {
      first: "Primero",
      last: "Último",
      next: "Siguiente",
      previous: "Anterior"
    },
    aria: {
      sortAscending: ": activar para Ordenar Ascendentemente",
      sortDescending: ": activar para Ordendar Descendentemente"
    },
    select: {
      rows: {
          _: "%d filas seleccionadas",
          0: "",
          1: "1 fila seleccionada"
      }
    }
  },
  dom:
    "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
    "<'row'<'col-sm-12'tr>>" +
    "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
});
