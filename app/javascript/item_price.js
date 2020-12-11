window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfitDom = document.getElementById("profit");
    priceInput.addEventListener("input", () => {
    const priceValue = priceInput.value
    addTaxDom.innerHTML = priceValue * 0.1
    addProfitDom.innerHTML = priceValue * 0.9
  })
});