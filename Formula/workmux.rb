class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.186"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.186/workmux-darwin-arm64.tar.gz"
      sha256 "1222307f325504ea3421a5bfe12e8f942053dc0634ce98a5b1fa5acaf6c22be0"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.186/workmux-darwin-amd64.tar.gz"
      sha256 "e9737f1475473672807559eef9266d211554f14553fa97bbcacd120838755ab6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.186/workmux-linux-arm64.tar.gz"
      sha256 "b93defade6b9597003d2cdafb984dc4bf7b121539d8aeba29510560bc12ec0d8"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.186/workmux-linux-amd64.tar.gz"
      sha256 "2bc1533ace26470c78e44735716de5344e56536d466f4af4777180969c2c5fff"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
