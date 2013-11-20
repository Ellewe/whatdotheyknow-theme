# If defined, ALAVETELI_TEST_THEME will be loaded in config/initializers/theme_loader
ALAVETELI_TEST_THEME = 'whatdotheyknow-theme'
require File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','..','spec','spec_helper'))

describe UserInfoRequestSentAlert, "when patched by the whatdotheyknow-theme" do

  it 'should allow an alert type of "survey_1"' do
    info_request_sent_alert = UserInfoRequestSentAlert.new(:alert_type => 'survey_1')
    info_request_sent_alert.valid?.should == true
  end

end

describe InfoRequest, "when creating an email subject for a request" do

    it 'should create a standard request subject' do
        info_request = FactoryGirl.build(:info_request)
        info_request.email_subject_request.should == "Freedom of Information request - #{info_request.title}"
    end

    it 'should create a special request subject for requests to the General Register Office' do
        info_request = FactoryGirl.build(:info_request)
        info_request.public_body.stub!(:url_name).and_return('general_register_office')
        info_request.email_subject_request.should == "Freedom of Information request GQ - #{info_request.title}"
    end

end
