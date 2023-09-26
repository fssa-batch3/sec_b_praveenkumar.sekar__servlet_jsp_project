// function sign in()
function signIn(e) {
    e.preventDefault();
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;

    const user_cred = JSON.parse(localStorage.getItem("user_cred")) || [];

    const exist =
        user_cred.length &&
        JSON.parse(localStorage.getItem("user_cred")).some(
            (data) =>
                data.email.toLowerCase() === email && data.password === password
        );

    if (!exist) {
        alert("Incorrect User Credentials");
        document.querySelector("form").reset();
    } else if (email === "admin123@gmail.com") {
        localStorage.setItem("uniqueID", JSON.stringify(email));
        alert("Welcome Admin");
        window.location.href = "../admin/admin_product_list.html";
    } else {
        localStorage.setItem("uniqueID", JSON.stringify(email));
        alert("Your Login is Successful");
        window.location.href = "../../index.html";
    }
}