class Usbfix < Formula
  desc "Inspect, repair, and format USB drives on macOS"
  homepage "https://github.com/santgabo/USBfixertool-CLI"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/santgabo/USBfixertool-CLI/releases/download/v0.1.1/usbfix_0.1.1_darwin_arm64.tar.gz"
      sha256 "ce450df1b1f72b7610eb2f49c1c75da16bece1b2734073895b89b1662284c01a"
    end

    on_intel do
      url "https://github.com/santgabo/USBfixertool-CLI/releases/download/v0.1.1/usbfix_0.1.1_darwin_amd64.tar.gz"
      sha256 "67e9025ce464d3f052fd4b670386b5da176436af3070120a1d87042dd9230dcb"
    end
  end

  def install
    bin.install "usbfix"
  end

  test do
    assert_match "usbfix v#{version}", shell_output("#{bin}/usbfix version")
  end
end
