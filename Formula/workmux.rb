class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.132"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.132/workmux-darwin-arm64.tar.gz"
      sha256 "131f3c16d75eecfa114d8558a2ee947e1826b95b5ad4e0895b8de56c4478a63c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.132/workmux-darwin-amd64.tar.gz"
      sha256 "a62a0bcc8666cbdc99a47c2a8deffe4f4cd2f3f773b67cfdb9a0937284ecf789"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.132/workmux-linux-arm64.tar.gz"
      sha256 "09acf7e5efdd28504f44414f86d6002b3e1dbb66e9fcb4aebd175bfdf6deb498"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.132/workmux-linux-amd64.tar.gz"
      sha256 "9ff3aed8e698ee4684a6a62a57fc2cf7ad348cdd72838f8a0b58cb2adcf70b74"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
