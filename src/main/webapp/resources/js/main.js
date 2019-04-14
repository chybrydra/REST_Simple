// The root URL for the RESTful services
var rootURL = "http://localhost:8080/rest";

// Retrieve car list when application starts
showHome();

function showHome(){
    var homeInfo = "<h1>Welcome to Admin panel!</h1>";
    $("#pageContent").html(homeInfo);
}

function changeActiveOption(newActive) {
    $("#users-option").removeClass("active");
    $("#home-option").removeClass("active");
    $("#cars-option").removeClass("active");
    $("#add-car-option").removeClass("active");
    $(newActive).addClass("active");
}

$("#home-option").click(function() {
    changeActiveOption("#home-option");
    showHome();
});

$("#cars-option").click(function() {
    changeActiveOption("#cars-option");
    listAllCars();
});

$("#users-option").click(function() {
    changeActiveOption("#users-option");
    listAllUsers();
});

$("#add-car-option").click(function() {
    changeActiveOption("#add-car-option");
    loadAddCarForm();
});

function listAllCars() {
    console.log('listAllCars was invoked');
    $.ajax({
        type: 'GET',
        url: rootURL + "/cars",
        dataType: "json", // data type of response
        success: renderCarList
    });
}

function listAllUsers() {
    console.log('listAllUsers was invoked');
    $.ajax({
        type: 'GET',
        url: rootURL + "/users",
        dataType: "json", // data type of response
        success: renderUserList
    });
}

function renderCarList(data) {
    // JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
    var carList = data == null ? [] : (data instanceof Array ? data : [data]);
    $('#pageContent').html("");

    var newContent = "<table class=\"table table-dark\">";
    newContent += "<tr>";
    newContent += "<th>id</th>";
    newContent += "<th>brand</th>";
    newContent += "<th>model</th>";
    newContent += "<th>prod. year</th>";
    newContent += "<th>reg. plate</th>";
    newContent += "</tr>";
    $.each(carList, function(index, car) {
        newContent += "<tr>";
        newContent += "<th>" + car.id + "</th>";
        newContent += "<th>" + car.brand + "</th>";
        newContent += "<th>" + car.model + "</th>";
        newContent += "<th>" + car.productionYear + "</th>";
        newContent += "<th>" + car.regPlate + "</th>";
        newContent += "</tr>";
    });
    newContent += "</table>";

    $("#pageContent").append(newContent);
}

function renderUserList(data) {
    var userList = data == null ? [] : (data instanceof Array ? data : [data]);

    $('#pageContent').html("");

    var newContent = "<table class=\"table table-dark\">";
    newContent += "<tr>";
    newContent += "<th scope='col'>id</th>";
    newContent += "<th scope='col'>email</th>";
    newContent += "<th scope='col'>firstname</th>";
    newContent += "<th scope='col'>lastname</th>";
    newContent += "<th scope='col'>password</th>";
    newContent += "</tr>";
    $.each(userList, function(index, user) {
        newContent += "<tr>";
        newContent += "<th scope='row'>" + user.id + "</th>";
        newContent += "<th>" + user.email + "</th>";
        newContent += "<th>" + user.firstname + "</th>";
        newContent += "<th>" + user.lastname + "</th>";
        newContent += "<th>" + user.password + "</th>";
        newContent += "</tr>";
    });
    newContent += "</table>";

    $("#pageContent").append(newContent);
}

function loadAddCarForm() {
    console.log('loadAddCarForm function was invoked');
    $.ajax({
        type: 'GET',
        url: rootURL + "/add-car",
        dataType: "html", // data type of response
        success: renderAddCarForm
    });
}

function renderAddCarForm(response) {
    $('#pageContent').html("");
    $("#pageContent").append(response).html();
}