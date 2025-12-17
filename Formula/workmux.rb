class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.53"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.53/aarch64-apple-darwin.tar.gz"
      sha256 "480bafa934e6020f067b108d576f44898cf3eb985a78ea8c2fb29f86a3a2e63a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.53/x86_64-apple-darwin.tar.gz"
      sha256 "33d895dcbc6f8a30e994f07494e619f82ce6b6c816c0b7abf99b131966f0e446"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.53/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5608787a3f7016679787fdd2f1403b9c2856c69855f2c39aa86e508e96be9724"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.53/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d46562b6446a7615daee9c0b0454242efb4daaa2c57df0d455f541e37c326415"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
