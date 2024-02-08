from behave import *
from hamcrest import assert_that, equal_to, is_, contains_string
import os
from dotenv import load_dotenv
from pages.login_page import LoginPage
from pages.base_class import BaseClass
from pages.common_commands import CommonCommands
import time

@step('I login with valid email')
def step_impl(context):
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    context.email = os.getenv('EMAIL')
    context.password = os.getenv('PASSWORD')
    context.login_page.fill_login_email(context)
    context.login_page.fill_login_pass(context)
    context.login_page.click_login_btn()

@step('I open the login page')
def step_impl(context):
    context.base_url = 'https://staging.tuily.co/'
    context.login_page = LoginPage(context.browser)
    context.common_commands = CommonCommands(context.browser)
    BaseClass(context.browser).navigate_to(context.base_url)

@step('I should get access to my account')
def step_impl(context):
    context.expected_url = 'registration_forms'
    is_url_valid = context.common_commands.get_current_url(context)
    assert_that( is_url_valid, equal_to(True),
                'Not in onboarding page')

@step('I login with invalid email')
def step_impl(context):
    context.email = "invalid@koombea.com"
    context.password = "invalid"
    context.login_page.fill_login_email(context)
    context.login_page.fill_login_pass(context)
    context.login_page.click_login_btn()
    
@step('Tuily validates that the inserted data is invalid and display a notification')
def step_impl(context):
     is_visible = context.login_page.is_notification_visible()
     assert_that( is_visible, equal_to(True),
                'The notification is not visible.')

@step('The user click the recover account link')
def step_impl(context):
    context.login_page.click_forgotpassword_link()

@step('The user click the Register button')
def step_impl(context):
    context.login_page.click_signup_link()

@step('The recover password page loads')
def step_impl(context):
    context.expected_url = 'password'
    is_url_valid = context.common_commands.get_current_url(context)
    assert_that( is_url_valid, equal_to(True),
                'Not recover password page')
    
@step('The Register account page loads')
def step_impl(context):
    context.expected_url = 'sign_up'
    is_url_valid = context.common_commands.get_current_url(context)
    assert_that( is_url_valid, equal_to(True),
                'Not sign up page')
    
@step('The web page loads correctly')
def step_impl(context):
    context.expected_url = 'sign_in'
    is_url_valid = context.common_commands.get_current_url(context)
    assert_that( is_url_valid, equal_to(True),
                'Not sign in page')
    