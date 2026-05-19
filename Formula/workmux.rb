class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.209"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.209/workmux-darwin-arm64.tar.gz"
      sha256 "6bcc18d31aacac3d0fca67158dfcd3289bd33b75deac1f13afdc51117bc1e187"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.209/workmux-darwin-amd64.tar.gz"
      sha256 "b5e424a98fd4d34ea5a325e406d19376b61b968ed124d36c6f9967d6762e834e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.209/workmux-linux-arm64.tar.gz"
      sha256 "45bb0cdd1c407dec22e8e5d07b35fae348acb684265d208a624b0b12a0c138f2"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.209/workmux-linux-amd64.tar.gz"
      sha256 "0dc2951fe3236a0bec86595be8bc5a41aee751f7251de604458a993909f8a9aa"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
