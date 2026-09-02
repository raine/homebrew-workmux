class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.253"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.253/workmux-darwin-arm64.tar.gz"
      sha256 "0f7dc302f192ac30972aff919277c0ce4c0acf81e3407ab058f812eeb15c8ba6"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.253/workmux-darwin-amd64.tar.gz"
      sha256 "cba97a51ba53e1818616ad21e97bdb9ba4b53aeab3358e20a54e7ba0fee2ea70"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.253/workmux-linux-arm64.tar.gz"
      sha256 "a6d4a0e28c8597b237d6d39c51098a25698a3ffb414a0e7cf19dcf7224f814f4"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.253/workmux-linux-amd64.tar.gz"
      sha256 "05a421e7dab6cef9953bf07b2e8439014dabc5a1351d378f7631ba8844ab90a9"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
