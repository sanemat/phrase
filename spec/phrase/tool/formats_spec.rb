require 'spec_helper'

describe Phrase::Tool::Formats do
  
  describe "#self.directory_for_locale_in_format(locale, format_name)" do
    let(:locale) { Phrase::Tool::Locale.new(name: "fooish", code: "foo-ish") }
    
    subject { Phrase::Tool::Formats.directory_for_locale_in_format(locale, format_name) }
    
    context "format is yaml" do
      let(:format_name) { "yml" }
      it { should eql("./") }
    end
    
    context "format is gettext" do
      let(:format_name) { "po" }
      it { should eql("./fooish/") }
    end
    
    context "format is gettext pot" do
      let(:format_name) { "pot" }
      it { should eql("./") }
    end
    
    context "format is xml" do
      let(:format_name) { "xml" }
      it { should eql("values-foo-rISH") }
    end
    
    context "format is strings" do
      let(:format_name) { "strings" }
      it { should eql("foo_ISH.lproj") }
    end
    
    context "format is xlf" do
      let(:format_name) { "xlf" }
      it { should eql("./") }
    end
    
    context "format is qph" do
      let(:format_name) { "qph" }
      it { should eql("./") }
    end
    
    context "format is ts" do
      let(:format_name) { "ts" }
      it { should eql("./") }
    end
    
    context "format is json" do
      let(:format_name) { "json" }
      it { should eql("./") }
    end
    
    context "format is resx" do
      let(:format_name) { "resx" }
      it { should eql("./") }
    end
    
    context "format is ini" do
      let(:format_name) { "ini" }
      it { should eql("./") }
    end
    
    context "format is properties" do
      let(:format_name) { "properties" }
      it { should eql("./") }
    end
    
    context "format is plist" do
      let(:format_name) { "plist" }
      it { should eql("./") }
    end
  end
  
  describe "#self.filename_for_locale_in_format(locale, format_name)" do
    let(:locale) { Phrase::Tool::Locale.new(name: "fooish", code: "foo-ish") }
    
    subject { Phrase::Tool::Formats.filename_for_locale_in_format(locale, format_name) }
    
    context "format is yaml" do
      let(:format_name) { "yml" }
      it { should eql("phrase.fooish.yml") }
    end
    
    context "format is gettext" do
      let(:format_name) { "po" }
      it { should eql("phrase.po") }
    end

    context "format is gettext pot" do
      let(:format_name) { "pot" }
      it { should eql("phrase.pot") }
    end
    
    context "format is xml" do
      let(:format_name) { "xml" }
      it { should eql("strings.xml") }
    end
    
    context "format is strings" do
      let(:format_name) { "strings" }
      it { should eql("Localizable.strings") }
    end
    
    context "format is xlf" do
      let(:format_name) { "xlf" }
      it { should eql("phrase.fooish.xlf") }
    end
    
    context "format is qph" do
      let(:format_name) { "qph" }
      it { should eql("phrase.fooish.qph") }
    end
    
    context "format is ts" do
      let(:format_name) { "ts" }
      it { should eql("phrase.fooish.ts") }
    end
    
    context "format is json" do
      let(:format_name) { "json" }
      it { should eql("phrase.fooish.json") }
    end
    
    context "format is resx" do
      let(:format_name) { "resx" }
      it { should eql("phrase.fooish.resx") }
    end
    
    context "format is ini" do
      let(:format_name) { "ini" }
      it { should eql("phrase.fooish.ini") }
    end
    
    context "format is properties" do
      let(:format_name) { "properties" }
      it { should eql("phrase.fooish.properties") }
    end
    
    context "format is plist" do
      let(:format_name) { "plist" }
      it { should eql("phrase.fooish.plist") }
    end
  end
  
  describe "#self.file_format_exposes_locale?(file_path)" do
    subject { Phrase::Tool::Formats.send(:file_format_exposes_locale?, file_path) }
    
    context "format = po" do
      let(:file_path) { "./fixtures/formats/translations.en.po" }
      
      it { should be_true }
    end
    
    context "format = pot" do
      let(:file_path) { "./fixtures/formats/translations.pot" }
      
      it { should be_false }
    end
  end
  
  describe "#self.handler_class_for_format(format_name)" do
    subject { Phrase::Tool::Formats.send(:handler_class_for_format, format_name) }
    
    context "format = yml" do
      let(:format_name) { "yml" }
      it { should == Phrase::Tool::Formats::Yaml }
    end
    
    context "format = po" do
      let(:format_name) { "po" }
      it { should == Phrase::Tool::Formats::Gettext }
    end

    context "format = pot" do
      let(:format_name) { "pot" }
      it { should == Phrase::Tool::Formats::GettextPot }
    end
    
    context "format = xml" do
      let(:format_name) { "xml" }
      it { should == Phrase::Tool::Formats::Xml }
    end
    
    context "format = strings" do
      let(:format_name) { "strings" }
      it { should == Phrase::Tool::Formats::Strings }
    end
    
    context "format = xlf" do
      let(:format_name) { "xlf" }
      it { should == Phrase::Tool::Formats::Xliff }
    end
    
    context "format = qph" do
      let(:format_name) { "qph" }
      it { should == Phrase::Tool::Formats::QtPhraseBook }
    end
    
    context "format = ts" do
      let(:format_name) { "ts" }
      it { should == Phrase::Tool::Formats::QtTranslationSource }
    end
    
    context "format = json" do
      let(:format_name) { "json" }
      it { should == Phrase::Tool::Formats::Json }
    end
    
    context "format = resx" do
      let(:format_name) { "resx" }
      it { should == Phrase::Tool::Formats::Resx }
    end
    
    context "format = ini" do
      let(:format_name) { "ini" }
      it { should == Phrase::Tool::Formats::Ini }
    end
    
    context "format = properties" do
      let(:format_name) { "properties" }
      it { should == Phrase::Tool::Formats::Properties }
    end
        
    context "format = plist" do
      let(:format_name) { "plist" }
      it { should == Phrase::Tool::Formats::Plist }
    end
  end
end
