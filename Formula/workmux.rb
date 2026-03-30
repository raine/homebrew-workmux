class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.165"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.165/workmux-darwin-arm64.tar.gz"
      sha256 "865ee01b474669f68f50299f360a18f96a2f55c13698da462ab7b2fac10f3b69"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.165/workmux-darwin-amd64.tar.gz"
      sha256 "43ae45a692716a3c89a737813afd468241b409c9f142a08ac426db31f319e3c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.165/workmux-linux-arm64.tar.gz"
      sha256 "11bd5e4a95265dc0c09c8bb956fd14c2d4421ccafedcffeb291549cb9f6e36fb"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.165/workmux-linux-amd64.tar.gz"
      sha256 "8ca93a88b20ddc0020b904fb978d199c034aae33de7ac285c4836ba1c47daa8f"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
