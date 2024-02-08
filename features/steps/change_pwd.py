from behave import *
from hamcrest import assert_that, equal_to, is_, contains_string
from pages.login_page import LoginPage
from pages.security_page import SecurityPage
from pages.menu_page import MenuPage
from pages.base_class import BaseClass
from pages.common_commands import CommonCommands
import os
from dotenv import load_dotenv
import time


        
@step('The users log in with specific user')
def step_impl(context):
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    context.email = os.getenv('EMAIL_PWD')
    context.password = os.getenv('CURRENT_PASSWORD_PWD')
    context.base_url = 'https://staging.tuily.co/'
    context.login_page = LoginPage(context.browser)
    context.security_page = SecurityPage(context.browser)
    context.common_commands = CommonCommands(context.browser)
    context.menu_page = MenuPage(context.browser)

    BaseClass(context.browser).navigate_to(context.base_url)
    context.expected_url = 'tuily.co'
    is_url_valid = context.common_commands.get_current_url(context)
    assert_that( is_url_valid, equal_to(True), 'Not sign in page')
    context.login_page.fill_login_email(context)
    context.login_page.fill_login_pass(context)
    context.login_page.click_login_btn()

@step('The users log in with specific user - negative')
def step_impl(context):
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    context.email = os.getenv('EMAIL_TEST')
    context.password = os.getenv('PASSWORD_TEST')
    context.base_url = 'https://staging.tuily.co/'
    context.login_page = LoginPage(context.browser)
    context.security_page = SecurityPage(context.browser)
    context.common_commands = CommonCommands(context.browser)
    context.menu_page = MenuPage(context.browser)

    BaseClass(context.browser).navigate_to(context.base_url)
    context.expected_url = 'tuily.co'
    is_url_valid = context.common_commands.get_current_url(context)
    assert_that( is_url_valid, equal_to(True), 'Not sign in page')
    context.login_page.fill_login_email(context)
    context.login_page.fill_login_pass(context)
    context.login_page.click_login_btn()

@step('The user clicks profile button to go to account configurations')
def step_impl(context):
    time.sleep(5)
    BaseClass(context.browser).navigate_to(context.base_url + 'account/password/edit')
    time.sleep(5)

@step('The user types the current password')
def step_impl(context):
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    time.sleep(2)
    context.current_password = os.getenv('CURRENT_PASSWORD_PWD')
    context.security_page.fill_current_password(context)
    time.sleep(2)

@step('The user types the new password')
def step_impl(context):
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    time.sleep(2)
    context.password = os.getenv('NEW_PASSWORD_PWD')
    context.security_page.fill_new_password(context)
    time.sleep(2)

@step('The user types the new password to confirm')
def step_impl(context):
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    time.sleep(2)
    context.password = os.getenv('NEW_PASSWORD_PWD')
    context.security_page.fill_new_password_confirm(context)
    time.sleep(2)

@step('The user click update password button')
def step_impl(context):
    context.security_page.click_update_button()
    time.sleep(2)

@step('The user log in with new credentials')
def step_impl(context):
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    context.email = os.getenv('EMAIL_PWD')
    context.password = os.getenv('NEW_PASSWORD_PWD')
    time.sleep(5)
    context.login_page.fill_login_email(context)
    context.login_page.fill_login_pass(context)
    context.login_page.click_login_btn()
    time.sleep(2)

@step('The user logs out')
def step_impl(context):
    time.sleep(2)
    BaseClass(context.browser).navigate_to(context.base_url + 'users/sign_out')
    time.sleep(4)

@step('The user try to log in with old credentials')
def step_impl(context):
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    context.email = os.getenv('EMAIL_PWD')
    context.password = os.getenv('CURRENT_PASSWORD_PWD')
    context.login_page.fill_login_email(context)
    context.login_page.fill_login_pass(context)
    context.login_page.click_login_btn()

@step('The user restores the old password')
def step_impl(context):
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    context.current_password = os.getenv('NEW_PASSWORD_PWD')
    context.security_page.fill_current_password(context)
    context.password = os.getenv('CURRENT_PASSWORD_PWD')
    context.security_page.fill_new_password(context)
    context.security_page.fill_new_password_confirm(context)
    context.security_page.click_update_button()
    time.sleep(1)


@step('The user validates the required fields')
def step_impl(context):
    time.sleep(2)
    is_validation_ok = context.security_page.is_error_visible()
    assert_that( is_validation_ok, equal_to(True),
                'Not change password page')
    
@step('The user types wrong current password')
def step_impl(context):
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    context.password = "WrongPass1"
    context.security_page.fill_current_password(context)

@step('The user types short new password')
def step_impl(context):
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    context.password = "test"
    context.security_page.fill_new_password(context)
    context.security_page.fill_new_password_confirm(context)

@step('The user types different password confirmation')
def step_impl(context):
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    context.password = "testdiff"
    context.security_page.fill_new_password_confirm(context)