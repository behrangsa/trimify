require File.dirname(__FILE__) + '/spec_helper'

describe Grobie::Trimify do

  it "should add a class method to activerecord" do
    User.methods.should include("trimify")
  end

  it "should allow multiple trimify calls" do
    Category.trimify_attributes.should == { :title => { :nilify => true }, :description => { :nilify => true } }
  end

  it "should bequest trimify attributes" do
    SpecializedUser.trimify_attributes.should == { 
      :first_name => { :nilify => true }, 
      :middle_name => { :nilify => true },
      :last_name => { :nilify => false }
    }
  end

  it "should not raise an exception for a non existing table" do
    expect { require "fixtures/no_table" }.to_not raise_error(ActiveRecord::StatementInvalid)
  end

  describe "when trimifying possible attributes" do
    before(:each) do
      @user = User.new(:first_name => " Shompet ", :middle_name => " ", :last_name => "", :salary => 0, :birthday => Time.at(0))
      @user.valid?
    end

    it "should trim leading and trailing white spaces" do
      @user.first_name.should == "Shompet"
    end
    
    it "should nilify strings that are trimmed down to a blank string" do
      @user.middle_name.should be_nil
    end
    
    it "should not nilify strings that are trimmed down to a blank string if :nilify is set to false" do
      @user.last_name.should == ""
    end

    it "should not nilify not specified values" do
      user = User.new(:not_null => "")
      user.valid?
      user.not_null.should == ""
    end
  end

  describe "when calling nilify without attributes" do
    it "should do nothing" do
      post = Post.new(:name => "")
      post.valid?
      post.name.should == ""
    end
  end

end
