class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.59"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.59/aarch64-apple-darwin.tar.gz"
      sha256 "fcfdad5f07fbce8ff1a0db211a6059e6ec302859c16b85b85bee32d0d0c2e61d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.59/x86_64-apple-darwin.tar.gz"
      sha256 "65572dd7977d0ef5f27c40167767b11421de4c311f778564af7a4c222309379b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.59/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "996fedcd983e9015e01a60f27c2c7c7e45c7ef95f6f3d3555c88df2537776810"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.59/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "39afe53668d98cd6dcda71e8cae04453b81a404fe54020c53a2f93199ca3ca85"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
