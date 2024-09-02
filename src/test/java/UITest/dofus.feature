Feature: dofus website

  Background:
    # This driver setting below solved the 403 forbidden error trying to get the page
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }

  Scenario: testing dofus resgister page
    Given driver "https://www.dofus.com/es"