let main_section = document.getElementById("main");

// profile

//get value from local storage
const uniqueID = JSON.parse(localStorage.getItem("uniqueID"));
const user_cred = JSON.parse(localStorage.getItem("user_cred"));
function profile_data(e) {
    return e.email === uniqueID;
}
const person_data = user_cred.find(profile_data);
document.getElementById("first_name").innerText = person_data.first_name;
document.getElementById("last_name").innerText = person_data.last_name;
document.getElementById("email").innerText = person_data.email;
document.getElementById("phone").innerText = person_data.Phone;

// edit profile

document.getElementById("first_name").value = person_data.first_name;
document.getElementById("last_name").value = person_data.last_name;
document.getElementById("email").value = person_data.email;
document.getElementById("phone").value = person_data.Phone;

function update(e) {
    e.preventDefault();

    const uniqueID = JSON.parse(localStorage.getItem("uniqueID"));
    const user_cred = JSON.parse(localStorage.getItem("user_cred"));

    function profile_data(a) {
        return a.email === uniqueID;
    }
    const person_data = user_cred.find(profile_data);

    const first_name = document.getElementById("first_name").value;
    const last_name = document.getElementById("last_name").value;
    const phone = document.getElementById("phone").value;
    const email = document.getElementById("email").value;

    person_data.first_name = first_name;
    person_data.last_name = last_name;
    person_data.address = address;
    person_data.phone = phone;
    person_data.email = email;

    localStorage.setItem("user_cred", JSON.stringify(user_cred));
    window.location.href = "./profile.html";
}

function del(e) {
    e.preventDefault();

    if (window.confirm("Are you sure?")) {
        const uniqueID = JSON.parse(localStorage.getItem("uniqueID"));
        const user_cred = JSON.parse(localStorage.getItem("user_cred"));


        function profile_data(a) {
            return a.email === uniqueID;
        }

        const person_data = user_cred.find(profile_data);

        const indexOfUser = user_cred.indexOf(person_data);
        user_cred.splice(indexOfUser, 1);

        localStorage.removeItem("uniqueID");

        localStorage.setItem("user_cred", JSON.stringify(user_cred));
        window.location.href = "../../index.html";
    }
}

function logOut() {
    localStorage.removeItem("uniqueID");
    window.location.href = "../Log in and Sign up/Log in.html";
}

let user_address = JSON.parse(localStorage.getItem("user_address"));
let user_id = JSON.parse(localStorage.getItem("uniqueID"));
const current_user_address = user_address.filter((e) => e.user_id === user_id);

const default_address = current_user_address.find((e) => e.default === true);


const add_div = document.createElement("div");
add_div.setAttribute("class", "address");

const add_head = document.createElement("div");
add_head.setAttribute("class", "address_head");
add_div.appendChild(add_head);

if (default_address.default === true) {

    const add_title_div = document.createElement("div");
    add_head.appendChild(add_title_div);

    const add_title = document.createElement("h2");
    add_title.innerText = default_address.title.toUpperCase();
    add_title_div.appendChild(add_title);

    const add_default_text = document.createElement("p");
    add_default_text.innerText = "(default)";
    add_title_div.appendChild(add_default_text);

}

else {
    const add_title = document.createElement("h2");
    add_title.innerText = default_address.title.toUpperCase();
    add_head.appendChild(add_title);

}

const add_edit = document.createElement("button");
add_edit.setAttribute("data-id", default_address.address_uuid);
add_edit.setAttribute("class", "edit_btn");
add_edit.innerText = "EDIT";
add_head.appendChild(add_edit);

const add_body = document.createElement("div");
add_body.setAttribute("class", "address_body");
add_div.appendChild(add_body);

const user_name = document.createElement("p");
add_body.appendChild(user_name);

const user_name_b = document.createElement("b");
user_name_b.innerText = default_address.first_name + " " + default_address.last_name;
user_name.appendChild(user_name_b);

const house_info = document.createElement("p");
house_info.innerText = default_address.house_no;

add_body.appendChild(house_info);

const area = document.createElement("p");
area.innerText = default_address.area;
add_body.appendChild(area);

const city = document.createElement("p");
city.innerText = default_address.city + " " + default_address.pincode;
add_body.appendChild(city);

const add_buttons = document.createElement("div");
add_buttons.setAttribute("class", "address_buttons");
add_div.appendChild(add_buttons);

const add_delete = document.createElement("button");
add_delete.setAttribute("data-id", default_address.address_uuid);
add_delete.setAttribute("class", "delete_btn");
add_delete.innerText = "DELETE";
add_buttons.appendChild(add_delete);

if (default_address.default === false) {

    const add_default = document.createElement("button");
    add_default.setAttribute("data-id", default_address.address_uuid);
    add_default.setAttribute("class", "btn_default");
    add_default.innerText = "SET AS DEFAULT";
    add_buttons.appendChild(add_default);
}

main_section.appendChild(add_div);
