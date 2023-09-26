

// admin product update page

const uuid = JSON.parse(localStorage.getItem("product_id"));
const product = JSON.parse(localStorage.getItem("prod_detail"));

function find_data(e) {
    return e.product_id === uuid;
}

const product_data = product.find(find_data);

const { category } = product_data;

if (category === "Cakes") {
    const label1 = document.createElement("label");
    label1.setAttribute("id", "1/2kg");
    label1.innerText = "1/2Kg price:";
    document.querySelector(".price").append(label1);

    let br1 = document.createElement("br");
    document.querySelector(".price").append(br1);

    const input1 = document.createElement("input");
    input1.setAttribute("id", "price1");
    document.querySelector(".price").append(input1);

    br1 = document.createElement("br");
    document.querySelector(".price").append(br1);

    br1 = document.createElement("br");
    document.querySelector(".price").append(br1);

    const label2 = document.createElement("label");
    label2.setAttribute("id", "1kg");
    label2.innerText = "1Kg price:";
    document.querySelector(".price").append(label2);

    const br2 = document.createElement("br");
    document.querySelector(".price").append(br2);

    const input2 = document.createElement("input");
    input2.setAttribute("id", "price2");
    document.querySelector(".price").append(input2);

    br1 = document.createElement("br");
    document.querySelector(".price").append(br1);

    br1 = document.createElement("br");
    document.querySelector(".price").append(br1);

    const label3 = document.createElement("label");
    label3.setAttribute("id", "2kg");
    label3.innerText = "2Kg price:";
    document.querySelector(".price").append(label3);

    const br3 = document.createElement("br");
    document.querySelector(".price").append(br3);

    const input3 = document.createElement("input");
    input3.setAttribute("id", "price3");
    document.querySelector(".price").append(input3);

    br1 = document.createElement("br");
    document.querySelector(".price").append(br1);

    br1 = document.createElement("br");
    document.querySelector(".price").append(br1);
} else {
    const label = document.createElement("label");
    label.innerText = "Price:";
    document.querySelector(".price").append(label);

    let br = document.createElement("br");
    document.querySelector(".price").append(br);

    const input = document.createElement("input");
    input.setAttribute("id", "price1");
    document.querySelector(".price").append(input);

    br = document.createElement("br");
    document.querySelector(".price").append(br);

    br = document.createElement("br");
    document.querySelector(".price").append(br);
}

const cate = document.querySelector("#category");

function prices() {
    const inputcate = cate.value;

    document.querySelector(".price").innerHTML = "";

    if (inputcate === "Cakes") {
        const label1 = document.createElement("label");
        label1.setAttribute("id", "1/2kg");
        label1.innerText = "1/2Kg price:";
        document.querySelector(".price").append(label1);

        let br1 = document.createElement("br");
        document.querySelector(".price").append(br1);

        const input1 = document.createElement("input");
        input1.setAttribute("id", "price1");
        document.querySelector(".price").append(input1);

        br1 = document.createElement("br");
        document.querySelector(".price").append(br1);

        br1 = document.createElement("br");
        document.querySelector(".price").append(br1);

        const label2 = document.createElement("label");
        label2.setAttribute("id", "1kg");
        label2.innerText = "1Kg price:";
        document.querySelector(".price").append(label2);

        const br2 = document.createElement("br");
        document.querySelector(".price").append(br2);

        const input2 = document.createElement("input");
        input2.setAttribute("id", "price2");
        document.querySelector(".price").append(input2);

        br1 = document.createElement("br");
        document.querySelector(".price").append(br1);

        br1 = document.createElement("br");
        document.querySelector(".price").append(br1);

        const label3 = document.createElement("label");
        label3.setAttribute("id", "2kg");
        label3.innerText = "2Kg price:";
        document.querySelector(".price").append(label3);

        const br3 = document.createElement("br");
        document.querySelector(".price").append(br3);

        const input3 = document.createElement("input");
        input3.setAttribute("id", "price3");
        document.querySelector(".price").append(input3);

        br1 = document.createElement("br");
        document.querySelector(".price").append(br1);

        br1 = document.createElement("br");
        document.querySelector(".price").append(br1);
    } else {
        const label = document.createElement("label");
        label.innerText = "Price:";
        document.querySelector(".price").append(label);

        let br = document.createElement("br");
        document.querySelector(".price").append(br);

        const input = document.createElement("input");
        input.setAttribute("id", "price1");
        document.querySelector(".price").append(input);

        br = document.createElement("br");
        document.querySelector(".price").append(br);

        br = document.createElement("br");
        document.querySelector(".price").append(br);
    }
}

cate.addEventListener("change", prices);

const find_default_price = product_data.price_details.find((e) => e.size === 0);
const find_second_price = product_data.price_details.find((e) => e.size === 1);
const find_third_price = product_data.price_details.find((e) => e.size === 2);

document.getElementById("product_name").value = product_data.name;
document.getElementById("description").value = product_data.description;
document.getElementById("category").value = product_data.category;
if (category === "Cakes") {
    document.getElementById("price1").value = find_default_price.price;
    document.getElementById("price2").value = find_second_price.price;
    document.getElementById("price3").value = find_third_price.price;
} else {
    document.getElementById("price1").value = find_default_price.price;
}
document.getElementById("category").value = product_data.category;
document.getElementById("add_image").value = product_data.image.src;

// Funtion update

const update = document.querySelector("button.update");

function update_detail() {
    const find_default_price = product_data.price_details.find(
        (e) => e.size === 0
    );
    const find_second_price = product_data.price_details.find(
        (e) => e.size === 1
    );
    const find_third_price = product_data.price_details.find(
        (e) => e.size === 2
    );

    if (category === "Cakes") {
        product_data.name = document.getElementById("product_name").value;
        product_data.description = document.getElementById("description").value;
        find_default_price.price = document.getElementById("price1").value;
        find_second_price.price = document.getElementById("price2").value;
        find_third_price.price = document.getElementById("price3").value;
        product_data.category = document.getElementById("category").value;
        product_data.image.src = document.getElementById("add_image").value;
    } else {
        product_data.name = document.getElementById("product_name").value;
        product_data.description = document.getElementById("description").value;
        find_default_price.price = document.getElementById("price1").value;
        product_data.category = document.getElementById("category").value;
        product_data.image.src = document.getElementById("add_image").value;
    }

    localStorage.setItem("prod_detail", JSON.stringify(product));

    window.location.href = "./admin_product_list.html";

    alert("Product updated successfully");
}

update.addEventListener("click", update_detail);