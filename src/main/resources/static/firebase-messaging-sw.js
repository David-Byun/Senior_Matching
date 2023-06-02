importScripts('https://www.gstatic.com/firebasejs/5.9.2/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/5.9.2/firebase-messaging.js');

// TODO: Add SDKs for Firebase products that you want to use
    // https://firebase.google.com/docs/web/setup#available-libraries

    // Your web app's Firebase configuration
    // For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyCfchQsojha5qRfexQ7faKMa0p4ebjH260",
    authDomain: "nwitter-4c3ea.firebaseapp.com",
    projectId: "nwitter-4c3ea",
    storageBucket: "nwitter-4c3ea.appspot.com",
    messagingSenderId: "613082594223",
    appId: "1:613082594223:web:54d455061bff28bb9c0d5a",
    measurementId: "G-KH0RN141KL"
};

// Initialize Firebase
const app = firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();
