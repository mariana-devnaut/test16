from behave import *
from hamcrest import assert_that, equal_to, is_, contains_string
from pages.login_page import LoginPage
from pages.forgot_pwd_page import ForgotPasswordPage
from pages.base_class import BaseClass
from pages.common_commands import CommonCommands
from pages.menu_page import MenuPage
from pages.card_page import CardPage
import os
from dotenv import load_dotenv
import time

card_name = CommonCommands.get_random_name()
        
@step('The login loads correctly and goes to card request section')
def step_impl(context):
    #Load env variables
    dotenv_path = os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    context.email = os.getenv('EMAIL_TEST')
    context.password = os.getenv('PASSWORD_TEST')

    #Load page objects class and url
    context.base_url = 'https://staging.tuily.co/'
    context.login_page = LoginPage(context.browser)
    context.forgot_pwd_page = ForgotPasswordPage(context.browser)
    context.common_commands = CommonCommands(context.browser)
    context.menu_page = MenuPage(context.browser)
    context.card_page = CardPage(context.browser)

    #Navigate to Tuily URL
    BaseClass(context.browser).navigate_to(context.base_url)

    #Validate that destination page was loaded succesfully
    context.expected_url = 'tuily.co'
    is_url_valid = context.common_commands.get_current_url(context)
    assert_that(is_url_valid, equal_to(True),'Not sign in page')

    #Login with a valid user
    context.login_page.fill_login_email(context)
    context.login_page.fill_login_pass(context)
    context.login_page.click_login_btn()

    #Go to card section
    context.menu_page.click_cards_option()
    
@step('The users wants a new card')
def step_impl(context):
    time.sleep(2)
    context.card_page.click_add_card_button()
    time.sleep(3)

@step('The user types card name')
def step_impl(context):
    context.name = card_name
    context.card_page.type_card_name(context)

@step('The user types card allowance')
def step_impl(context):
    context.allowance = '250'
    context.card_page.type_card_allowance(context)
 

@step('The user selects the card responsible')
def step_impl(context):
    context.responsible = 'Angie Hernandez'
    context.card_page.select_responsible(context)

@step('The user selects "{card}" card')
def step_impl(context, card):
    context.card_option = card
    context.card_page.select_card_option(context)

@step('The user click request card button')
def step_impl(context):
    context.card_page.click_save_card()

@step('The user see a success notification message')
def step_impl(context):
    time.sleep(2)
    is_visible = context.card_page.is_notification_visible()
    assert_that(is_visible, equal_to(True),'Notification is not displayed')
    time.sleep(1)
    context.card_page.click_ok_button()
    time.sleep(1)
    
@step('The user verify the newly added card')
def step_impl(context):
    time.sleep(2)
    context.last_card_request = card_name
    context.card_page.click_card_request_list(context)
    time.sleep(1)
    is_visible = context.card_page.is_card_title_visible(context)
    assert_that(is_visible, equal_to(True),'Card is not displayed')

@step('The user should see an error displayed below the input related to card information')
def step_impl(context):
    time.sleep(2)
    is_visible  = context.card_page.is_error_visible()
    assert_that(is_visible, equal_to(True),'Error is not displayed')
    time.sleep(1)

@step('The user should see an error displayed below the input related to allowance')
def step_impl(context):
    time.sleep(2)
    is_visible  = context.card_page.is_allowance_error_visible()
    assert_that(is_visible, equal_to(True),'Error is not displayed')
    time.sleep(1)

@step('The user blocks the recently added card - "{reason}"')
def step_impl(context, reason):
    context.name = card_name
    context.block_reason = reason
    time.sleep(2)
    context.card_page.select_card_from_list(context)
    time.sleep(1)
    context.card_page.click_stop_button()
    context.card_page.select_block_reason(context)
    context.card_page.click_save_block_button()
    
@step('The users verify the card is blocked')
def step_impl(context):
    time.sleep(1)
    is_visible  = context.card_page.is_stop_button_visible()
    assert_that(is_visible, equal_to(False),'Stop button is still visible')
    time.sleep(1)