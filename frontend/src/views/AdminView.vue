<template>
    <main class="all">
        <header>
            <header>
                <div class="logout">
                    <router-link to="/">
                        <img src="../assets/logout2.png" />
                    </router-link>
                </div>
                <div class="navbar">
                    <div class="container nav-container">
                        <input class="checkbox" type="checkbox" name id />
                        <div class="hamburger-lines">
                            <span class="line line1"></span>
                            <span class="line line2"></span>
                            <span class="line line3"></span>
                        </div>
                        <div class="menu-items">
                            <li>
                                <router-link to="/admin" class="active">Appointment</router-link>
                            </li>
                            <li>
                                <router-link  to="/client">Clients</router-link>
                            </li>
                            <li>
                                <router-link to="/">Log Out</router-link>
                            </li>
                        </div>
                    </div>
                </div>
                <div class="menu">
                    <ul>
                        <li>
                            <router-link to="/admin">Appointment</router-link>
                        </li>
                        <li>
                            <router-link to="/client">Clients</router-link>
                        </li>
                    </ul>
                </div>
                <div class="logo">
                    <img src="../assets/logo.png" alt />
                    <h2>
                        <span>At</span>Develop
                    </h2>
                </div>
            </header>
        </header>

        <div class="adcontent">
            <h1>ADMINISTRATION</h1>
            <div class="table">
                <table>
                    <thead>
                        <th>FULL NAME</th>
                        <th>PHONE NUMBER</th>
                        <th>PROFESSION</th>
                        <th>DATE</th>
                        <th>TIME</th>
                        <th>SUBJECT</th>
                    </thead>
                    <tbody>
                        <tr v-for="data in tableau" :key="data.id_r">
                            <td>{{ data.lname }} {{ data.fname }}</td>
                            <td>{{ data.tel }}</td>
                            <td>{{ data.profession }}</td>
                            <td>{{ data.date_r }}</td>
                            <td>{{ data.id_creneau }}</td>
                            <td>{{ data.sujet }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    
</template>


<script>

export default {
    name: "AdminView-view",

    mounted() {
        // this.id = localStorage.getItem("id");
        // console.log(localStorage.getItem("id"));
        fetch("http://localhost/rdv/backend/admin/getAllRdv").then(res => res.json()).then(tableau => {
            this.tableau = tableau;
        })
    },
    data() {
        return {
            // list: Array(4).fill({ id_r: "", date_r: new Date("2022-03-28"), sujet: "tester", id_creneau: 1, id_client: 1, date_c: "de 10 h a 10:30 h" }).map(v => ({ ...v, id: Math.random() })),
            tableau: {
                id_r: "",
                date_r: "",
                sujet: "",
                id_creneau: "",
                id_client: "",
                date_c: "",
                profession: "",
                sujet: "",

            },
            client: {},
            id: "",
        }
    }
}
</script>


<style scoped>

.table th {
    background-color: #444e59;
    padding: 1%;
    width: 200px;
    color: #252a30;
    font-weight: bold;
}
th:first-child {
    border-radius: 15px 0px 0px 0px;
}
th:last-child {
    border-radius: 0px 15px 0px 0px;
}
.table {
    margin-top: 2%;
}
.table td {
    border: 3px solid #37414d;
    text-align: center;
    color: white;
}



.delete {
    background-color: rgb(111, 0, 0);
    border: none;
    border-radius: 5px;

    margin-left: 10px;
    cursor: pointer;
}
.btn {
    color: white;
    text-decoration: none;
}
.update {
    background-color: rgb(0, 64, 0);
    border: none;
    border-radius: 5px;
    color: white;
    margin-left: 10px;
    cursor: pointer;
}

.popup {
    margin: 70px auto;
    padding: 20px;
    background: #fff;
    border-radius: 5px;
    width: 50%;
    position: relative;
    background-color: #252a30;
    color: white;
    padding: 20px;
}

.popup h2 {
    /* margin-top: 0; */
    color: #f9a800;
    text-align: center;
}
.popup .close {
    position: absolute;
    top: 20px;
    right: 30px;
    transition: all 200ms;
    font-size: 30px;
    font-weight: bold;
    text-decoration: none;
    color: white;
}
.popup .close:hover {
    color: #f9a800;
}
.popup .contentt {
    max-height: 100%;
    overflow: auto;
    margin-top: 20px;
}
.router-link-active {
  border-bottom: 2px solid white;
}

.A1,
.A2 {
    display: flex;
    flex-direction: column;
}
.contentt div {
    display: flex;
    justify-content: space-between;
}
.contentt div input {
    width: 250px;
    height: 40px;
    border-radius: 15px;
    border: 2px solid #ffdd97;
    background-color: #252a30;
    color: white;
    padding-left: 10px;
}

.create {
    background-image: url(../assets/Group_9.png);
    width: 150px;
    height: 40px;
    background-repeat: no-repeat !important;
    background-size: cover;
    margin-top: 50px;
    padding: 0;
    background-position: center;
    background-size: cover;
    object-fit: cover;
    border-radius: 19px;
    margin-left: 38%;
    border: none;
    font-size: 20px;
    cursor: pointer;
}

.overlay {
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    background: rgba(0, 0, 0, 0.7);
    transition: opacity 500ms;
    visibility: hidden;
    opacity: 0;
}
.overlay:target {
    visibility: visible;
    opacity: 1;
    z-index: 999;
}

* {
    font-family: "Roboto";
}
template {
    font-family: "roboto";
}
*::-webkit-scrollbar {
    width: 12px;
}

*::-webkit-scrollbar-track {
    background: transparent;
}

*::-webkit-scrollbar-thumb {
    background-color: rgb(95, 95, 95);
    border-radius: 20px;
    border: 2px solid rgb(255, 255, 255);
}
.all {
    background-image: url(../assets/back3.png);
    height: 82vh;
    background-repeat: no-repeat !important;
    background-size: cover;
    margin: 0;
    padding: 0;
    background-position: center;
    background-size: cover;
    object-fit: cover;
    background-attachment: fixed;
}

header {
    display: flex;
    justify-content: space-between;
    width: 100%;
}
.logo {
    height: 130px;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    justify-content: center;
    padding: 30px;
}

.logo img {
    width: 100px;
    height: 70px;
}
.logo h2 span {
    color: white;
    font-weight: 700;
}
.logo h2 {
    color: #f9a800;
    font-weight: 700;
    letter-spacing: 2px;
    font-size: 17px;
}
.menu ul {
    list-style: none;
    display: flex;
    justify-content: space-between;
    margin-right: 30px;
}

.menu ul li {
    margin-left: 100px;
    font-size: 18px;
    margin-top: 7%;
}

.menu a {
    text-decoration: none;
    font-family: "Abel", sans-serif;
    font-size: 18px;
    color: rgb(255, 255, 255);
}
.navbar .menu-items {
    display: flex;
}

.navbar .nav-container li {
    list-style: none;
}

.navbar .nav-container a {
    text-decoration: none;
    /* color: #0e2431; */
    font-weight: 500;
    font-size: 1.2rem;
    padding: 0.7rem;
    color: #f9a800;
    font-weight: bolder;
    font-size: 1.5rem;
}

.navbar .nav-container a:hover {
    font-weight: bolder;
}

.nav-container {
    display: block;
    position: relative;
    height: 60px;
}

.nav-container .checkbox {
    position: absolute;
    display: block;
    height: 32px;
    width: 32px;
    top: 20px;
    left: 20px;
    z-index: 5;
    opacity: 0;
    cursor: pointer;
}

.nav-container .hamburger-lines {
    display: block;
    height: 26px;
    width: 32px;
    position: absolute;
    top: 17px;
    left: 20px;
    z-index: 2;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.nav-container .hamburger-lines .line {
    display: block;
    height: 4px;
    width: 100%;
    border-radius: 10px;
    background: #ffffff;
}

.nav-container .hamburger-lines .line1 {
    transform-origin: 0% 0%;
    transition: transform 0.4s ease-in-out;
}

.nav-container .hamburger-lines .line2 {
    transition: transform 0.2s ease-in-out;
}

.nav-container .hamburger-lines .line3 {
    transform-origin: 0% 100%;
    transition: transform 0.4s ease-in-out;
}

.navbar .menu-items {
    padding-top: 120px;
    background-color: #444e59;
    height: 100vh;
    width: 100vw;
    transform: translate(-150%);
    display: flex;
    flex-direction: column;
    margin-left: -40px;
    padding-left: 50px;
    transition: transform 0.5s ease-in-out;
    text-align: center;
    z-index: 1;
    position: absolute;
}

.navbar .menu-items li {
    margin-bottom: 3.2rem;
    font-size: 2.5rem;
    font-weight: bold;
}

.nav-container input[type="checkbox"]:checked ~ .menu-items {
    transform: translateX(0);
}

.nav-container input[type="checkbox"]:checked ~ .hamburger-lines .line1 {
    transform: rotate(45deg);
}

.nav-container input[type="checkbox"]:checked ~ .hamburger-lines .line2 {
    transform: scaleY(0);
}

.nav-container input[type="checkbox"]:checked ~ .hamburger-lines .line3 {
    transform: rotate(-45deg);
}

.nav-container input[type="checkbox"]:checked ~ .logo {
    display: none;
}
.navbar {
    display: none;
}
.logout {
    margin-top: 1%;
    margin-left: 1%;
}
header {
    display: flex;
    justify-content: space-between;
}
.adcontent {
    min-height:100vh;
    padding-bottom: 100px;
    background-color: #252a30;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 100px;
}
.adcontent h1 {
    font-weight: bold;
    letter-spacing: 10px;
    color: #f9a800;
    margin-top: 1%;
}
.adrecherche form {
    margin: auto;
    width: 370px;
    margin-top: 2%;
}
form.adexample input[type="text"] {
    padding: 10px;
    font-size: 17px;
    float: left;
    width: 80%;
    background: #eaeaea;
    border: none;
    border-radius: 30px 0 0 30px;
}

form.adexample button {
    float: left;
    height: 2.35em;
    width: 20%;
    padding: 0.2em;
    background: #f9a800;
    color: white;
    font-size: 17px;
    /* border-left: none; */
    border: none;
    cursor: pointer;
    border-radius: 0 30px 30px 0;
}

form.adexample button:hover {
    background: #f9a800;
}

form.adexample::after {
    content: "";
    clear: both;
    display: table;
}

@media screen and (max-width:700PX) {
     .navbar{
         display:block;
     }

    .logo{
        margin-top: -24px;
        padding: 0%;
        margin-right: 2%;
    }
    .logo img {
    width: 76px;
    height: 40px;
}
header{
    margin-top: 0%;
}
.logout{
  display: none;
}
.menu{
    display: none;
}
.logo h2 {
    color: #F9A800;
    font-weight: 700;
    letter-spacing: 2px;
    font-size: 12px;
}
.logout img {
    margin-left: 10px;
    margin-top: 15px;
}

.all{
background-image: url(/src/assets/back3.png);
    background-repeat: no-repeat !important;
    background-size: cover;
    margin: 0;
    padding: 0;
    background-position: center;
    background-size: cover;
    object-fit: cover;
    background-attachment: fixed;
    height: 25vh;
    width: 100%;
}


.adcontent h1 {
    font-weight: bold;
    letter-spacing: 10px;
    color: #F9A800;
    margin-top: 1%;
    font-size: 20px;
}


.adrecherche form {
    margin: auto;
    width: 285px;
    margin-top: 2%;
}
th {
    margin-left: 41px;
    font-size:9px;
}
table {
    width: 96%;
}
.table {
    margin-top: 2%;
    margin-left: 4%;
    width: 100%;
}
table td{
    font-size:11px;
}
.table th{
    padding: 0%;
}
.adcontent{
    width: 100%;
    font-size: 80%;
}
}
</style>