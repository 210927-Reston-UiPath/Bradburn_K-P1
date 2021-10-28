# Bradburn_K-P1

RoSa 2.0 now uses Pega and Shop-Shop!
All of the client information is stored in a PostgreySQL database. There is a fucntion to reset to a base state that I used for testing called "Reset Database", always run that before anyother function.
Add Client is automated. Make sure the sheet is added and the user information is entered with no headers in the format:

| Name | Email | Order | Quantity |
| ------ | ---- | --------- | ------------- |

An expense report is made and output to Execl in the same file for AddClient.xlsx, I only did this for size complexity reasons.

Another function will send personalized receipts to users based off of their orders and what they ordered.
Improvements include automated DB management to reset and reboot the DB so you can easily manage it. If you want it to be built empty and not in a test state remove the SQL line after tables are created.




## MVP
- [x] Robot should be able to take client shopping lists and place orders on the appropriate vendors
- [x] Robot should record the total expense of each shopping trip for each client
- [x] Robot should be able to record any items that were out of stock or not found
- [x] Robot should be able to add clients to the existing client list and take in their shopping order
- [x] Robot should shop from at least 2 vendors
- [x] One of the vendors should be Pega
- [x] The other vendor should be a self made shop using HTML, CSS, and JS

## Stretch Goals
- [x] Sending emails to clients about their shopping order
- [ ] Notify clients about vendor discounts/sales
- [x] Any other extra features that would improve UX
- [ ] Send client expense report in excel format
- [ ] Personal shop gives you some form of receipt after purchase
- [ ] Shopping groups for clients based on some schedule

## Constraints
- [x] Client information should be stored in a DB
- [x] Vendor information should be stored in a webpage
- [x] Expense Reports should be stored in a DB
- [x] Automations should have exception handling enabled
- [x] DB tables should be 3NF


## Tech Stack
- UiPath Studio
- HTML/CSS
- JS
