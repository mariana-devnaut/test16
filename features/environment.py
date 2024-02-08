import logging
import os
import allure
from allure_commons.types import AttachmentType
from features.browser import Browser
from utilities.env_parameters import set_params_from_execution, set_params_from_properties_file


def before_all(context):
    print("before_all")


def before_feature(context, feature):
    print("before_feature")


def before_scenario(context, scenario):
    context.browser = Browser(context).driver


def after_step(context, step):
    if step.status == 'failed':
        allure.attach(context.browser.get_screenshot_as_png(), name=f'Failed step: {step.name}',
                      attachment_type=AttachmentType.PNG)


def after_scenario(context, scenario):
    if 'browser' in context:
        context.browser.quit()


def after_all(context):
    print("after_all")
