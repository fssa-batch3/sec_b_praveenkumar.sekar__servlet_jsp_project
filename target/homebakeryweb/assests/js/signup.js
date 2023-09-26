// function signup(){
function signUp(e) {
    const first_name = document.getElementById("first_name").value;
    const last_name = document.getElementById("last_name").value;
    const phone = document.getElementById("phone").value;
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    const confirm_pw = document.getElementById("confirm_pw").value;

    const user_cred = JSON.parse(localStorage.getItem("user_cred")) || [];

    const exist =
        user_cred.length &&
        JSON.parse(localStorage.getItem("user_cred")).some(
            (data) =>
                data.email.toLowerCase() === email.toLowerCase()
        );

    if (!exist) {
        if (password === confirm_pw) {
            const uuid = uuidv4();
            user_cred.push({
                first_name,
                last_name,
                Phone: phone,
                email,
                password,
                uuid,
            });

            localStorage.setItem("user_cred", JSON.stringify(user_cred));

            console.log(localStorage.getItem("user_cred"));
            document.querySelector("form").reset();
            document.getElementById("email").focus();
            document.getElementById("phone").focus();
            alert("Account created successfully");
            window.location.href = "./Log in.html";
        } else {
            alert("Confirm password does not match");
        }
    } else {
        alert(
            "Sorry the User already exists! \n Try with a new Email or Phone Number."
        );
        document.querySelector("form").reset();
    }
    e.preventDefault();
}