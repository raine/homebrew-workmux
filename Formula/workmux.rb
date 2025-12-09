class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.48/aarch64-apple-darwin.tar.gz"
      sha256 "8f893ad2bc9a9903bf8de93766c03d55557cce3647af9902254cd1984e37bef6"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.48/x86_64-apple-darwin.tar.gz"
      sha256 "4cba1fd4c018ab12ede4093f2f2cab203448c95436fb3eacb41f561a1240670e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.48/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "907be03b4036a8c847b85624787b6a3731ac33232793f3a7bbc89d096ca0821c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.48/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85ee3d76e341269c884b259439d2e585e0a89adb71b1e6831e07cdb460941628"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
