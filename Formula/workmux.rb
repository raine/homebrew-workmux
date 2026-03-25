class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.152"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.152/workmux-darwin-arm64.tar.gz"
      sha256 "95267a5015798bddd87a58c0bd2a61786c8382fb229fea6c7a9c7d732d268584"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.152/workmux-darwin-amd64.tar.gz"
      sha256 "91164a0773e61630a691a0f3ac44d9674d3f3015de47b974ad39c83adb5a8363"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.152/workmux-linux-arm64.tar.gz"
      sha256 "29009be3d2cf5041ba4039263e98aafd32e3efd02bb07268c2e8e8f318226281"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.152/workmux-linux-amd64.tar.gz"
      sha256 "acff7ea2ed88b1915c40979d8a7329a42a0ea67385ab7a5fcff8d62b4fe043fc"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
