class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.91"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.91/workmux-darwin-arm64.tar.gz"
      sha256 "c5abafefbdcbec67ec82c101b95ffa2499442797b564b480053e86f10f95ceb8"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.91/workmux-darwin-amd64.tar.gz"
      sha256 "5b5e5cc48fa77a77f055f0d530ec11faa62d7b17c48e3df53fc166b076582679"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.91/workmux-linux-arm64.tar.gz"
      sha256 "fb897948c83d4de5dd3485f04b84cef9f8d4d87dded5335cdc42578e1284c7d2"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.91/workmux-linux-amd64.tar.gz"
      sha256 "45c70e0f9b0b7769784c889b696acce18956a4dc4e81f08eda208721399fec75"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
