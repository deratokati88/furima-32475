window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfitDom = document.getElementById("profit");
    priceInput.addEventListener("input", () => {
    const priceValue = priceInput.value
    addTaxDom.innerHTML = Math.round(priceValue * 0.1) 
    addProfitDom.innerHTML = Math.round(priceValue - priceValue * 0.1)
  })
});