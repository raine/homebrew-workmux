class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.67"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.67/workmux-darwin-arm64.tar.gz"
      sha256 "a7a2f7b477278ccba5fdc3a466b520c06790d00d78342bc1e8d2f88f48598b8a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.67/workmux-darwin-amd64.tar.gz"
      sha256 "755b896607e95b5b16caaba7bbd3432f18221dd5cfaf23731dcf5f1d02a7f167"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.67/workmux-linux-arm64.tar.gz"
      sha256 "f76bcdc261a0c7e9154773c29696d47d4b4efb4767ef742a4742b92c06d66cf5"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.67/workmux-linux-amd64.tar.gz"
      sha256 "e181d537a38cecb31752c531d7da177fdd490a144c052c9b1651a5c44d1233ca"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
