

<template>
    <main class="allHistorique">
        <header>
            <div class="logout">
                <!-- <a href="">
                    <img src="../assets/logOut.png" />
                </a>-->
                <router-link to="/">
                    <img src="../assets/logOut.png" />
                </router-link>
            </div>

            <div class="navbar">
                <div class="container nav-container">
                    <input class="checkbox" type="checkbox" />
                    <div class="hamburger-lines">
                        <span class="line line1"></span>
                        <span class="line line2"></span>
                        <span class="line line3"></span>
                    </div>
                    <div class="menu-items">
                        <li>
                            <router-link to="/dashboard">Dashboard</router-link>
                            <!-- <a href="#">Dashboard</a> -->
                        </li>
                        <li>
                            <!-- <a href="#">Historical</a> -->
                            <router-link to="/historique">Historical</router-link>
                        </li>
                        <li>
                            <!-- <a href="#">Log Out</a> -->
                            <router-link to="/">Log Out</router-link>
                        </li>
                    </div>
                </div>
            </div>

            <div class="menu">
                <ul>
                    <li>
                        <router-link to="/dashboard">Dashboard</router-link>
                        <!-- <a href="#">Dashboard</a> -->
                    </li>
                    <li>
                        <!-- <a href="#" class="active">Historical</a> -->
                        <router-link class="active" to="/historique">Historical</router-link>
                    </li>
                </ul>
            </div>
            <div class="logo">
                <img src="../assets/logo.png" />
                <h2>
                    <span>At</span>Develop
                </h2>
            </div>
        </header>
        <div class="allD">
            <div class="profile">
                <ul>
                    <div>
                        <li>Full Name :</li>
                        <h3>{{ userLog.fname }} {{ userLog.fname }}</h3>
                        <br />

                        <li>Phone Number :</li>
                        <h3>{{ userLog.tel }}</h3>
                        <br />
                    </div>
                    <div>
                        <li>Profession :</li>
                        <h3>{{ userLog.profession }}</h3>
                        <br />

                        <li>Identification :</li>
                        <h3>{{ userLog.psseudo_client }}</h3>
                        <br />
                    </div>
                </ul>
            </div>
            
            <div class="body">
                <h1>All the appointments you've booked.</h1>
                <div class="RDV"  v-if="rdvs.length > 0">
                    <div class="All-rendez">
                        <div v-for="data in rdvs" :key="data.id" class="rendez-content">
                            <div class="rendez">
                                <div class="sous-rendez">
                                    <div class="object">{{ data.sujet }}</div>
                                    <div class="date">{{ data.date_r }}</div>
                                    <div class="time">{{ data.id_creneau }}</div>
                                </div>
                                
                            </div>
                                <a @click="deleterdv(data.id_r)" class="delete"><img src="../assets/del.png" /></a>
                            
                        </div>
                    </div>
                    <hr />
                    <div class="historique">
                        <div v-for="data in rdvsh" :key="data.id" class="rendez-content">
                            <div class="rendez">
                                <div class="sous-rendez">
                                    <div class="object">{{ data.sujet }}</div>
                                    <div class="date">{{ data.date_r }}</div>
                                    <div class="time">{{ data.id_creneau }}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <div class="whatsap">
                <div class="code">
                    <img src="../assets/Group_4.png" />
                </div>
                <div>
                    <h1>ASK US !</h1>
                    <div class="mobile">
                        <img src="../assets/whatssap.png" />
                        <h2>0652086766</h2>
                    </div>
                </div>
            </div>
            <div>
                <h3>CONTACT:</h3>
                <div class="sociaux">
                    <div>
                        <img src="../assets/Group_1.png" />
                    </div>
                    <div>
                        <img src="../assets/Group_2.png" />
                    </div>
                    <div>
                        <img src="../assets/Group_3.png" />
                    </div>
                </div>
            </div>
        </footer>
    </main>
</template>

<script>










export default {
    name: "historique-view",


    data() {
        return {
            userLog: {},
            id: localStorage.getItem("id"),
            // list: Array(4).fill({ id_r: "", date_r: new Date("2022-03-28"), sujet: "tester", id_creneau: 1, id_client: 1, date_c: "de 10 h a 10:30 h" }).map(v => ({ ...v, id: Math.random() })),
            rdvs: {
                id_r: "",
                date_r: "",
                sujet: "",
                id_creneau: "",
                id_client: "",
                // date_c: "",
            },
             rdvsh: {
                id_r: "",
                date_r: "",
                sujet: "",
                id_creneau: "",
                id_client: "",
                // date_c: "",
            },
            client: {},

        }
    },
    mounted() {
        fetch(`http://localhost/rdv/backend/User/getAllRDV1?id=${this.id}`, {
            method: "GET",
        })
            .then(ress => ress.json()).then(rdvs => {
                this.rdvs = rdvs;
                // console.log("gggggggggg");
            })
            fetch(`http://localhost/rdv/backend/User/getAllRDV2?id=${this.id}`, {
            method: "GET",
        })
            .then(ress => ress.json()).then(rdvsh => {
                this.rdvsh = rdvsh;
                // console.log("gggggggggg");
            })
        this.getUser();
        // this.id = localStorage.getItem("id");
        // console.log(localStorage.getItem("id"));


    },
    methods: {
    
        getUser() {
            fetch(`http://localhost/rdv/backend/User/getUser?id=${this.id}`, {
                method: "GET",
            })
                .then((result) => {
                    return result.json();
                })
                .then((data) => {
                    this.userLog = data;
                });
        },
        

        deleterdv(id) {
            Swal.fire({
                title: 'Are you sure?',
                text: "Do you really want to delete this user!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                    'Deleted!',
                    'the appointement has been deleted.',
                    'success',
            fetch(`http://localhost/rdv/backend/user/deleterdv`,
                {
                    body:JSON.stringify({id}),
                    method: "DELETE",
                }
            ).then(() => {
                window.location="/historique"
            
            })
            )
                }
                })
        },

    },
}
</script>


<style scoped >
* {
    font-family: "Roboto";
}
main {
    display: flex;
    flex-direction: column;
}
template {
    font-family: "roboto";
}
*::-webkit-scrollbar,
*::-webkit-scrollbar-thumb {
    width: 26px;
    border-radius: 13px;
    background-clip: padding-box;
    border: 10px solid transparent;
}

*::-webkit-scrollbar-thumb {
    box-shadow: inset 0 0 0 10px;
}
.RDV {
    overflow-x: auto;
    height: 400px;
    color: #252a30;
}
.RDV:hover {
    color: rgba(255, 255, 255, 0.3);
}

.delete{
    cursor: pointer;
}
.allHistorique {
    background-image: url(../assets/back2.png);
    /* background:linear-gradient(to top,rgba(0,0,0,0.5)25%,rgba(0,0,0,0.5)25%),url(../assets/back.png); */
    /* width: 100vw; */
    min-height: 125vh;
    background-repeat: no-repeat !important;
    background-size: cover;
    margin: 0;
    padding: 0;
    background-position: center;
    background-size: cover;
    object-fit: cover;
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
.logout {
    margin-top: 1%;
    margin-left: 1%;
}
header {
    display: flex;
    justify-content: space-between;
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
footer {
    margin-top: auto;
    display: flex;
    justify-content: space-between;
}
.sociaux {
    margin-right: 15px;
    width: 150px;
    display: flex;
    justify-content: space-between;
}
.whatsap {
    width: 239px;
    margin-top: -10px;
    display: flex;
    justify-content: space-around;
    margin-left: 40%;
    align-items: center;
}
.mobile {
    display: flex;
    align-items: center;
}
.mobile img {
    width: 20px;
    height: 20px;
}
.mobile h2 {
    margin-left: 10px;
    font-size: 130%;
    color: white;
}
.code img {
    margin-top: 10px;
    width: 50px;
    height: 50px;
}
.whatsap div h1 {
    color: #ffaa00;
}
footer div h3 {
    font-weight: bold;
    color: white;
    margin-left: 30px;
    letter-spacing: 4px;
    margin-top: -10px;
    margin-bottom: 10px;
}
.profile {
    margin-left: 2%;
    margin-top: -3%;
}
.profile li {
    color: white;
    font-weight: 800;
    font-size: 120%;
    letter-spacing: 4px;
}
.profile h3 {
    color: #f9a800;
}
.allD {
    display: flex;
}
.body {
    margin-left: 20%;
    width: 50%;
}
.body h1 {
    color: #f9a800;
    font-weight: bold;
    letter-spacing: 2px;
    font-size: 160%;
}
.rendez {
    width: 100%;
    border: solid 2px #444e59;
    border-radius: 10px;
    letter-spacing: 2px;
    font-weight: bold;
}
.rendez div {
    display: flex;
}
.sous-rendez {
    padding: 5px;
    width: 100%;
    height: 50px;

    display: flex;
}
.sous-rendez div {
    padding: 8px;
    color: white;
    text-align: center;
}
.date,
.time {
    width: 30%;
    border-left: 2px solid #444e59;
    text-align: center;
}
.object {
    width: 50%;
    text-align: center;
}
.rendez-content {
    display: flex;
    align-items: center;
    margin-top: 5px;
}
.rendez-content a {
    margin-left: 10px;
}
.All-rendez {
    margin-top: 20px;
}
.historique .rendez-content .rendez {
    width: 94%;
}

hr {
    margin: 20px 0 20px 150px;
    width: 50%;
    text-align: center;
}

.formRDV {
    display: flex;
    flex-wrap: nowrap;
    flex-direction: column;
}
.formRDV input {
    background: none;
    border: 2px solid #f9a800;
    border-radius: 15px;
    height: 32px;
    color: rgb(170, 170, 170);
    padding: 1.5%;
    -webkit-appearance: #f9a800;
    height: 40px;
}
.formRDV select {
    background: none;
    border: 2px solid #f9a800;
    border-radius: 15px;
    height: 32px;
    color: rgb(170, 170, 170);
    -webkit-appearance: none;
    -moz-appearance: none;
    background: url("../assets/option.png");
    background-repeat: no-repeat;
    background-position-x: right;
    background-position-y: center;
    padding: 1.5%;
    height: 40px;
}
.formRDV {
    border: 2px solid #f9a800;
    border-radius: 15px;
    padding: 7%;
    width: 80%;
    margin-left: 11%;
    margin-top: 5%;
    padding-bottom: 3%;
}
select option {
    background-color: #444e59;
    border-radius: 15px;
}
.active {
    border-bottom: 2px solid #f9a800;
}
.btnSubmit {
    height: 40px;
    border-radius: 15px;
    border: none;
    width: 40%;
    background-color: #f9a800;
    color: #252a30;
    font-weight: bold;
    font-size: 16px;
}
.btn {
    display: flex;
    justify-content: space-between;
    flex-direction: row-reverse;
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

.popup {
    margin: 70px auto;
    padding: 20px;
    background: #fff;
    border-radius: 5px;
    width: 50%;
    position: relative;
    /* transition: all 5s ease-in-out; */
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

@media screen and (max-width: 700px) {
    .navbar {
        display: block;
    }
    .logout {
        display: none;
    }
    .menu {
        display: none;
    }
    .allD {
        flex-direction: column;
    }
    .body {
        width: 98%;
        margin-left: 2%;
        font-size: 80%;
    }
    ul {
        width: 100%;
        display: flex;
        justify-content: space-around;
    }
    .names {
        border-right: solid;
        padding-right: 2px;
    }
    .profile {
        font-size: 80%;
        background-color: #444e59;
        margin: 0;
        justify-content: space-between;
        padding-top: 10px;
    }
    .sous-rendez div {
        padding: 8px 0;
        color: white;
        text-align: center;
    }
    hr {
        margin-left: 25%;
    }
    footer {
        background-color: #f9a800;
        margin-top: auto;
        display: flex;
        flex-direction: row;
        height: 10%;
        font-size: 80%;
    }
    footer div h3 {
        margin: 0 0 0 30px;
    }
    footer div {
        margin-top: 10px;
    }
    .whatsap {
        margin-left: 0px;
    }
    .whatsap div {
        margin-left: 0px;
    }
    .whatsap div h1 {
        color: white;
    }

    .logo h2 {
        color: #f9a800;
        font-weight: 700;
        letter-spacing: 2px;
        font-size: 14px;
    }
    .logo img {
        width: 80px;
        height: 50px;
    }
    .popup {
        width: 90%;
    }
    .contentt {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .contentt div {
        flex-direction: column;
    }
    .create {
        margin-left: 28%;
    }
}
</style>