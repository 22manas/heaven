
var months = ["storeSalesSgls", "sSISuggestedIntakeSgls", " totalStockSgls", " totalStockSglsVsTargetStockSgls", "comSalesSgls", "sSIPlannedIntakeSgls", " storeTargetSgls", " totalStockVsTargetStock", " internationalPlannedIntakeSgls", "salesSgls", "approvedStoreIntakeSgls", " dCTargetSgls", " stockAdjustmentSgls", " internationalApprovedIntakeSg", "unsatisfiedSalesSgls", "cOMIntakeSgls", " totalTargetStockSgls", " gMORIntakeSgls"];
var names = {
  approvedStoreIntakeSgls: "Approved Store Intake Sgls",
cOMIntakeSgls: ".COM Intake Sgls",
comSalesSgls: ".Com Sales Sgls",
dCTargetSgls: "DC Target Sgls",
gMORIntakeSgls: "GMOR Intake Sgls",
internationalApprovedIntakeSgls: "International Approved Intake Sgls",
internationalPlannedIntakeSgls: "International Planned Intake Sgls",
sSIPlannedIntakeSgls: "SSI Planned Intake Sgls",
sSISuggestedIntakeSgls: "SSI Suggested Intake Sgls",
salesSgls: "Sales Sgls",
stockAdjustmentSgls: "Stock Adjustment Sgls",
storeSalesSgls: "Store Sales Sgls",
storeTargetSgls: "Store Target Sgls",
totalStockSgls: "Total Stock Sgls",
totalStockSglsVsTargetStockSgls: "Total Stock Sgls V's Target Stock Sgls",
totalStockVsTargetStock: "Total Stock V's Target Stock %",
totalTargetStockSgls: "Total Target Stock Sgls",
unsatisfiedSalesSgls: "Unsatisfied Sales Sgls"
}
let sortedArray = months.map(matrix => {
  return names[matrix.trim()];
});

console.log(sortedArray);

let raw = [
{header: "Store Sales Sgls", value: false},
{header: ".Com Sales Sgls", value: false},
{header: "Sales Sgls", value: false},
{header: "Unsatisfied Sales Sgls", value: false},
 {header: "GMOR Intake Sgls", value: false},
 {header: "SSI Suggested Intake Sgls", value: false},
{header: "SSI Planned Intake Sgls", value: false},
{header: "International Planned Intake Sgls", value: false},
{header: "Approved Store Intake Sgls", value: false},
{header: "International Approved Intake Sgls", value: false},
 {header: "Stock Adjustment Sgls", value: false},
 {header: "Total Target Stock Sgls", value: false},
 {header: "Store Target Sgls", value: false},
{header: "DC Target Sgls", value: false},
 {header: ".COM Intake Sgls", value: false},
 {header: "Total Stock Sgls", value: false},
{header: "Total Stock Sgls V's Target Stock Sgls", value: false},
{header: "Total Stock V's Target Stock %", value: false}
  ];


mapOrder(raw,sortedArray,'header').map(i => console.log(i));
function mapOrder (array, order, key) {
  
  array.sort( function (a, b) {
    var A = a[key].trim(), B = b[key].trim();
    

 if (order.indexOf(A) < order.indexOf(B)) {
    return -1;
  }
  if (order.indexOf(A) > order.indexOf(B)) {
    return 1;
  }

  // names must be equal
  return 0;
    
  });
  
  return array;
};
