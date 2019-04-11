// The root URL for the RESTful services
var rootURL = "http://localhost:8080/rest";

// Retrieve car list when application starts
findAll();

function findAll() {
    console.log('findAll');
    $.ajax({
        type: 'GET',
        url: rootURL + "/cars",
        dataType: "json", // data type of response
        success: renderList
    });
}

function renderList(data) {
    // JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
    var list = data == null ? [] : (data instanceof Array ? data : [data]);

    $('#carList li').remove();
    $.each(list, function(index, car) {
        $('#carList').append("<ul>");
        $('#carList').append("<li>" + car.id + ". " + car.brand + " " + car.model + "</li>") ;
        $('#carList').append("</ul>");
    });
}

