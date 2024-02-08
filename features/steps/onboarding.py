from behave import *
from hamcrest import assert_that, equal_to, is_, contains_string
from pages.login_page import LoginPage
from pages.base_class import BaseClass
from pages.signup_page import SignUp
from pages.common_commands import CommonCommands
from pages.onboarding_page import Onboarding
from pages.home_page import HomePage
import time
import os

absolute_path = os.path.dirname(__file__)


valid_pdf_file    = os.path.join(absolute_path,'files/file_pdf.pdf')
invalid_png_file  = os.path.join(absolute_path,'files/file_image.png')
invalid_mov_file  = os.path.join(absolute_path,'files/file_video.mov')
invalid_docx_file = os.path.join(absolute_path,'files/file_docx.docx')
  
@step('The user creates an account and start the onboarding process')
def step_impl(context):
    context.base_url = 'https://staging.tuily.co/'
    context.login_page = LoginPage(context.browser)
    context.signup_page = SignUp(context.browser)
    context.onboarding_page = Onboarding(context.browser)
    context.common_commands = CommonCommands(context.browser)
    context.home_page = HomePage(context.browser)
    BaseClass(context.browser).navigate_to(context.base_url)
    context.email = CommonCommands.get_random_email()
    context.first_name = "Test"
    context.last_name = "Test"
    context.password = "Staging01!"

    context.login_page.click_signup_link()
    context.signup_page.fill_signup_name(context)
    context.signup_page.fill_signup_lastname(context)
    context.signup_page.fill_signup_email(context)
    context.signup_page.fill_password_input(context)
    context.signup_page.click_terms_checkbox()
    context.signup_page.click_personaldata_checkbox()
    context.signup_page.click_digitalsignature_checkbox()
    context.signup_page.click_createaccount_btn()
  
@step('The onboarding page loads correctly')
def step_impl(context):
    context.expected_url = 'registration_forms'
    is_url_valid = context.common_commands.get_current_url(context)
    assert_that( is_url_valid, equal_to(True),
                'Not onboarding page')
    
@step('The user types the admin email')
def step_impl(context):
    context.admin_email = CommonCommands.get_random_email()
    context.onboarding_page.step0_fill_admin_email(context)

@step('The user types the company legal name')
def step_impl(context):
    context.legal_name = "test" 
    context.onboarding_page.step1_fill_legal_name(context)

@step('The user types the comercial name')
def step_impl(context):
    context.comercial_name = "test"
    context.onboarding_page.step1_fill_comercial_name(context)

@step('The user types a valid nit')
def step_impl(context):
    context.nit = "123456789" 
    context.onboarding_page.step1_fill_nit(context)

@step('The user types the web page')
def step_impl(context):
    context.webpage = "test" 
    context.onboarding_page.step1_fill_webpage(context)

@step('The user types the phone number')
def step_impl(context):
    context.phone = "123456789" 
    context.onboarding_page.step1_fill_phone(context)

@step('The user types the billing email')
def step_impl(context):
    context.billing_email = CommonCommands.get_random_email()
    context.onboarding_page.step1_fill_billing_email(context)
    

@step('The user types the neighborhood')
def step_impl(context):
    context.neighborhood = "test" 
    context.onboarding_page.step1_fill_neighborhood(context)

@step('The user types the street name')
def step_impl(context):
    context.street_name = "test" 
    context.onboarding_page.step1_fill_streetname(context)

@step('The user types the street crossing')
def step_impl(context):
    context.street_crossing = "test" 
    context.onboarding_page.step1_fill_streetcrossing(context)

@step('The user types the street number')
def step_impl(context):
    context.street_number = "test" 
    context.onboarding_page.step1_fill_streetnumber(context)

@step('The doesnt need the street number')
def step_impl(context):
    context.onboarding_page.step1_click_withoutnumber()

@step('The user types the additional info')
def step_impl(context):
    context.additional_info = "test" 
    context.onboarding_page.step1_fill_additional_info(context)

@step('The user types the zip code')
def step_impl(context):
    context.zip_code = "test" 
    context.onboarding_page.step1_fill_zipcode(context)

@step('The user continues to the next step')
def step_impl(context):
    context.onboarding_page.click_next_button()


@step('The user skip to the third step')
def step_impl(context):
    time.sleep(3)
    context.onboarding_page.step2_click_skip_button()
    time.sleep(3)

@step('The step 1 is succesfully completed')
def step_impl(context):
    context.expected_url = 'applicant_details'
    is_url_valid = context.common_commands.get_current_url(context)
    assert_that( is_url_valid, equal_to(True),
                'Not in second step')
    
@step('Validation is displayed and user stays in onboarding page')
def step_impl(context):
    context.expected_url = 'registration_forms'
    is_url_valid = context.common_commands.get_current_url(context)
    assert_that( is_url_valid, equal_to(True),
                'Not onboarding page')
    time.sleep(15)
    
@step('The user uploads a valid RUT file')
def step_impl(context):
    context.onboarding_page.step3_upload_1(valid_pdf_file)
    time.sleep(2)


@step('The user uploads a valid comercial file')
def step_impl(context):
    context.onboarding_page.step3_upload_2(valid_pdf_file)
    time.sleep(3)


@step('The user uploads a valid composition file')
def step_impl(context):
    context.onboarding_page.step3_upload_3(valid_pdf_file)
    time.sleep(3)






@step('The user is not the legal representative, types an email and goes to step 5')
def step_impl(context):
    context.representative_email = CommonCommands.get_random_email()
    context.onboarding_page.step4_click_legal_representative_checkbox()
    context.onboarding_page.step4_type_representative_email(context)
    context.onboarding_page.step4_click_next_button()
    time.sleep(2)

@step('The user uploads a valid first month bank statement file')
def step_impl(context):
    context.onboarding_page.step5_upload_1(valid_pdf_file)
    time.sleep(2)

@step('The user uploads a valid second month bank statement file')
def step_impl(context):
    context.onboarding_page.step5_upload_2(valid_pdf_file)
    time.sleep(2)   

@step('The user uploads a valid third month bank statement file')
def step_impl(context):
    context.onboarding_page.step5_upload_3(valid_pdf_file)
    time.sleep(2)

@step('The user uploads a valid 2 years old financial statement file')
def step_impl(context):
    context.onboarding_page.step5_upload_4(valid_pdf_file)
    time.sleep(2)

@step('The user uploads a valid 1 years old financial statement file')
def step_impl(context):
    context.onboarding_page.step5_upload_5(valid_pdf_file)
    time.sleep(2)

@step('The user uploads a valid current year financial statement file')
def step_impl(context):
    context.onboarding_page.step5_upload_6(valid_pdf_file)
    time.sleep(2)

@step('The user uploads a valid income statement file')
def step_impl(context):
    context.onboarding_page.step5_upload_7(valid_pdf_file)
    time.sleep(2)

@step('The user goes to step 6')
def step_impl(context):
    context.onboarding_page.step5_click_next_button()
    time.sleep(2)

@step('The user finish the onboarding process')
def step_impl(context):
    #context.onboarding_page.step6_click_next_button()
    time.sleep(1)
    context.onboarding_page.step6_click_finish_button()
    time.sleep(1)

@step('The user should see the homepage')
def step_impl(context):
    context.home_page.click_burger_menu()
    time.sleep(1)

@step('The user should see an error displayed below the input')
def step_impl(context):
    time.sleep(2)
    is_visible  = context.onboarding_page.is_error_visible()
    assert_that(is_visible, equal_to(True),
                'Error is not displayed')
    #is_finish_button_visible  = context.onboarding_page.step6_finish_button_visibility()
    #assert_that(is_finish_button_visible, equal_to(False),'Finish button is visible, should not be visible')
    time.sleep(1)
    
@step('The user uploads a invalid RUT file - "{type}"')
def step_impl(context, type):
    if(type == 'png'):
        context.onboarding_page.step3_upload_1(invalid_png_file)
    elif(type == 'mov'):
        context.onboarding_page.step3_upload_1(invalid_mov_file)
    elif(type == 'docx'):
        context.onboarding_page.step3_upload_1(invalid_docx_file)
    time.sleep(2)

@step('The user uploads a invalid comercial file - "{type}"')
def step_impl(context, type):
    if(type == 'png'):
        context.onboarding_page.step3_upload_2(invalid_png_file)
    elif(type == 'mov'):
        context.onboarding_page.step3_upload_2(invalid_mov_file)
    elif(type == 'docx'):
        context.onboarding_page.step3_upload_2(invalid_docx_file)
    time.sleep(2)

@step('The user uploads a invalid composition file - "{type}"')
def step_impl(context, type):
    if(type == 'png'):
        context.onboarding_page.step3_upload_3(invalid_png_file)
    elif(type == 'mov'):
        context.onboarding_page.step3_upload_3(invalid_mov_file)
    elif(type == 'docx'):
        context.onboarding_page.step3_upload_3(invalid_docx_file)
    time.sleep(2)

@step('The user uploads a invalid first month bank statement file - "{type}"')
def step_impl(context, type):
    if(type == 'png'):
        context.onboarding_page.step5_upload_1(invalid_png_file)
    elif(type == 'mov'):
        context.onboarding_page.step5_upload_1(invalid_mov_file)
    elif(type == 'docx'):
        context.onboarding_page.step5_upload_1(invalid_docx_file)
    time.sleep(2)

@step('The user uploads a invalid second month bank statement file - "{type}"')
def step_impl(context, type):
    if(type == 'png'):
        context.onboarding_page.step5_upload_2(invalid_png_file)
    elif(type == 'mov'):
        context.onboarding_page.step5_upload_2(invalid_mov_file)
    elif(type == 'docx'):
        context.onboarding_page.step5_upload_2(invalid_docx_file)
    time.sleep(2)

@step('The user uploads a invalid third month bank statement file - "{type}"')
def step_impl(context, type):
    if(type == 'png'):
        context.onboarding_page.step5_upload_3(invalid_png_file)
    elif(type == 'mov'):
        context.onboarding_page.step5_upload_3(invalid_mov_file)
    elif(type == 'docx'):
        context.onboarding_page.step5_upload_3(invalid_docx_file)
    time.sleep(2)

@step('The user uploads a invalid 2 years old financial statement file - "{type}"')
def step_impl(context, type):
    if(type == 'png'):
        context.onboarding_page.step5_upload_4(invalid_png_file)
    elif(type == 'mov'):
        context.onboarding_page.step5_upload_4(invalid_mov_file)
    elif(type == 'docx'):
        context.onboarding_page.step5_upload_4(invalid_docx_file)
    time.sleep(2)

@step('The user uploads a invalid 1 years old financial statement file - "{type}"')
def step_impl(context, type):
    if(type == 'png'):
        context.onboarding_page.step5_upload_5(invalid_png_file)
    elif(type == 'mov'):
        context.onboarding_page.step5_upload_5(invalid_mov_file)
    elif(type == 'docx'):
        context.onboarding_page.step5_upload_5(invalid_docx_file)
    time.sleep(2)

@step('The user uploads a invalid current year financial statement file - "{type}"')
def step_impl(context, type):
    if(type == 'png'):
        context.onboarding_page.step5_upload_6(invalid_png_file)
    elif(type == 'mov'):
        context.onboarding_page.step5_upload_6(invalid_mov_file)
    elif(type == 'docx'):
        context.onboarding_page.step5_upload_6(invalid_docx_file)
    time.sleep(2)

@step('The user uploads a invalid income statement file - "{type}"')
def step_impl(context, type):
    if(type == 'png'):
        context.onboarding_page.step5_upload_7(invalid_png_file)
    elif(type == 'mov'):
        context.onboarding_page.step5_upload_7(invalid_mov_file)
    elif(type == 'docx'):
        context.onboarding_page.step5_upload_7(invalid_docx_file)
    time.sleep(2)

@step('The user clear the requester form')
def step_impl(context):
    context.onboarding_page.step2_clear_requester_name()
    context.onboarding_page.step2_clear_first_last_name()
    context.onboarding_page.step2_clear_document_number()
    context.onboarding_page.step2_clear_requester_phone()

@step('The user types the requester name')
def step_impl(context):
    context.requester_name = "requester_name" 
    context.onboarding_page.step2_fill_requester_name(context)

@step('The user types the requester first last name')
def step_impl(context):
    context.first_last_name = "first_last_name" 
    context.onboarding_page.step2_fill_first_last_name(context)

@step('The user types the requester document number')
def step_impl(context):
    context.document_number = "123456789" 
    context.onboarding_page.step2_fill_document_number(context)

@step('The user types the requester phone number')
def step_impl(context):
    context.requester_phone_number = "123456789" 
    context.onboarding_page.step2_fill_requester_phone(context)