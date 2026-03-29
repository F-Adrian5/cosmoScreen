<script lang="ts" setup>
  import { ref, computed } from 'vue';
  import type { ProfilUserdata } from '@/types/User';
  import { useAuthStore } from '@/stores/auth';
  import { useRouter } from 'vue-router';
  import { profileServices } from '@/services/profileServices';
  import { validEmail } from '@/utils/validation';

  //Initialize custom type
  let user = ref<ProfilUserdata>({
    name: '',
    email: '',
    isDisabled: true,
    originalName: '',
    originalEmail: '',
  });

  //Checks if there is a change in the inputs
  const isChanged = computed(() => {
    return (
      user.value.name !== user.value.originalName ||
      user.value.email !== user.value.originalEmail
    );
  });

  //Checks if everything is valid in this function
  const canSubmit = computed(() => {
    return (
      isChanged.value &&
      user.value.name.trim() !== '' &&
      validEmail(user.value.email)
    );
  });

  // Store the user condition in auth varriable
  const auth = useAuthStore();

  // Use it for navigation
  const router = useRouter();

  // Logout function
  const logout = () => {
    
    // Log out
    auth.logout();

    // Redirect to home page
    router.push('/');
  };

  // Check if there is a logged in user
  if (auth.user) {

    // Take the user name and email from store and copy it
    user.value.name = auth.user.name;
    user.value.email = auth.user.email;

    user.value.originalName = auth.user.name;
    user.value.originalEmail = auth.user.email;
  }

  //Update function
  async function updateProfile() {

    //If its not submitable than it returns
    if (!canSubmit.value) return;

    const auth = useAuthStore();

    try {

      //Get user data
      let response = await profileServices.getUserData(
        auth.user.id,
        user.value.name,
        user.value.email
      );

      //Refresh the store and the local storage
      auth.login(response.data);

      //Feedback
      alert("Profil frissítve!");
      user.value.originalName = user.value.name;
      user.value.originalEmail = user.value.email;

      //Disable the inputs
      user.value.isDisabled = true;
      
      //Server error
    } catch (err: any) {
      console.error(err);
      alert(err.response?.data?.message || "Hiba a profil frissítésénél");
    };
  };

</script>

<template>
  <div class="d-flex justify-content-center align-items-center mt-5">
    <form class="p-4 shadow rounded mt-5"
          style="width: 100%; max-width: 500px;">

      <div class="position-relative mb-4">

        <!--title-->
        <h4 class="text-center fw-bold mb-0">
          <i class="fa-solid fa-address-card"></i>
            {{ $t('profilePage.profileTitle') }}
        </h4>

        <!--Edit btn-->
        <button type="button"
                  class="btn btn_submit btn-sm px-3 fw-semibold 
                         position-absolute top-50 end-0 translate-middle-y"
                  @click="user.isDisabled = !user.isDisabled">
              <i class="fa-regular fa-pen-to-square"></i>
        </button>
      </div>

      <!--name-->
      <div>
        <label for="register_name" 
               class="form-label fw-semibold">
            <i class="fa-solid fa-signature mx-2"></i>
          {{ $t('profilePage.name') }}
        </label>

        <input type="text"
               class="form-control form-control-lg"
               id="register_name"
               v-model="user.name"
               name="name"
               maxlength="100"
               :disabled="user.isDisabled"
               required>

        <!--name error-->
        <div class="text-danger mt-1 small" 
             style="min-height: 42px;">
          <span v-if="user.name && !/^[a-zA-ZáéíóöőúüűÁÉÍÓÖŐÚÜŰ -]+$/.test(user.name)">
           {{ $t('profilePage.nameError') }}
          </span>
        </div>
      </div>

      <!-- Email -->
      <div class="mb-3">
        <label for="register_email" 
               class="form-label fw-semibold">
               <i class="fa-solid fa-envelope mx-2"></i>
          {{ $t('profilePage.email') }}
        </label>

        <input type="email"
               class="form-control form-control-lg"
               id="register_email"
               v-model="user.email"
               name="email"
               maxlength="150"
               :disabled="user.isDisabled"
               required>

        <!--Email error-->
        <div class="text-danger mt-1 small" 
             style="min-height: 22px;">
          <span v-if="user.email && !validEmail(user.email)">
           {{ $t('profilePage.emailError') }}
          </span>
        </div>
      </div>

      <!--Modify password btn-->
      <RouterLink class="text-light px-2 link-underline 
                         link-underline-opacity-0"
                  to="/password">

        <button type="button"
                class="btn btn-primary w-100 fw-semibold">
                <i class="fa-solid fa-unlock-keyhole"></i>
          {{ $t('profilePage.modifyPassword') }}
        </button>
      </RouterLink>

      <div class="row mt-3">
        <div class="col-md-6 mb-3">

          <!-- Change data btn-->
          <button type="button"
                  class="btn btn_submit w-100 fw-semibold mt-2"
                  @click="updateProfile"
                  :disabled="!canSubmit">
              <i class="fa-regular fa-pen-to-square"></i>
              {{$t('profilePage.changeDataButton')}}
          </button>
        </div>
         <div class="col-md-6 mb-3">

          <!--Logout btn-->
          <button type="button"
                  class="btn btn-danger w-100 fw-semibold mt-2"
                  @click="logout()">
              <i class="fa-solid fa-arrow-right-from-bracket"></i>
              {{ $t('profilePage.logoutButton') }}
          </button>
         </div>
      </div>
    </form>
  </div>
</template>

<style>
  .profile-bg {
    background-image: radial-gradient(circle, #63a3a4, #57828e, #4e626f, #41454d, #2c2c2c);
  };
</style>