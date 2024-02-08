from behave import *
from hamcrest import assert_that, equal_to, is_, contains_string
from pages.login_page import LoginPage
from pages.forgot_pwd_page import ForgotPasswordPage
from pages.base_class import BaseClass
from pages.common_commands import CommonCommands
import os
from dotenv import load_dotenv
import time


        
@step('The login loads correctly and goes to recover account section')
def step_impl(context):
    context.base_url = 'https://staging.tuily.co/'
    context.login_page = LoginPage(context.browser)
    context.forgot_pwd_page = ForgotPasswordPage(context.browser)
    context.common_commands = CommonCommands(context.browser)
    
    BaseClass(context.browser).navigate_to(context.base_url)
    context.expected_url = 'tuily.co'
    is_url_valid = context.common_commands.get_current_url(context)
    assert_that( is_url_valid, equal_to(True),
                'Not sign in page')
    context.login_page.click_forgotpassword_link()

@step('The user types the email')
def step_impl(context):
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    context.email = os.getenv('EMAIL')
    context.forgot_pwd_page.fill_email(context)

@step('The user click recover password button')
def step_impl(context):
    context.forgot_pwd_page.click_sendlink_button()


@step('Tuily displays a notification and sign up page is loaded')
def step_impl(context):
    context.expected_url = 'tuily.co'
    is_url_valid = context.common_commands.get_current_url(context)
    assert_that( is_url_valid, equal_to(True),
                'Not in onboarding page')


