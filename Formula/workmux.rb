class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.241"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.241/workmux-darwin-arm64.tar.gz"
      sha256 "179e0014ef2ef1dddf02c80c6bcc03cbccae37f4ae94dd08ada940126d442e13"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.241/workmux-darwin-amd64.tar.gz"
      sha256 "d95bf77636713d45056f097ff666512282dd45f1028dcda215fa45900045bd5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.241/workmux-linux-arm64.tar.gz"
      sha256 "3d1b6e6be95770f21b3226d027d6d6db245265fd86269811301d25ff80406f09"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.241/workmux-linux-amd64.tar.gz"
      sha256 "63d2eb04279d1f6413faa1a12c5c2818b50f941b2e920556113f87d11bf143c8"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
