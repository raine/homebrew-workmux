class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.114"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.114/workmux-darwin-arm64.tar.gz"
      sha256 "c4848fd3e2eb62ab280a94520d0e666aa98583842052af50466092788f4e58c6"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.114/workmux-darwin-amd64.tar.gz"
      sha256 "e7336c0d6a0b1f271f64f473edfe33b487ed66ed1c6cce2c243cb1141fdc34ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.114/workmux-linux-arm64.tar.gz"
      sha256 "f2f1ad3be6c90ce3d303c22cac208c589114c61349061e8316ec55bcbd832196"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.114/workmux-linux-amd64.tar.gz"
      sha256 "bab347ac9d2db22aed437b23b59cf2e3f7eb72c696cba01f18f36f12cb52bf71"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
