# Our Pharmacy Project — Simple Plan

## What we are making

A small website for a pharmacy shop.

With the website, the shop can:

1. See all medicines it has.
2. Add a new medicine.
3. Sell medicine to a customer.
4. See all the sales it made before.

The information is kept in a safe place called the **database**.
Think of it as a shop register that remembers everything,
even after the computer is switched off.

---

## What is already ready

- The safe place (database) is set up.
- It already has 2 suppliers and 3 medicines in it.
  - Panadol 500mg
  - Augmentin 625mg
  - Brufen Syrup
- The website can already talk to that safe place.
- The website opens a simple first page.
- One rule already works:
  **we cannot sell more medicine than we have.**

So we are not starting from zero. We just need to build the pages.

---

## What we still need to do

### Step 1 — Make the first page useful

- Put buttons or links on the first page:
  - Medicines
  - Sell
  - Past sales
- Make the page clean and easy to read.

### Step 2 — Show the medicines

- Make a page that shows all medicines in a list/table.
- For each medicine, show:
  - name
  - price
  - how many are left
  - expiry date
  - supplier
- Add a search box to find a medicine by name.

### Step 3 — Add a new medicine

- Make a page with boxes to fill in:
  - name
  - type
  - price
  - how many
  - expiry date
  - supplier
- When we press **Save**, the new medicine must appear in the list.
- If something is empty or wrong, show a kind message like
  "Please fill in the name."

### Step 4 — Sell medicine

- Make a page where we:
  - pick a medicine
  - type how many the customer wants
  - type the customer name (or leave it blank)
- Before finishing, check:
  - Do we have enough? If not, say "Not enough stock."
- When the sale is finished:
  - the number of medicines left must go down
  - the sale must be saved so we can see it later
  - the total price must be shown

### Step 5 — See past sales

- Make a page that shows all sales:
  - date
  - customer name
  - what was bought
  - total money
- Let us click one sale to see its details.

### Step 6 — Try to break it (testing)

Try these and make sure nothing silly happens:

- Try to sell more than we have → must be stopped.
- Try to add a medicine with no name → must be stopped.
- Sell the very last piece of a medicine → stock must become 0.
- Check that the total money matches the items sold.
- Refresh the page → the information must still be there.

---

## If we split the work

- One person: makes the pages look nice.
- One person: builds the "medicines" page and the "add medicine" page.
- One person: builds the "sell" page.
- One person: builds the "past sales" page.
- One person: tries to break everything and writes down the problems.

If someone finishes early, they help the others.

---

## What "finished" looks like

We can open the website and do all four things
without typing any special commands:

- see medicines
- add a medicine
- sell a medicine
- see past sales

And when we close the browser and come back,
everything we did is still there.
