// product detail

const params = window.location.search;

const urlParams = new URLSearchParams(params);

const product = urlParams.get("product_id");

const prod_details = JSON.parse(localStorage.getItem("prod_detail"));

function findProduct(e) {
    return e.product_id === product;
}

let prod_data = prod_details.find(findProduct);

const price_list = [];

let size = 0;

let cake_type = "Egg";

// creating elements

const find_default_price = prod_data.price_details.find((e) => e.size === 0);
const find_second_price = prod_data.price_details.find((e) => e.size === 1);
const find_third_price = prod_data.price_details.find((e) => e.size === 2);

const whole = document.createElement("div");
whole.setAttribute("class", "whole");

const main = document.createElement("section");
main.setAttribute("class", "main");
whole.append(main);

const main_img = document.createElement("div");
main_img.setAttribute("class", "main_img");
main.append(main_img);

const prod_img = document.createElement("img");
prod_img.setAttribute("src", prod_data.image.src);
prod_img.setAttribute("alt", prod_data.image.alt);
main_img.append(prod_img);

const side = document.createElement("section");
side.setAttribute("class", "side");
whole.append(side);

const side_para = document.createElement("div");
side_para.setAttribute("class", "side_para");
side.append(side_para);

const side_h1 = document.createElement("h1");
if (prod_data.category === "Cakes") {
    side_h1.innerText = prod_data.name + "(1/2kg)";
}
else {
    side_h1.innerText = prod_data.name;
}
side_para.append(side_h1);

const side_p = document.createElement("p");
side_p.innerText = prod_data.description;
side_para.append(side_p);

const price1 = document.createElement("div");
price1.setAttribute("class", "price1");
side_para.append(price1);

let price_p = document.createElement("p");
price_p.innerText = `₹${find_default_price.price}`;
price1.append(price_p);

// start

if (prod_data.category === "Cakes") {

    const type = document.createElement("div");
    type.setAttribute("id", "type");
    side.append(type);

    const type_select = document.createElement("select");
    type_select.setAttribute("id", "cake_t");
    type.append(type_select);

    const option_1 = document.createElement("option");
    option_1.innerText = "Egg";
    type_select.append(option_1);

    const option_2 = document.createElement("option");
    option_2.innerText = "Eggless";
    type_select.append(option_2);

    const spec = document.createElement("div");
    spec.setAttribute("class", "spec");
    side.append(spec);

    const spec_h2 = document.createElement("h2");
    spec_h2.innerText = "WEIGHT";
    spec.append(spec_h2);

    const spec_button = document.createElement("div");
    spec_button.setAttribute("class", "spec-buttons");
    spec.append(spec_button);

    const w_btn1 = document.createElement("button");
    w_btn1.setAttribute("class", "weights");
    w_btn1.setAttribute("onclick", "half_kg()");
    w_btn1.setAttribute("id", "0");
    w_btn1.innerText = "1/2Kg";
    spec_button.append(w_btn1);

    const w_btn2 = document.createElement("button");
    w_btn2.setAttribute("class", "weights");
    w_btn2.setAttribute("onclick", "one_kg()");
    w_btn2.setAttribute("id", "1");
    w_btn2.innerText = "1Kg";
    spec_button.append(w_btn2);

    const w_btn3 = document.createElement("button");
    w_btn3.setAttribute("class", "weights");
    w_btn3.setAttribute("onclick", "two_kg()");
    w_btn3.setAttribute("id", "2");
    w_btn3.innerText = "2Kg";
    spec_button.append(w_btn3);

    const tarea_div = document.createElement("div");
    tarea_div.setAttribute("class", "tarea");
    side.append(tarea_div);

    const tarea = document.createElement("textarea");
    tarea.setAttribute("placeholder", "Enter special message here");
    tarea.setAttribute("id", "tarea");
    tarea.setAttribute("rows", "4");
    tarea.setAttribute("cols", "30");
    tarea_div.append(tarea);

    function half_kg() {
        document.querySelector(".price1").innerHTML = "";

        price_p = document.createElement("p");
        price_p.innerText = `₹${find_default_price.price}`;
        price1.append(price_p);

        side_h1.innerHTML = "";
        side_h1.innerText = prod_data.name + "(1/2kg)"

        const container = document.getElementById("0");

        const test = container.dataset.size;

        const get_price = prod_data.price_details.find((e) => e.size === 0);

        if (price_list.length > 0) {
            const remove = price_list.shift();

            price_list.push(get_price);
        } else {
            price_list.push(get_price);
        }

        size = 0;
    }

    function one_kg() {
        document.querySelector(".price1").innerHTML = "";

        price_p = document.createElement("p");
        price_p.innerText = `₹${find_second_price.price}`;
        price1.append(price_p);

        side_h1.innerHTML = "";
        side_h1.innerText = prod_data.name + "(1kg)"

        const container = document.getElementById("1");

        const test = container.dataset.size;

        const get_price = prod_data.price_details.find((e) => e.size === 1);

        if (price_list.length > 0) {
            const remove = price_list.shift();

            price_list.push(get_price);
        } else {
            price_list.push(get_price);
        }

        size = 1;
    }

    function two_kg() {
        document.querySelector(".price1").innerHTML = "";

        price_p = document.createElement("p");
        price_p.innerText = `₹${find_third_price.price}`;
        price1.append(price_p);

        side_h1.innerHTML = "";
        side_h1.innerText = prod_data.name + "(2kg)"

        const container = document.getElementById("2");

        const test = container.dataset.size;

        const get_price = prod_data.price_details.find((e) => e.size === 2);

        if (price_list.length > 0) {
            const remove = price_list.shift();

            price_list.push(get_price);
        } else {
            price_list.push(get_price);
        }

        size = 2;
    }

    type_select.addEventListener("change", get_cake_type);

    function get_cake_type() {
        cake_type = type_select.value;
    }

}

// end

const btns = document.createElement("div");
btns.setAttribute("class", "buttons");
side.append(btns);

const btns_add = document.createElement("div");
btns_add.setAttribute("class", "add");
btns_add.setAttribute("data-id", prod_data.product_id);
btns.append(btns_add);

const add_btn = document.createElement("button");
add_btn.setAttribute("id", "add");
add_btn.innerText = "Add to cart";
btns_add.append(add_btn);

document.querySelector("div.whole").append(main);
document.querySelector("div.whole").append(side);

const add_item = document.querySelector(".add");

add_item.addEventListener("click", function (e) {
    const params = window.location.search;
    const urlParams = new URLSearchParams(params);

    const product = urlParams.get("product_id");

    const prod_unique_id = this.dataset.id;

    localStorage.setItem("prod_unique_id", JSON.stringify(prod_unique_id));

    const unique_id = JSON.parse(localStorage.getItem("prod_unique_id"));

    const prod_list = JSON.parse(localStorage.getItem("prod_detail"));

    function findProduct(e) {
        return e.product_id === product;
    }

    prod_data = prod_list.find(findProduct);

    const prod_size = size;

    const product_size = JSON.parse(localStorage.getItem("prod_size"));

    if (prod_data.category === "Cakes") {
        localStorage.setItem("prod_size", JSON.stringify(prod_size));
    }

    const prod_price = price_p.innerText.substr(1);

    let cart = JSON.parse(localStorage.getItem("add_to_cart"));
    const user_id = JSON.parse(localStorage.getItem("uniqueID"));

    if (user_id === null) {
        alert("Please login");
    } else if (cart === null) {
        if (prod_data.category === "Cakes") {
            let spl_msg = document.getElementById("tarea").value;
            cart = [
                {
                    product_cart_id: uuidv4(),
                    product_name: prod_data.name,
                    user_id,
                    image: prod_data.image.src,
                    product_description: prod_data.product_description,
                    special_message: spl_msg,
                    size,
                    cake_type,
                    product_id: prod_unique_id,
                    quantity: 1,
                    price: prod_price,
                    category: prod_data.category,
                },
            ];

            localStorage.setItem("add_to_cart", JSON.stringify(cart));

            window.alert("Product has been added to cart");

        } else {
            cart = [
                {
                    product_cart_id: uuidv4(),
                    product_name: prod_data.name,
                    user_id,
                    image: prod_data.image.src,
                    product_description: prod_data.product_description,
                    size: 0,
                    product_id: prod_unique_id,
                    quantity: 1,
                    price: prod_price,
                    category: prod_data.category,
                },
            ];

            localStorage.setItem("add_to_cart", JSON.stringify(cart));

            window.alert("Product has been added to cart");
        }
    } else {
        const cart = JSON.parse(localStorage.getItem("add_to_cart"));
        let logic = false;

        if (prod_data.category === "Cakes") {

            let spl_msg = document.getElementById("tarea").value;
            cart.push({
                product_cart_id: uuidv4(),
                product_name: prod_data.name,
                user_id,
                image: prod_data.image.src,
                product_description: prod_data.product_description,
                special_message: spl_msg,
                size,
                cake_type,
                product_id: prod_unique_id,
                quantity: 1,
                price: prod_price,
                category: prod_data.category,
            });

            localStorage.setItem("add_to_cart", JSON.stringify(cart));

            window.alert("Product has been added to cart");
        }

        else {
            for (let i = 0; i < cart.length; i++) {
                if (
                    unique_id === cart[i].product_id &&
                    user_id === cart[i].user_id
                ) {
                    logic = true;
                }
            }

            if (!logic) {
                cart.push({
                    product_cart_id: uuidv4(),
                    product_name: prod_data.name,
                    user_id,
                    image: prod_data.image.src,
                    product_description: prod_data.product_description,
                    size: 0,
                    product_id: prod_unique_id,
                    quantity: 1,
                    price: prod_price,
                    category: prod_data.category,
                });

                localStorage.setItem("add_to_cart", JSON.stringify(cart));

                window.alert("Product has been added to cart");
            }
        }
    }
    location.reload();
})