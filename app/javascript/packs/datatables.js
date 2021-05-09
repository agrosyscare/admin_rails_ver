document.addEventListener("turbolinks:load", function() {
  $('#dttb').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#dttb').data('source')
    },
    "pagingType": "full_numbers",
    "columns": [
      {"data": "id"},
      {"data": "name"},
      {"data": "description"}
    ]
  });
});