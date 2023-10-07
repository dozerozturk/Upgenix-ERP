package step_definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.Keys;
import pages.LoginPage;
import pages.UserInboxPage;
import utilities.ConfigReader;
import utilities.Driver;

public class Login_StepDefinitions {

    LoginPage loginPage = new LoginPage();
    UserInboxPage userInboxPage = new UserInboxPage();



    @Given("user is on the UPGENIX login page")
    public void user_is_on_the_upgenix_login_page() {
        String url = ConfigReader.getProperty("webLoginPage");
        Driver.getDriver().get(url);
    }
    @When("user enters username {string}")
    public void user_enters_username(String arg0) {
        loginPage.inputLogin.sendKeys(arg0);
    }
    @When("user enters password {string}")
    public void user_enters_password(String arg0) {
        loginPage.inputPassword.sendKeys(arg0);
    }
    @When("user clicks on the Login button")
    public void user_clicks_on_the_login_button() {
        loginPage.buttonLog.click();
    }
    @Then("user is on the Inbox page")
    public void user_is_on_the_inbox_page() {
        Assert.assertTrue(userInboxPage.userInbox.isDisplayed());
    }


    @Then("user should see Wrong login or password message")
    public void userShouldSeeWrongLoginOrPasswordMessage() {
        Assert.assertTrue(loginPage.pWrongLoginPassword.isDisplayed());
    }

    @Then("user should get - \\(Please fill out this field.) warning message")
    public void userShouldGetPleaseFillOutThisFieldWarningMessage() {
        Assert.assertEquals("true", loginPage.inputLogin.getAttribute("required"));
    }


    @When("user {string} enters password {string}")
    public void userEntersPassword(String login, String password) {
        loginPage.inputLogin.sendKeys(login);
        loginPage.inputPassword.sendKeys(password);
    }

    @Then("user should see the password in bullet signs by default")
    public void userShouldSeeThePasswordInBulletSignsByDefault() {
        Assert.assertEquals("password", loginPage.inputPassword.getAttribute("type"));
    }


    @And("press \\(Enter) key")
    public void pressEnterKey() {
        loginPage.inputPassword.sendKeys(Keys.ENTER);
    }
}
