const pay = () =>{
  const form = document.getElementById('button')
  form.addEventListener('submit', (e) => {
    console.log("hakka")
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);