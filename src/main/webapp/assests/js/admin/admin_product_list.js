// admin product page
const prod_detail = JSON.parse(localStorage.getItem("prod_detail"));

const Cakes = prod_detail.filter(function category(type) {
    return type.category === "Cakes";
});

const Breads = prod_detail.filter(function category(type) {
    return type.category === "Breads";
});

const breakfast_pastries = prod_detail.filter(function category(type) {
    return type.category === "Breakfast Pastry";
});

for (let i = 0; i < prod_detail.length; i++) {
    const table_data = create(prod_detail[i]);
    document.querySelector("tbody.table_body").append(tr);

    function create(prod) {
        // tr

        tr = document.createElement("tr");

        // td 1

        const td1 = document.createElement("td");
        td1.innerText = [i + 1];
        tr.append(td1);

        // td 2

        const td2 = document.createElement("td");
        td2.innerText = prod.name;
        tr.append(td2);

        // td 3

        const td3 = document.createElement("td");
        td3.innerText = prod.description;
        tr.append(td3);

        // td 4

        const { category } = prod;
        const find_default_price = prod.price_details.find((e) => e.size === 0);
        const find_second_price = prod.price_details.find((e) => e.size === 1);
        const find_third_price = prod.price_details.find((e) => e.size === 2);

        if (category === "Cakes") {
            const td4 = document.createElement("td");
            td4.innerText =
                `1/2kg = ₹${find_default_price.price}\n` +
                ` ` +
                `1kg = ₹${find_second_price.price}\n` +
                ` ` +
                `2kg = ₹${find_third_price.price}`;
            tr.append(td4);
        } else {
            const td4 = document.createElement("td");
            td4.innerText = `₹${find_default_price.price}`;
            tr.append(td4);
        }

        // td 5

        const td5 = document.createElement("td");
        td5.innerText = prod.v_label;
        tr.append(td5);

        const td6 = document.createElement("td");
        td6.innerText = prod.category;
        tr.append(td6);

        // a update

        const td7 = document.createElement("td");
        tr.append(td7);

        // a update

        const butup = document.createElement("button");
        butup.setAttribute("data-id", prod.product_id);
        butup.setAttribute("class", "update");
        butup.innerText = "Edit";
        td7.append(butup);

        // a delete

        const td8 = document.createElement("td");
        tr.append(td8);

        // a delete

        const butdel = document.createElement("button");
        butdel.setAttribute("data-id", prod.product_id);
        butdel.setAttribute("class", "delete");
        butdel.innerText = "Delete";
        td8.append(butdel);
    }
}

const filter_category = document.getElementById("filter_cat");


function filter_table() {

    const table_whole = document.querySelector("tbody.table_body");

    if (filter_category.value === "All") {

        table_whole.innerHTML = "";

        for (let i = 0; i < prod_detail.length; i++) {
            const table_data = create(prod_detail[i]);
            document.querySelector("tbody.table_body").append(tr);

            function create(prod) {
                // tr

                tr = document.createElement("tr");

                // td 1

                const td1 = document.createElement("td");
                td1.innerText = [i + 1];
                tr.append(td1);

                // td 2

                const td2 = document.createElement("td");
                td2.innerText = prod.name;
                tr.append(td2);

                // td 3

                const td3 = document.createElement("td");
                td3.innerText = prod.description;
                tr.append(td3);

                // td 4

                const { category } = prod;
                const find_default_price = prod.price_details.find((e) => e.size === 0);
                const find_second_price = prod.price_details.find((e) => e.size === 1);
                const find_third_price = prod.price_details.find((e) => e.size === 2);

                if (category === "Cakes") {
                    const td4 = document.createElement("td");
                    td4.innerText =
                        `1/2kg = ₹${find_default_price.price}\n` +
                        ` ` +
                        `1kg = ₹${find_second_price.price}\n` +
                        ` ` +
                        `2kg = ₹${find_third_price.price}`;
                    tr.append(td4);
                } else {
                    const td4 = document.createElement("td");
                    td4.innerText = `₹${find_default_price.price}`;
                    tr.append(td4);
                }

                // td 5

                const td5 = document.createElement("td");
                td5.innerText = prod.category;
                tr.append(td5);

                // a update

                const td6 = document.createElement("td");
                tr.append(td6);

                // a update

                const butup = document.createElement("button");
                butup.setAttribute("data-id", prod.product_id);
                butup.setAttribute("class", "update");
                butup.innerText = "Edit";
                td6.append(butup);

                // a delete

                const td7 = document.createElement("td");
                tr.append(td7);

                // a delete

                const butdel = document.createElement("button");
                butdel.setAttribute("data-id", prod.product_id);
                butdel.setAttribute("class", "delete");
                butdel.innerText = "Delete";
                td7.append(butdel);
            }
        }
    }

    else if (filter_category.value === "Cakes") {

        table_whole.innerHTML = "";

        for (let i = 0; i < Cakes.length; i++) {
            const table_data = create(Cakes[i]);
            document.querySelector("tbody.table_body").append(tr);

            function create(prod) {
                // tr

                tr = document.createElement("tr");

                // td 1

                const td1 = document.createElement("td");
                td1.innerText = [i + 1];
                tr.append(td1);

                // td 2

                const td2 = document.createElement("td");
                td2.innerText = prod.name;
                tr.append(td2);

                // td 3

                const td3 = document.createElement("td");
                td3.innerText = prod.description;
                tr.append(td3);

                // td 4

                const { category } = prod;
                const find_default_price = prod.price_details.find((e) => e.size === 0);
                const find_second_price = prod.price_details.find((e) => e.size === 1);
                const find_third_price = prod.price_details.find((e) => e.size === 2);

                if (category === "Cakes") {
                    const td4 = document.createElement("td");
                    td4.innerText =
                        `1/2kg = ₹${find_default_price.price}\n` +
                        ` ` +
                        `1kg = ₹${find_second_price.price}\n` +
                        ` ` +
                        `2kg = ₹${find_third_price.price}`;
                    tr.append(td4);
                } else {
                    const td4 = document.createElement("td");
                    td4.innerText = `₹${find_default_price.price}`;
                    tr.append(td4);
                }

                // td 5

                const td5 = document.createElement("td");
                td5.innerText = prod.category;
                tr.append(td5);

                // a update

                const td6 = document.createElement("td");
                tr.append(td6);

                // a update

                const butup = document.createElement("button");
                butup.setAttribute("data-id", prod.product_id);
                butup.setAttribute("class", "update");
                butup.innerText = "Edit";
                td6.append(butup);

                // a delete

                const td7 = document.createElement("td");
                tr.append(td7);

                // a delete

                const butdel = document.createElement("button");
                butdel.setAttribute("data-id", prod.product_id);
                butdel.setAttribute("class", "delete");
                butdel.innerText = "Delete";
                td7.append(butdel);
            }
        }
    }

    else if (filter_category.value === "Breads") {

        table_whole.innerHTML = "";

        for (let i = 0; i < Breads.length; i++) {
            const table_data = create(Breads[i]);
            document.querySelector("tbody.table_body").append(tr);

            function create(prod) {
                // tr

                tr = document.createElement("tr");

                // td 1

                const td1 = document.createElement("td");
                td1.innerText = [i + 1];
                tr.append(td1);

                // td 2

                const td2 = document.createElement("td");
                td2.innerText = prod.name;
                tr.append(td2);

                // td 3

                const td3 = document.createElement("td");
                td3.innerText = prod.description;
                tr.append(td3);

                // td 4

                const { category } = prod;
                const find_default_price = prod.price_details.find((e) => e.size === 0);
                const find_second_price = prod.price_details.find((e) => e.size === 1);
                const find_third_price = prod.price_details.find((e) => e.size === 2);

                if (category === "Cakes") {
                    const td4 = document.createElement("td");
                    td4.innerText =
                        `1/2kg = ₹${find_default_price.price}\n` +
                        ` ` +
                        `1kg = ₹${find_second_price.price}\n` +
                        ` ` +
                        `2kg = ₹${find_third_price.price}`;
                    tr.append(td4);
                } else {
                    const td4 = document.createElement("td");
                    td4.innerText = `₹${find_default_price.price}`;
                    tr.append(td4);
                }

                // td 5

                const td5 = document.createElement("td");
                td5.innerText = prod.category;
                tr.append(td5);

                // a update

                const td6 = document.createElement("td");
                tr.append(td6);

                // a update

                const butup = document.createElement("button");
                butup.setAttribute("data-id", prod.product_id);
                butup.setAttribute("class", "update");
                butup.innerText = "Edit";
                td6.append(butup);

                // a delete

                const td7 = document.createElement("td");
                tr.append(td7);

                // a delete

                const butdel = document.createElement("button");
                butdel.setAttribute("data-id", prod.product_id);
                butdel.setAttribute("class", "delete");
                butdel.innerText = "Delete";
                td7.append(butdel);
            }
        }
    }

    else if (filter_category.value === "Breakfast Pastries") {

        table_whole.innerHTML = "";

        for (let i = 0; i < breakfast_pastries.length; i++) {
            const table_data = create(breakfast_pastries[i]);
            document.querySelector("tbody.table_body").append(tr);

            function create(prod) {
                // tr

                tr = document.createElement("tr");

                // td 1

                const td1 = document.createElement("td");
                td1.innerText = [i + 1];
                tr.append(td1);

                // td 2

                const td2 = document.createElement("td");
                td2.innerText = prod.name;
                tr.append(td2);

                // td 3

                const td3 = document.createElement("td");
                td3.innerText = prod.description;
                tr.append(td3);

                // td 4

                const { category } = prod;
                const find_default_price = prod.price_details.find((e) => e.size === 0);
                const find_second_price = prod.price_details.find((e) => e.size === 1);
                const find_third_price = prod.price_details.find((e) => e.size === 2);

                if (category === "Cakes") {
                    const td4 = document.createElement("td");
                    td4.innerText =
                        `1/2kg = ₹${find_default_price.price}\n` +
                        ` ` +
                        `1kg = ₹${find_second_price.price}\n` +
                        ` ` +
                        `2kg = ₹${find_third_price.price}`;
                    tr.append(td4);
                } else {
                    const td4 = document.createElement("td");
                    td4.innerText = `₹${find_default_price.price}`;
                    tr.append(td4);
                }

                // td 5

                const td5 = document.createElement("td");
                td5.innerText = prod.category;
                tr.append(td5);

                // a update

                const td6 = document.createElement("td");
                tr.append(td6);

                // a update

                const butup = document.createElement("button");
                butup.setAttribute("data-id", prod.product_id);
                butup.setAttribute("class", "update");
                butup.innerText = "Edit";
                td6.append(butup);

                // a delete

                const td7 = document.createElement("td");
                tr.append(td7);

                // a delete

                const butdel = document.createElement("button");
                butdel.setAttribute("data-id", prod.product_id);
                butdel.setAttribute("class", "delete");
                butdel.innerText = "Delete";
                td7.append(butdel);
            }
        }
    }

    // edit for product

    const edit = document.querySelectorAll("button.update");

    edit.forEach(function (getID) {
        getID.addEventListener("click", function () {
            const { id } = this.dataset;

            localStorage.setItem("product_id", JSON.stringify(id));

            window.location.href = "../admin/admin_product_update.html";
        })
    });

    const del_prod = document.querySelectorAll("button.delete");

    del_prod.forEach(function (getID) {
        getID.addEventListener("click", function () {
            if (window.confirm("Are you sure?")) {

                const { id } = this.dataset;

                localStorage.setItem("product_id", JSON.stringify(id));

                const uuid = JSON.parse(localStorage.getItem("product_id"));
                const product = JSON.parse(localStorage.getItem("prod_detail"));

                function find_data(e) {
                    return e.product_id === uuid;
                }

                const product_data = product.find(find_data);

                console.log(product_data);

                const indexOfUser = product.indexOf(product_data);

                product.splice(indexOfUser, 1);

                localStorage.setItem("prod_detail", JSON.stringify(product));

                window.location.reload();
            }
        })
    });

}


// edit for product

const edit = document.querySelectorAll("button.update");

edit.forEach(function (getID) {
    getID.addEventListener("click", function () {
        const { id } = this.dataset;

        localStorage.setItem("product_id", JSON.stringify(id));

        window.location.href = "../admin/admin_product_update.html";
    })
});

const del_prod = document.querySelectorAll("button.delete");

del_prod.forEach(function (getID) {
    getID.addEventListener("click", function () {
        if (window.confirm("Are you sure?")) {

            const { id } = this.dataset;

            localStorage.setItem("product_id", JSON.stringify(id));

            const uuid = JSON.parse(localStorage.getItem("product_id"));
            const product = JSON.parse(localStorage.getItem("prod_detail"));

            function find_data(e) {
                return e.product_id === uuid;
            }

            const product_data = product.find(find_data);

            console.log(product_data);

            const indexOfUser = product.indexOf(product_data);

            product.splice(indexOfUser, 1);

            localStorage.setItem("prod_detail", JSON.stringify(product));

            window.location.reload();
        }
    })
});