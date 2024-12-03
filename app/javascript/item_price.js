function price(){

  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfitDom = document.getElementById("profit");
  
  priceInput.addEventListener('input', () => {
    addTaxDom.innerHTML =  Math.floor(priceInput.value * 0.1);
    addProfitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1))
  })
}
  window.addEventListener("turbo:load", price);
  window.addEventListener("turbo:render", price);