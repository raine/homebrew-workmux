class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.250"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.250/workmux-darwin-arm64.tar.gz"
      sha256 "a29145590c3acb4fed9413ff46b49218b6036e3730c884ef0eade7517f5dfc8b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.250/workmux-darwin-amd64.tar.gz"
      sha256 "34383c7ac316f3ca50172b33ceb530efda5410999ec5f0501d18774ec70a606f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.250/workmux-linux-arm64.tar.gz"
      sha256 "272151a1d9bcc2e502f454b1a40f7dbda35ea0059010a9e5c9cbc378ae805916"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.250/workmux-linux-amd64.tar.gz"
      sha256 "b82bd81638fa188419a9a2ddca815b333d1fc4ba4d9b4ee70fe44b7ce3677f59"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
