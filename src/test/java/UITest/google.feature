Feature: Google search

  Background:
    # This driver setting below solved the 403 forbidden error trying to get the page
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }

  @test
  Scenario: Testing google successful search
    Given driver "https://google.com"
