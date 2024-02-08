from behave import *
from hamcrest import assert_that, equal_to, is_, contains_string
from pages.login_page import LoginPage
from pages.forgot_pwd_page import ForgotPasswordPage
from pages.base_class import BaseClass
from pages.common_commands import CommonCommands
from pages.menu_page import MenuPage
from pages.card_page import CardPage
from pages.people_page import PeoplePage
from pages.signup_page import SignUp
import os
from dotenv import load_dotenv
import time

name = CommonCommands.get_random_name()
last_name = CommonCommands.get_random_name()


@step('The login loads correctly and goes to people section')
def step_impl(context):
    #Load env variables
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
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
    context.people_page = PeoplePage(context.browser)
    context.signup_page = SignUp(context.browser)

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

    #Go to people section
    context.menu_page.click_people_option()
    
@step('The users want to add a person')
def step_impl(context):
    time.sleep(2)
    context.people_page.click_add_person_button()
    time.sleep(3)

@step('The user types the new user name')
def step_impl(context):
    context.name = name
    context.people_page.fill_name_input(context)

@step('The user types the new user last name')
def step_impl(context):
    context.last_name = last_name
    context.people_page.fill_last_name_input(context)

@step('The user types the new user email')
def step_impl(context):
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    #context.email = os.getenv('USER_EMAIL')
    email = CommonCommands.get_random_email()
    context.email = email
    context.people_page.fill_email_input(context)

@step('The user selects "{role}" as the role for the user')
def step_impl(context, role):  
    context.role = role
    context.people_page.select_role(context)

@step('The user types the new user cellphone')
def step_impl(context):
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    context.cellphone = '123456789'
    context.people_page.fill_cellphone_input(context)

@step('The user selects "{type_of_id}" as the type of id for the user')
def step_impl(context, type_of_id):  
    context.type_of_id = type_of_id
    context.people_page.select_type_of_id(context)

@step('The user types the new user id number')
def step_impl(context):
    dotenv_path =  os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    context.id_number = '123456'
    context.people_page.fill_id_number_input(context)

@step('The users sends the email')
def step_impl(context):
    context.people_page.click_send_button()
    time.sleep(2)
    is_visible  = context.people_page.is_notification_visible()
    assert_that(is_visible, equal_to(True),'Error is not displayed')

@step('The users click send email button')
def step_impl(context):
    context.people_page.click_send_button()

@step('The user should see an error displayed below the input in invite people form')
def step_impl(context):
    time.sleep(2)
    is_visible  = context.people_page.is_error_visible()
    assert_that(is_visible, equal_to(True),'Error is not displayed')
    time.sleep(1)

@step('The user accept the invitation')
def step_impl(context):
     context.people_page.click_continue_button()
     context.people_page.click_last_pagination()
     invitation_url = context.people_page.get_invitation_link()
     BaseClass(context.browser).navigate_to("https://staging.tuily.co/users/sign_out")
     time.sleep(2)
     BaseClass(context.browser).navigate_to(invitation_url)
     time.sleep(4)
     
@step('Homepage and title should be displayed')
def step_impl(context):
     time.sleep(2)
     is_visible  = context.people_page.is_home_title_visible()
     assert_that(is_visible, equal_to(True),'Title is not displayed')

@step('Verify role default value - "{role}"')
def step_impl(context, role):
     time.sleep(2)
     dropdown_default_role  = context.people_page.get_default_role()
     assert_that(dropdown_default_role, equal_to(role),'Deafult role is not ok')


@step('The user goes to edit page')
def step_impl(context):
    context.people_page.click_continue_button()
    context.people_page.click_last_pagination()
    context.people_page.click_edit_button()
     
@step('The user types the custom user name - "{name}"')
def step_impl(context, name):
    if name == "empty":
        context.name = ""
    else:
        context.name = name
    context.people_page.fill_name_input(context)

@step('The user types the custom user last name - "{last_name}"')
def step_impl(context, last_name) :
    
    if last_name == "empty":
        context.last_name = ""
    else:
        context.last_name = last_name
    context.people_page.fill_last_name_input(context)

@step('The user types the custom user email - "{email}"')
def step_impl(context, email):
    
    if email == "empty":
        context.email = ""
    else:
        context.email = email
    context.people_page.fill_email_input(context)

@step('The user types the custom user id number - "{id_number}"')
def step_impl(context, id_number):
    
    if id_number == "empty":
         context.id_number = ""
    else:
        context.id_number = id_number
    context.people_page.fill_id_number_input(context)

@step('Verify scenario result - "{scenario}"')
def step_impl(context, scenario):
    if scenario == "success":
        is_visible = context.people_page.is_edit_notification_visible()
        assert_that(is_visible, equal_to(True),'People was not edited')
    elif scenario == "error":
        is_visible  = context.people_page.is_error_visible()
        assert_that(is_visible, equal_to(True),'Error is not displayed')

@step('The user click edit button')
def step_impl(context):
    context.people_page.click_update_invitation_button()