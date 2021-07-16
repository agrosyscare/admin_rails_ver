document.addEventListener("turbolinks:load", function() {

  $("#greenhouses-dttb").DataTable({
    processing: true,
    serverSide: true,
    order: [[0, "asc"]],
    ajax: {
      url: $("#greenhouses-dttb").data("source"),
      type: "POST",
    }
  });

  $("#floors-dttb").DataTable({
    processing: true,
    serverSide: true,
    order: [[0, "asc"]],
    ajax: {
      url: $("#floors-dttb").data("source"),
      type: "POST",
    },
  });

  $("#arduinos-dttb").DataTable({
    processing: true,
    serverSide: true,
    order: [[0, "asc"]],
    ajax: {
      url: $("#arduinos-dttb").data("source"),
      type: "POST",
    },
  });

  $("#users-dttb").DataTable({
    processing: true,
    serverSide: true,
    order: [[0, "asc"]],
    ajax: {
      url: $("#users-dttb").data("source"),
      type: "POST",
    },
  });

  $("#deleted-items-dttb").DataTable({
    processing: true,
    serverSide: true,
    order: [[0, "asc"]],
    ajax: {
      url: $("#deleted-items-dttb").data("source"),
      type: "POST",
    },
  });
});
