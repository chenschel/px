# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Signin user in' do
  let(:john) { create(:user) }

  scenario 'with correct credentials' do
    visit('/')

    expect(page).to have_content(I18n.t('devise.sessions.new.sign_in'))

    click_link(I18n.t('devise.sessions.new.sign_in'))

    fill_in(I18n.t('activerecord.attributes.user.email'), with: john.email)
    fill_in(I18n.t('activerecord.attributes.user.password'), with: john.password)

    click_button(I18n.t('devise.sessions.new.sign_in'))
    expect(page).to have_content(I18n.t('devise.sessions.signed_in'))
    expect(page).not_to have_link(I18n.t('devise.sessions.new.sign_in'))
    expect(page).to have_link(I18n.t('sign_out'))
  end
end
