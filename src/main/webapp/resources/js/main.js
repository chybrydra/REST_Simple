// The root URL for the RESTful services
var rootURL = "http://localhost:8080/rest";

// Retrieve car list when application starts
showHome();

function showHome(){
    var homeInfo = "<h1>Welcome to Admin panel!</h1>";
    $("#pageContent").html(homeInfo);
}

$("#home-option").click(function () {
    showHome();
});

$("#cars-option").click(function () {
    findAll();
});

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

    $('#pageContent').html("");
    $.each(list, function(index, car) {
        $('#pageContent').append("<ul>");
        $('#pageContent').append("<li>" + car.id + ". " + car.brand + " " + car.model + "(" + car.productionYear + ")</li>") ;
        $('#pageContent').append("</ul>");
    });
}

