class Usbfix < Formula
  desc "Inspect, repair, and format USB drives on macOS"
  homepage "https://github.com/santgabo/USBfixertool-CLI"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/santgabo/USBfixertool-CLI/releases/download/v0.1.0/usbfix_0.1.0_darwin_arm64.tar.gz"
      sha256 "09494f2f21464ee5f578672e6b270796dc661c6395b0a22131f71f4c0fb877e4"
    end

    on_intel do
      url "https://github.com/santgabo/USBfixertool-CLI/releases/download/v0.1.0/usbfix_0.1.0_darwin_amd64.tar.gz"
      sha256 "215e0b440d8f59787ceb7e7ec2cf3f5275209ff17aec075b2c3acf2f73eefd4b"
    end
  end

  def install
    bin.install "usbfix"
  end

  test do
    assert_match "usbfix v#{version}", shell_output("#{bin}/usbfix version")
  end
end
