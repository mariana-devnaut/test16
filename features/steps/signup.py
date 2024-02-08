from behave import *
from hamcrest import assert_that, equal_to, is_, contains_string
from pages.login_page import LoginPage
from pages.base_class import BaseClass
from pages.signup_page import SignUp
from pages.common_commands import CommonCommands
import time

@step('I open the login page for signup')
def step_impl(context):
    context.base_url = 'https://staging.tuily.co/'
    context.login_page = LoginPage(context.browser)
    context.signup_page = SignUp(context.browser)
    context.common_commands = CommonCommands(context.browser)
    BaseClass(context.browser).navigate_to(context.base_url)

        
@step('The login loads correctly')
def step_impl(context):
    context.expected_url = 'tuily.co'
    is_url_valid = context.common_commands.get_current_url(context)
    assert_that( is_url_valid, equal_to(True),
                'Not sign in page')
    context.login_page.click_signup_link()

@step('The user type the first name')
def step_impl(context):
    context.first_name = "Test"
    context.signup_page.fill_signup_name(context)

@step('The user type the last name')
def step_impl(context):
    context.last_name = "Test"
    context.signup_page.fill_signup_lastname(context)

@step('The user type the email')
def step_impl(context):
    context.email = CommonCommands.get_random_email()
    context.signup_page.fill_signup_email(context)

@step('The user type a password')
def step_impl(context):
    context.password = "Staging01!"
    context.signup_page.fill_password_input(context)

@step('The user accept the terms and conditions')
def step_impl(context):
    context.signup_page.click_terms_checkbox()

@step('The users accepts the personal data handling agreement')
def step_impl(context):
    context.signup_page.click_personaldata_checkbox()

@step('The users accepts the digital sign agreement')
def step_impl(context):
    context.signup_page.click_digitalsignature_checkbox()

@step('The users clicks Create account button')
def step_impl(context):
    context.signup_page.click_createaccount_btn()

@step('Tuily creates a new account and displays onboarding page')
def step_impl(context):
    context.expected_url = 'registration_forms'
    is_url_valid = context.common_commands.get_current_url(context)
    assert_that( is_url_valid, equal_to(True),
                'Not in onboarding page')
    time.sleep(5)

@step('Tuily displays an error message with a validation error')
def step_impl(context):
    context.expected_url = 'sign_up'
    is_url_valid = context.common_commands.get_current_url(context)
    assert_that( is_url_valid, equal_to(True),
                'Not sign up page')
    time.sleep(5)
