class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.157"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.157/workmux-darwin-arm64.tar.gz"
      sha256 "445a6a3cb43a975e7b8dcb13007e4d268d0f78b3dbc0cf44ecb5cb505cb5c4a6"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.157/workmux-darwin-amd64.tar.gz"
      sha256 "d8ed71ed57e20ab4dceab276383003861e29a071ff6decc360c92e620a9c53b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.157/workmux-linux-arm64.tar.gz"
      sha256 "b1c03207babd567344f50cbaf235388e14c372b79846a6517b8693d723105ecf"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.157/workmux-linux-amd64.tar.gz"
      sha256 "7e18e4d15cf5a1772d95f50232820f07ae948ead42dad893a0dff0cdc60c2175"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
