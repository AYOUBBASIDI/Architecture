<script setup>
import { ref } from '@vue/reactivity';
// import TheWelcome from '@/components/TheWelcome.vue'
const showPopup = ref(false);
</script>

<template>
  <main class="allHome">
    <!-- <TheWelcome /> -->
    <div class="logo">
      <img src="../assets/logo.png" alt />
      <h2>
        <span>At</span>Develop
      </h2>
    </div>
    <div class="content">
      <div class="recherche">
        <form @submit.prevent class="example" style="margin:auto;max-width:300px">
          <input type="text" v-model="Login" placeholder="Identification code.." name="search2" />
          <button @click="check()" type="submit">
            <img src="../assets/Vector.png" alt />
          </button>
        </form>
        <!-- <a href="#modal" class="" aria-controls="modal">
        <h4> Dont Have One ?</h4>
       
        </a>-->
        <form >
          <h4 @click="showPopup = true">Dont Have One ?</h4>
          <div v-if="showPopup" id="popup1" class="overlay">
          
            <div class="popup">
              <h2>Create Your Account</h2>
              <p class="close" @click="showPopup = false">&times;</p>
              <div class="contentt">
                <div>
                  <div class="A1">
                    <label for>First Name</label>
                    <input type="text" name="firstname" v-model="userform.fname"  />
                  </div>
                  <div class="A2">
                    <label for>Last Name</label>
                    <input type="text" v-model="userform.lname"  />
                  </div>
                </div>
                <div>
                  <div class="A1">
                    <label for>Telephone</label>
                    <input type="text" v-model="userform.tel"  />
                  </div>
                  <div class="A2">
                    <label for>Profession</label>
                    <input type="text" v-model="userform.sujet"  />
                  </div>
                </div>
              </div>
              <button type="button" @click="addUser()" class="create">create</button>
            </div>
          </div>
        </form>
      </div>
    </div>
    <div class="title">
      <div class="sous-title">
        <h1 class="h1">DO YOU NEED A</h1>
        <h1 class="h2">NEW HOME?</h1>
        <h1 class="h3">We Make Your Dream Come True!</h1>
      </div>
    </div>
    <div class="detaille">
      <div class="about-us">
        <h3>ABOUT US</h3>
        <p>
          Lorem ipsum dolor sit
          amet, consecteur
          adipiscing elit, sed do
          eiusmod tempor
          incididunt ut labore.
        </p>
      </div>
      <div class="section">
        <div class="construction">
          <img src="../assets/archi.png " alt />
          <h3>CONSTRUCTION</h3>
          <h4>lorem Ipsum</h4>
        </div>
        <div class="CALCULATIONS">
          <img src="../assets/calc.png " alt />
          <h3>CALCULATIONS</h3>
          <h4>lorem Ipsum</h4>
        </div>
        <div class="DRAFT-DESIGN">
          <img src="../assets/pencile.png " alt />
          <h3>DRAFT & DESIGN</h3>
          <h4>lorem Ipsum</h4>
        </div>
      </div>
    </div>
    <footer>
      <div class="whatsap">
        <div class="code">
          <img src="../assets/Group_4.png" alt />
        </div>
        <div>
          <h1>ASK US !</h1>
          <div class="mobile">
            <img src="../assets/whatssap.png" alt />
            <h2>0652086766</h2>
          </div>
        </div>
      </div>
      <div class="sous-footer">
        <h3>CONTACT:</h3>
        <div class="sociaux">
          <div>
            <img src="../assets/Group_1.png" alt />
          </div>
          <div>
            <img src="../assets/Group_2.png" alt />
          </div>
          <div>
            <img src="../assets/Group_3.png" alt />
          </div>
        </div>
      </div>
    </footer>
  </main>
</template>

<script>

export default {
  name: "home-view",
  // mounted() {
  //   fetch("http://localhost/rdv/backend/admin/rdvAll").then(res => res.json()).then(list => {
  //     this.list = list;
  //   })
  // },
  data() {
    return {
      // list: Array(4).fill({ id_r: "", date_r: new Date("2022-03-28"), sujet: "tester", id_creneau: 1, id_client: 1, date_c: "de 10 h a 10:30 h" }).map(v => ({ ...v, id: Math.random() })),
      list: {
        id_r: "",
        date_r: "",
        sujet: "",
        id_creneau: "",
        id_client: "",
        date_c: "",
      },
      client: {},
      Login: "",
      userform: {
        fname: "",
        lname: "",
        tel: "",
        sujet: "",
      },
    }
  },
  methods: {
    showAlert($id) {
      Swal.fire({
      icon: 'success',
      title: 'Your Account has been created<br>Copier your reference<br> ID = '+ $id,
      confirmButtonText: 'Continue',
    }).then((result) => {
  /* Read more about isConfirmed, isDenied below */
  if (result) {
    this.showPopup = false
    window.location="/"
  }
    
  })
    

    },
    check() {
      fetch("http://localhost/rdv/backend/admin/index", {
        method: "POST",
        body: this.Login,

      }).then(Response => Response.json())
        .then((result) => {
          if (result) {
            this.$router.push("/admin");
          }
          else {
            fetch("http://localhost/rdv/backend/User/index", {
              method: "POST",
              body: this.Login,
            }).then(Response => Response.json())
              .then((result) => {
                if (result) {
                  localStorage.setItem("id", result.id);
                  this.$router.push("/dashboard");
                }else{
                  Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Identification code is incorrect!',
                    
                  })
                  }
              })
          }


        })

    },
    
      addUser() {
      if(this.userform.fname != "" && this.userform.lname != "" && this.userform.tel != "" && this.userform.sujet != ""){
        // console.log(this.)
      fetch("http://localhost/rdv/backend/User/register", {
        method: "POST",
        body: JSON.stringify(this.userform),

      })
        .then((result) => {
          return result.json();

        })
        .then((data) => {
          if (data) {
            this.showAlert(data[4]);
            this.$router.push("/");
            // this.form = !this.form

          }
          // this.add(data);
        });
      }else{
        Swal.fire(
          'The Internet?',
          'Some input is empty?',
          'question'
        )
      }
    },
    
  }
}
</script>

<style scoped>
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
.allHome {
  background-image: url(../assets/back.png);
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
form.example input[type="text"] {
  padding: 10px;
  font-size: 17px;
  float: left;
  width: 80%;
  background: #eaeaea;
  border: none;
  border-radius: 30px 0 0 30px;
}

form.example button {
  float: left;
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

form.example button:hover {
  background: #f9a800;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}
.content {
  margin-top: 40px;
  display: flex;
  justify-content: end;
  padding-right: 150px;
}
button img {
  height: 25px;
  margin-top: 4px;
}

.recherche h4 {
  color: white;
  font-weight: 100;
  margin-left: 20px;
  margin-top: 7px;
  cursor: pointer;
}
.recherche h4:hover {
  text-decoration: underline;
}
a {
  text-decoration-color: #f9a800;
}
.title {
  padding-right: 50px;
  color: white;
  display: flex;
  justify-content: flex-end;
}
.sous-title {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
}
.h1 {
  font-size: 50px;
}
.h2 {
  font-size: 90px;
  font-weight: bold;
  margin-top: -30px;
}
.h3 {
  font-size: 40px;
  color: #ffaa00;
  margin-top: -30px;
}
.detaille {
  margin-top: 40px;
  color: white;
  display: flex;
  justify-content: space-between;
}
.about-us {
  width: 183px;
  margin-left: 20px;
  letter-spacing: 0.1em;
  margin-top: -29px;
  color: black;
  border-bottom: 3px solid black;
}
.about-us h3 {
  font-weight: bold;
}
.section {
  padding-right: 154px;
  display: flex;
  width: 775px;
  justify-content: space-between;
}
.section img {
  width: 60px;
  height: 70px;
  margin-bottom: 20px;
}
.construction,
.CALCULATIONS,
.DRAFT-DESIGN {
  display: flex;
  align-items: center;
  flex-direction: column;
}
.section div h3 {
  font-weight: bold;
}
.section div h4 {
  color: #bfbfbf;
}
footer {
  margin-top: 40px;
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
  margin-top: -30px;
  display: flex;
  justify-content: space-around;
  margin-left: 350px;
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

@media (max-width: 600px) {
  .allHome {
    background-image: url(../assets/iPhone_11_Pro_Max_-_1.png);
    height: auto;
  }
  .logo img {
    width: 80px;
    height: 50px;
  }
  .logo h2 span {
    color: white;
    font-weight: 700;
  }
  .logo h2 {
    color: #f9a800;
    font-weight: 700;
    letter-spacing: 2px;
    font-size: 14px;
  }
  .content {
    padding-right: 30px;
    margin-top: 53px;
  }
  .title {
    padding-right: 50px;
    color: white;
    display: flex;
    justify-content: flex-end;
  }
  .sous-title {
    display: flex;
    flex-direction: column;
    align-items: flex-end;
  }
  .h1 {
    font-size: 30px;
  }
  .h2 {
    font-size: 55px;
    margin-top: -10px;
  }
  .h3 {
    font-size: 23px;
    margin-top: -10px;
  }
  .detaille {
    flex-direction: column;
  }
  .section {
    margin-right: 0;
    width: 390px;
    padding: 20px;
  }
  .detaille {
    flex-direction: column-reverse;
  }
  .about-us {
    margin-top: 38%;
    margin-left: 228px;
  }
  .section img {
    width: 50px;
    height: 60px;
    margin-bottom: 20px;
  }
  .section div h3 {
    font-weight: bold;
    font-size: 80%;
  }
  footer {
    flex-direction: column;
    margin-top: -206px;
  }
  .whatsap {
    margin-left: 0;
    margin-top: -20%;
  }
  .sous-footer {
    margin-top: 66%;
  }
  .sociaux {
    margin-left: 10px;
    width: 210px;
  }
}

/* 
.box {
  width: 40%;
  margin: 0 auto;
  background: rgba(255,255,255,0.2);
  padding: 35px;
  border: 2px solid #fff;
  border-radius: 20px/50px;
  background-clip: padding-box;
  text-align: center;
} */

.button {
  font-size: 1em;
  padding: 10px;
  color: #fff;
  border: 2px solid #06d85f;
  border-radius: 20px/50px;
  text-decoration: none;
  cursor: pointer;
  transition: all 0.3s ease-out;
}
.button:hover {
  background: #06d85f;
}

.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  z-index: 10;
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
  cursor: pointer;
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
  transition: all 200ms;
}

@media screen and (max-width: 700px) {
  /* .box{
    width: 70%;
  } */
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
