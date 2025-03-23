<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travelo Registration</title>
    <link rel="stylesheet" href="styles/register.css">
</head>
<body>
     <!-- Full-page banner -->
<div class="banner">
    <img src="images/logo1.png" alt="Logo" class="logo">
        <h2>Travelo</h2>

        <div class="register-container">
    <form action="crudRegister.php" method="post">
        <h3>Create Your Account</h3>

        <label for="username">Username</label>
        <input type="text" id="user-name" placeholder="create your own user name" name="susername" required>

        <label for="first-name">First Name</label>
        <input type="text" id="first-name" name="sfname" required>
        
        <label for="last-name">Last Name</label>
        <input type="text" id="last-name" name="slname" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="semail" required>
        
        <label for="password">Password</label>
        <input type="password" id="password" name="spwd" required>

        <label for="confirm-password">Confirm Password</label>
        <input type="password" id="confirm-password" name="sconpwd" required>

        <label for="gender">Gender</label>
        <select id="gender" name="sgender" required>
            <option value="male">Male</option>
            <option value="female">Female</option>
            <option value="other">Other</option>
        </select>

        <div class="country-select-container">
    <label for="country">Country:</label>
    <input type="text" id="country" name="scountry" placeholder="Search Country..." required>
    <div id="countrySuggestions" class="country-dropdown"></div> <!-- Country suggestions dropdown -->
    </div>

        <label for="postal-code">Postal code</label>
            <input type="text" id="postal-code" name="spostal" required>

        <label for="profile-picture">Profile Picture</label>
        <input type="file" id="profile-picture" name="sproimg">
        <input name="submit" type="submit" value="Register">
        
        <p>Already have an account? <a href="login.php">Login Now</a></p>
    </form>
</div>

</div>
<script>

        // Full Country List for Search
const countries = [
    "Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan",
    "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia",
    "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia",
    "Cameroon", "Canada", "Chile", "China", "Colombia", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark",
    "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Estonia", "Fiji", "Finland", "France", "Germany",
    "Ghana", "Greece", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy",
    "Jamaica", "Japan", "Jordan", "Kenya", "Kuwait", "Laos", "Latvia", "Lebanon", "Malaysia", "Maldives",
    "Mexico", "Monaco", "Morocco", "Nepal", "Netherlands", "New Zealand", "Nigeria", "Norway", "Oman", "Pakistan",
    "Philippines", "Poland", "Portugal", "Qatar", "Russia", "Saudi Arabia", "Singapore", "South Africa", "South Korea",
    "Spain", "Sri Lanka", "Sweden", "Switzerland", "Thailand", "Turkey", "Ukraine", "United Kingdom", "United States"
];

const countryInput = document.getElementById('country');
const suggestions = document.getElementById('countrySuggestions');

// Event listener for typing in the input field
countryInput.addEventListener('input', function () {
    const searchQuery = countryInput.value.toLowerCase();
    suggestions.innerHTML = ''; // Clear previous suggestions

    if (searchQuery === '') {
        suggestions.style.display = 'none';
        return;
    }

    const filteredCountries = countries.filter(country => 
        country.toLowerCase().includes(searchQuery)
    );

    if (filteredCountries.length > 0) {
        suggestions.style.display = 'block';
        filteredCountries.forEach(country => {
            const div = document.createElement('div');
            div.textContent = country;
            div.addEventListener('click', () => {
                countryInput.value = country;
                suggestions.innerHTML = '';
                suggestions.style.display = 'none';
            });
            suggestions.appendChild(div);
        });
    } else {
        suggestions.style.display = 'none';
    }
});

// Hide suggestions dropdown if clicked outside
document.addEventListener('click', function (e) {
    if (!document.querySelector('.country-select-container').contains(e.target)) {
        suggestions.style.display = 'none';
    }
});
    </script>
</body>
</html>