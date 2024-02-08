import os

from behave import *
from dotenv import load_dotenv


@step('The user types the company legal name to approve')
def step_impl(context):
    context.legal_name = "Approvals Account Test"
    context.onboarding_page.step1_fill_legal_name(context)

@step('I log in with a valid email as an admin')
def step_impl(context):
    dotenv_path = os.environ['VIRTUAL_ENV'] + "/.env"
    load_dotenv(dotenv_path)
    context.email = os.getenv('EMAILADMIN')
    context.password = os.getenv('PASSWORDADMIN')
    context.login_page.fill_login_email(context)
    context.login_page.fill_login_pass(context)
    context.login_page.click_login_btn()
