class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.60"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.60/aarch64-apple-darwin.tar.gz"
      sha256 "50caae56eb5ce4a80e389a0fce4ede5ed7b7e6c1bb37886ce757638b8f040e4a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.60/x86_64-apple-darwin.tar.gz"
      sha256 "9bf54b4c283ed7cc466df47ddb77e881c61edc4cd65b94dc8078ddeee7bb728e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.60/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "28155ffb004d464602f34938ae6ef7a360a61dc55fcb55996834ae14c222ca05"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.60/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59e783ddcaab25e08697161e9afbd43b1fc874b189e988167569dcfdd756fe7b"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
