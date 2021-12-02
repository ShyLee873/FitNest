require 'rails_helper'
RSpec.describe "GroupsControllers", type: :request do
    describe "get groups_path" do
        it "renders the index view" do
            FactoryBot.create_list(:group, 5)
            get groups_path
            expect(response).to render_template(:index)
        end
    end
    describe "get group_path" do 
        it "renders the :show view" do
            group = FactoryBot.create(:group)
            get group_path(id: group.id)
            expect(response).to render_template(:show)
        end
        it "redirects to the index path if group id is invalid" do
            get group_path(id: 5000)
            expect(response).to redirect_to groups_path
        end
    end
    describe "get new_user_path" do
        it "renders the :new template" do
            get new_group_path
            expect(response).to render_template(:new)
        end
    end
    describe "get edit_group_path" do
        it "renders the :edit template" do
            group = FactoryBot.create(:group)
            get edit_group_path(id: group.id)
            expect(response).to render_template(:edit)
        end
    end

    # Unsure why these tests return an error

    describe "post groups_path with valid data" do
        it "saves a new entry and redirects to the show path for the new group entry" do
            group_attributes = FactoryBot.attributes_for(:group)
            expect {post groups_path, params: {group: group_attributes }}.to change(Group, :count).by(1)
            expect(response).to redirect_to group_path(id: Group.last.id)
        end
    end
    describe "post groups_path with invalid data" do
        it "does not save an entry or redirect" do
            group_attributes = FactoryBot.attributes_for(:group)
            group_attributes.delete(:name)
            expect( post groups_path, params: {group: group_attributes}).not_to change(Group, :count)
            expect(response).to render_template(:new)
        end
    end
    describe "put group_path with valid data" do
        it "updates an entry and redirects to the show path for the group" do
            group = FactoryBot.create(:group, activity_type: "yoga")
            expect(group.activity_type).to eq("yoga")
            put group_path(group.id), params: {group:{activity_type: "SUP Yoga"}}
            group.reload
            expect(group.activity_type).to eq("SUP Yoga")
            expect(response).to redirect_to group_path(id: group.id)
        end
    end
    describe "put group_path with invalid data" do
        it "does not update the entry or redirect" do
            group = FactoryBot.create(:group)
            put group_path(group.id), params: {group: {senior: nil}}
            group.reload
            expect(group.senior).to_not eq(nil)
            expect(response).to render_template(:edit)
        end
    end
    describe "delete group record" do
        it "deletes a group record" do
            group = FactoryBot.create(:group)
            group.destroy
            expect(get group_path(id: group.id))
        end
    end
    
end