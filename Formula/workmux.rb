class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.202"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.202/workmux-darwin-arm64.tar.gz"
      sha256 "602b69dfc9749e65dc72b7d308c2eed0211a118878376fcdddd5dccd10d6c36a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.202/workmux-darwin-amd64.tar.gz"
      sha256 "e151550b25fbc25b010e74a092021357e336d5db4b5b2fabd2ff7249d13c61cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.202/workmux-linux-arm64.tar.gz"
      sha256 "e41809b25071799325dad07c1851cc2b690556d01aaac681f1da2849337a95e7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.202/workmux-linux-amd64.tar.gz"
      sha256 "5df28033a307d353999cf87a4dee27a58d3257c684862a29b1121dc7a15c3a98"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
