require_relative 'test_helper'

module MeducationSDK
  class MockerTest < Minitest::Test

    def test_mock_switches_classes
      MeducationSDK.mock!
      assert MeducationSDK.const_defined?(:MediaFileOriginal)
      assert MeducationSDK.const_defined?(:MediaFile)
      refute MeducationSDK.const_defined?(:MediaFileMock)
    ensure
      MeducationSDK::Mocker.unmock!
    end

    def test_mock_substitutes_in_mock_classes
      MeducationSDK.mock!

      id = 5
      Loquor::HttpAction::Get.expects(:get).never
      assert id, MediaFile.find('id').id
    ensure
      MeducationSDK::Mocker.unmock!
    end

    def test_mock_sample_returns_media_file_with_attributes
      MeducationSDK.mock!

      media_file = MediaFile.sample
      assert_equal media_file.title, "Abdominal Ultrasound Tutorial"
    ensure
      MeducationSDK::Mocker.unmock!
    end
  end
end
