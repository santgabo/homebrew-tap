class Usbfix < Formula
  desc "Inspect, repair, and format USB drives on macOS"
  homepage "https://github.com/santgabo/USBfixertool-CLI"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/santgabo/USBfixertool-CLI/releases/download/v0.1.1/usbfix_0.1.1_darwin_arm64.tar.gz"
      sha256 "2bd445aa79ad2c74d0a590a189e6b2ec6c829a97fa29fcddd1546abbd0d2b101"
    end

    on_intel do
      url "https://github.com/santgabo/USBfixertool-CLI/releases/download/v0.1.1/usbfix_0.1.1_darwin_amd64.tar.gz"
      sha256 "3d27c8ed0ecb6cbd87350a87ec29d36e00ce5cbae3ba7c41903cd9412eb2bc86"
    end
  end

  def install
    bin.install "usbfix"
  end

  test do
    assert_match "usbfix v#{version}", shell_output("#{bin}/usbfix version")
  end
end
