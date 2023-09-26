// admin product create page

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
        input1.setAttribute("pattern", "[0-9]+");
        input1.setAttribute("title", "Please use numbers only.");
        input1.setAttribute.required = true;
        document.querySelector(".price").append(input1);

        br1 = document.createElement("br");
        document.querySelector(".price").append(br1);

        br1 = document.createElement("br");
        document.querySelector(".price").append(br1);

        const label2 = document.createElement("label");
        label2.setAttribute("id", "1kg");
        label2.innerText = "1Kg price :";
        document.querySelector(".price").append(label2);

        const br2 = document.createElement("br");
        document.querySelector(".price").append(br2);

        const input2 = document.createElement("input");
        input2.setAttribute("id", "price2");
        input2.setAttribute("pattern", "[0-9]+");
        input2.setAttribute("title", "Please use numbers only.");
        input2.setAttribute.required = true;
        document.querySelector(".price").append(input2);

        br1 = document.createElement("br");
        document.querySelector(".price").append(br1);

        br1 = document.createElement("br");
        document.querySelector(".price").append(br1);

        const label3 = document.createElement("label");
        label3.setAttribute("id", "2kg");
        label3.innerText = "2Kg price :";
        document.querySelector(".price").append(label3);

        const br3 = document.createElement("br");
        document.querySelector(".price").append(br3);

        const input3 = document.createElement("input");
        input3.setAttribute("id", "price3");
        input3.setAttribute("pattern", "[0-9]+");
        input3.setAttribute("title", "Please use numbers only.");
        input3.setAttribute.required = true;
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
        input.setAttribute("pattern", "[0-9]+");
        input.setAttribute("title", "Please use numbers only.");
        input.setAttribute.required = true;
        document.querySelector(".price").append(input);

        br = document.createElement("br");
        document.querySelector(".price").append(br);

        br = document.createElement("br");
        document.querySelector(".price").append(br);
    }
}

cate.addEventListener("change", prices);

function createProduct(e) {
    const product_name = document.getElementById("product_name").value.trim();
    const description = document.getElementById("description").value;
    const veg_non_veg = document.getElementById("v").value
    const category = document.getElementById("category").value;
    const add_image = document.getElementById("add_image").value;
    const product_uuid = uuidv4();

    const array = [];

    if (category === "Cakes") {
        const price1 = document.getElementById("price1").value;
        const price2 = document.getElementById("price2").value;
        const price3 = document.getElementById("price3").value;

        array.push(
            {
                size: 0,
                price: price1,
            },
            {
                size: 1,
                price: price2,
            },
            {
                size: 2,
                price: price3,
            }
        );
    } else {
        const price1 = document.getElementById("price1").value;

        array.push({
            size: 0,
            price: price1,
        });
    }
    const prod_detail = JSON.parse(localStorage.getItem("prod_detail")) || [];

    prod_detail.push({
        name: product_name,
        description,
        price_details: array,
        v_label: veg_non_veg,
        category,
        image: {
            src: add_image,
            alt: product_name,
        },
        product_id: product_uuid,
    });

    localStorage.setItem("prod_detail", JSON.stringify(prod_detail));
    alert("Product added");
    window.location.href = "../admin/admin_product_list.html";

    e.preventDefault();
}