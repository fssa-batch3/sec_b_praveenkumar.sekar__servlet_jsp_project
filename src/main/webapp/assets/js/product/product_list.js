// product list

const prod_detail = JSON.parse(localStorage.getItem("prod_detail"));

// array.filter()

const Cakes = prod_detail.filter(function category(type) {
    return type.category === "Cakes";
});

const Breads = prod_detail.filter(function category(type) {
    return type.category === "Breads";
});

const breakfast_pastries = prod_detail.filter(function category(type) {
    return type.category === "Breakfast Pastry";
});

let main = document.querySelector(".product-box")

function render(object) {
    const find_default_price = object.price_details.find((e) => e.size === 0);
    const find_second_price = object.price_details.find((e) => e.size === 1);
    const find_third_price = object.price_details.find((e) => e.size === 2);

    // div_product
    const div_prod = document.createElement("div");
    div_prod.setAttribute("class", "product");
    console.log(div_prod);

    // h2
    const h2 = document.createElement("h2");
    h2.innerText = object.name;
    div_prod.append(h2);

    // p
    const price = document.createElement("p");
    price.innerText = `₹${find_default_price.price}`;
    div_prod.append(price);

    // veg or non veg

    if (object.category !== "Cakes") {
        if (object.v_label === "Veg") {
            const veg = document.createElement("img");
            veg.setAttribute("src", "../../assets/Images/icons8-vegetarian-food-symbol-48.png")
            veg.setAttribute("alt", "vegetarian-food-symbol");
            veg.setAttribute("class", "v_label");
            div_prod.append(veg);
        }

        else if (object.v_label === "Non veg") {
            const non_veg = document.createElement("img");
            non_veg.setAttribute("src", "../../assets/Images/Web_Photo_Editor.jpg")
            non_veg.setAttribute("alt", "non-vegetarian-food-symbol");
            non_veg.setAttribute("class", "v_label");
            div_prod.append(non_veg);
        }

    }

    // img
    const prod_img = document.createElement("img");
    prod_img.setAttribute("src", object.image.src);
    prod_img.setAttribute("class", "img_size");
    prod_img.setAttribute("alt", object.name);
    div_prod.append(prod_img);

    const prod_a = document.createElement("a");
    prod_a.setAttribute(
        "href",
        `./product_detail.html?product_id=${object.product_id}`
    );
    div_prod.append(prod_a);

    const prod_button = document.createElement("button");
    prod_button.setAttribute("class", "prod_button");
    prod_button.innerText = "Learn more";
    prod_a.append(prod_button);

    return div_prod;
}

function all_products() {

    main.innerHTML = "";

    // cakes

    const cat_sec1 = document.createElement("div");
    cat_sec1.setAttribute("class", "category-section");
    cat_sec1.setAttribute("id", "cake");
    main.appendChild(cat_sec1);

    const title_1 = document.createElement("h2");
    title_1.setAttribute("class", "product_head");
    title_1.innerText = "CAKES";
    cat_sec1.appendChild(title_1);

    const products1 = document.createElement("div");
    products1.setAttribute("class", "products1");
    cat_sec1.appendChild(products1);

    // breads

    const cat_sec2 = document.createElement("div");
    cat_sec2.setAttribute("class", "category-section");
    cat_sec2.setAttribute("id", "bread");
    main.appendChild(cat_sec2);

    const title_2 = document.createElement("h2");
    title_2.setAttribute("class", "product_head");
    title_2.innerText = "BREADS";
    cat_sec2.appendChild(title_2);

    const products2 = document.createElement("div");
    products2.setAttribute("class", "products2");
    cat_sec2.appendChild(products2);

    // breakfast pastries

    const cat_sec3 = document.createElement("div");
    cat_sec3.setAttribute("class", "category-section");
    cat_sec3.setAttribute("id", "breakfast_pastries");
    main.appendChild(cat_sec3);

    const title_3 = document.createElement("h2");
    title_3.setAttribute("class", "product_head");
    title_3.innerText = "BREAKFAST PASTRIES";
    cat_sec3.appendChild(title_3);

    const products3 = document.createElement("div");
    products3.setAttribute("class", "products3");
    cat_sec3.appendChild(products3);

    for (let i = 0; i < Cakes.length; i++) {
        const div_prod = render(Cakes[i]);
        document.querySelector("div.products1").append(div_prod);
    }

    for (let i = 0; i < Breads.length; i++) {
        const div_prod = render(Breads[i]);
        document.querySelector("div.products2").append(div_prod);
    }

    for (let i = 0; i < breakfast_pastries.length; i++) {
        const div_prod = render(breakfast_pastries[i]);
        document.querySelector("div.products3").append(div_prod);
    }

}

function filter_bread() {

    main.innerHTML = "";

    const cat_sec2 = document.createElement("div");
    cat_sec2.setAttribute("class", "category-section");
    cat_sec2.setAttribute("id", "bread");
    main.appendChild(cat_sec2);

    const title_2 = document.createElement("h2");
    title_2.setAttribute("class", "product_head");
    title_2.innerText = "BREADS";
    cat_sec2.appendChild(title_2);

    const products2 = document.createElement("div");
    products2.setAttribute("class", "products2");
    cat_sec2.appendChild(products2);

    for (let i = 0; i < Breads.length; i++) {
        const div_prod = render(Breads[i]);
        document.querySelector("div.products2").append(div_prod);
    }
}

function filter_cake() {

    main.innerHTML = "";

    const cat_sec1 = document.createElement("div");
    cat_sec1.setAttribute("class", "category-section");
    cat_sec1.setAttribute("id", "cake");
    main.appendChild(cat_sec1);

    const title_1 = document.createElement("h2");
    title_1.setAttribute("class", "product_head");
    title_1.innerText = "CAKES";
    cat_sec1.appendChild(title_1);

    const products1 = document.createElement("div");
    products1.setAttribute("class", "products1");
    cat_sec1.appendChild(products1);

    for (let i = 0; i < Cakes.length; i++) {
        const div_prod = render(Cakes[i]);
        document.querySelector("div.products1").append(div_prod);
    }
}

function filter_bp() {

    main.innerHTML = "";

    const cat_sec3 = document.createElement("div");
    cat_sec3.setAttribute("class", "category-section");
    cat_sec3.setAttribute("id", "breakfast_pastries");
    main.appendChild(cat_sec3);

    const title_3 = document.createElement("h2");
    title_3.setAttribute("class", "product_head");
    title_3.innerText = "BREAKFAST PASTRIES";
    cat_sec3.appendChild(title_3);

    const products3 = document.createElement("div");
    products3.setAttribute("class", "products3");
    cat_sec3.appendChild(products3);

    for (let i = 0; i < breakfast_pastries.length; i++) {
        const div_prod = render(breakfast_pastries[i]);
        document.querySelector("div.products3").append(div_prod);
    }
}


