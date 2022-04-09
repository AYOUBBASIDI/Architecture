<template>
  <main class="all">
    <header>
      <div class="logout">
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
              <a href="http://localhost:3000/dashboard">Dashboard</a>
            </li>
            <li>
              <a href="http://localhost:3000/historical">Historical</a>
            </li>
            <li>
              <a href="http://localhost:3000">Log Out</a>
            </li>
          </div>
        </div>
      </div>
      <div class="menu">
        <ul>
          <li>
            <router-link class="active" to="/dashboard">Dashboard</router-link>
            <!-- <a href="#">Dashboard</a> -->
          </li>
          <li>
            <!-- <a href="#" class="active">Historical</a> -->
            <router-link to="/historique">Historical</router-link>
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
            <h3>{{ userLog.fname }} {{ userLog.lname }}</h3>
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

      <div class="contentD">
        <div class="rdv">
          <div class="head">
            <h1>MAKE</h1>
            <h3>&nbsp;&nbsp;&nbsp;an appointment</h3>
          </div>
          <form  class="formRDV">
            <!-- <select>
              <option selected>Choose the Subject</option>
              <option value="#">Build a House</option>
              <option value="#">Build a House</option>
              <option value="#">Build a House</option>
            </select>-->
            <input type="text" v-model="NewRDV.sujet" />
            <br />
            <input
              @change="getcreDate()"
              v-model="NewRDV.date"
              type="date"
              :min="new Date().toISOString().substr(0, 10)"
              placeholder="Choose the Time"
            />
            <br />
            <select v-model="NewRDV.id_creneau">
              <option selected>Choose the time</option>
              <option v-for="cro in crono" :key="cro">{{cro}}</option>
            </select>
            <br />
            <input @click="newrdv()" type="button" class="btnSubmit" value="Submit">
          </form>
        </div>
      </div>

      <div class="help">
        <div class="step">
          <h1>01</h1>
          <hr />
          <h2>fill in the form</h2>
        </div>
        <div class="step">
          <h1>02</h1>
          <hr />
          <h2>Make an appointment</h2>
        </div>
        <div class="step">
          <h1>03</h1>
          <hr />
          <h2>And welcome</h2>
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
  name: "dach",
  data() {
    return {
      id: localStorage.getItem("id"),
      userLog: {},
      NewRDV: {
        id_client: localStorage.getItem("id"),
        sujet: "",
        date: "",
        id_creneau: ""
      },
      crono:""
    }
  },
  methods: {

    showAlert() {
      Swal.fire({
      icon: 'success',
      title: 'Your Appointment has been created',
      confirmButtonText: 'Continue',
    }).then((result) => {
      if (result) {
        this.showPopup = false
        window.location="/dashboard"
      }
  })
  },



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
    newrdv() {
      if(this.NewRDV.sujet != "" && this.NewRDV.date != "" && this.NewRDV.id_creneau != ""){
        fetch(`http://localhost/rdv/backend/User/addRDV`, {
                method: "POST",
                body:JSON.stringify(this.NewRDV)
              }).then((reponse => {
                return reponse.json();
              })).then((data) => {
                if (data) {
                  this.showAlert();
                 }
              
              });
            }else{
              Swal.fire(
                'The Internet?',
                'Some input is empty?',
                'question'
              )
            }

      },
      
    getcreDate(){
      fetch(`http://localhost/rdv/backend/User/getcreDate?date=${this.NewRDV.date}`,{
        method:"GET",
      }).then((repon)=>{
        return repon.json();
      }).then((rest)=>{
        this.crono=rest;

      })
    }

  },
  mounted() {
    this.getUser();
  },


}

</script>


<style scoped>
* {
  font-family: "Roboto";
}
.rdv form input{
cursor: pointer;
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
  margin-top: 5%;
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
  justify-content: space-between;
  padding-right: 20px;
}

.rdv {
  margin-right: 7em;
  width: 120%;
}
.head h1 {
  color: #f9a800;
  font-weight: bold;
  font-size: 60px;
}
.head h3 {
  font-size: 40px;
  color: white;
  margin-top: -6%;
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
  margin-left: 15%;
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
  width: 50%;
  margin-left: auto;
  background-color: #f9a800;
  color: #252a30;
  font-weight: bold;
  font-size: 16px;
}
.help h2 {
  color: white;
  text-align: right;
}
.help h1 {
  color: #f9a800;
}
hr {
  background-color: white;
  border-color: white;
  font-size: 10px;
}
.step {
  margin-bottom: 20px;
}
.help {
  padding: 2%;
  border-left: 2px solid #444e59;
  height: 100%;
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

@media screen and (max-width: 700px) {
  .navbar {
    display: block;
  }
  .logo h2 {
    color: #f9a800;
    font-weight: 700;
    letter-spacing: 2px;
    font-size: 10px;
  }
  .logo {
    padding: 5px;
    margin-top: -7%;
  }
  .logo img {
    width: 60px;
    height: 30px;
  }
  .logout {
    display: none;
  }
  .head h1 {
    color: #f9a800;
    font-weight: bold;
    font-size: 40px;
    text-align: center;
    margin-top: 5%;
  }
  .head h3 {
    font-size: 30px;
    text-align: center;
    color: white;
    margin-top: -6%;
  }
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
    width: 105%;
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
    margin-top: 29%;
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
  /* .logo {
    height: 130px;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    justify-content: center;
    padding: 30px;
    } */

  .help {
    padding: 2%;
    border-left: 2px solid #444e59;
    height: 100%;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    margin-top: 15%;
  }
  .help h1 {
    color: #f9a800;
    font-size: 25px;
    text-align: center;
  }
  .help h2 {
    color: white;
    text-align: center;
    font-size: 20px;
  }
  .step {
    margin-bottom: 20px;
    border-right: 2px solid white;
  }
  .formRDV {
    width: 90%;
    margin-left: 7%;
    margin-top: 5%;
  }
  .rdv {
    width: 100%;
  }
}
</style>