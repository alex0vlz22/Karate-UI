Feature: Testing SauceDemo login

  Background:
    # This driver setting below solved the 403 forbidden error trying to get the page
    * configure driver = { type: 'chrome', addOptions: ["--remote-allow-origins=*"] }
    Given driver "https://www.saucedemo.com/v1/"
    And driver.maximize()

  Scenario: standard user
    And input("//*[@id='user-name']","standard_user")
    And input("//*[@id='password']","secret_sauce")
    When click("//*[@id='login-button']")
    #Then match driver.url contains "inventory.html"
    Then waitForUrl("inventory.html")

  Scenario: locked out user
    And input("#user-name", "locked_out_user")
    And input("#password", "secret_sauce")
    When click("#login-button")
    Then waitForText("h3", "Epic sadface: Sorry, this user has been locked out.")

  Scenario: problem user
    And input("#user-name", "problem_user")
    And input("#password", ["secret_sauce", Key.ENTER], 200)
    Then waitForUrl("inventory.html")
      # to be continued

  Scenario: performance glitch user
    And input("#user-name", "performance_glitch_user")
    And input("#password", ["secret_sauce", Key.ENTER], 200)
    Then retry().waitForUrl("inventory.html")
